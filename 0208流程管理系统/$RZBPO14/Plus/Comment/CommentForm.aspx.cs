using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower;
using System.Data;
using AllPower.Common;
using System.Text;
using System.IO;
using AllPower.BLL.SysManage;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      何伟
    创建时间： 2010年10月15日
    功能描述： 前台评论表单模板
 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion

namespace AllPower.WEB.main.Plus.Comment
{
    public partial class CommentForm : System.Web.UI.Page
    {
        #region 初始化参数
        protected string className = "";            //用户名和密码验证样式
        protected string userName = "游客";         //会员名
        BLL.Content.Comment bllComment = new AllPower.BLL.Content.Comment();
        BLL.MemberManage.Member bblMember = new AllPower.BLL.MemberManage.Member();
        protected string jsMessage = string.Empty;
        private string strNewsId, nodeCode;

        /// <summary>
        /// 新闻ID
        /// </summary>
        public string StrNewsId
        {
            get
            {
                if (strNewsId == null)
                {
                    strNewsId = Utils.UrlDecode(Utils.ReqUrlParameter("NewsId"));
                }
                return strNewsId;
            }
        }

        /// <summary> 
        /// 所属的栏目节点编号
        /// </summary>
        public string NodeCode
        {
            get
            {
                if (nodeCode == null)
                {
                    nodeCode = Utils.ReqUrlParameter("NodeCode");
                }
                return nodeCode;
            }
        }

        /// <summary>
        /// CommentConfig临时缓存表
        /// </summary>
        public DataTable TtCommentConfig
        {
            set { ViewState["CommentConfig"] = value; }
            get { return ViewState["CommentConfig"] as DataTable; }
        }

        /// <summary>
        /// 分页页面参数
        /// </summary>       
        public string StrPageParams
        {
            get
            {
                string strPageParams = AllPower.Common.Utils.GetCookie(SystemConst.COOKIES_PAGE_KEY, Session.SessionID).Replace("|", "&");
                if (strPageParams.Length > 0)
                {
                    return "?" + strPageParams;
                }
                else
                {
                    return "";
                }
            }
        }

        //页面加载
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //初始化绑定             
                PageInit();
                PageData();
            }
        }
        #endregion

        #region 页面初始化加载
        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        void PageInit()
        {
            //首先从新闻中读取评论相关配置进行验证
            BLL.Content.CommentConfig bllCommentConfig = new AllPower.BLL.Content.CommentConfig();
            DataTable dtCommentConfig = bllCommentConfig.GetList("ONE", Utils.getOneParams("1"));
            if (dtCommentConfig.Rows.Count > 0)                                         //是否存在配置文件
            {
                TtCommentConfig = dtCommentConfig;
                if (Utils.ParseBool(dtCommentConfig.Rows[0]["IsAuthcode"].ToString()))  //是否启用验证码
                {
                    plcode.Visible = true;
                }
                if (Utils.ParseBool(dtCommentConfig.Rows[0]["IsScore"].ToString()))     //是否要评分
                {
                    plScore.Visible = true;
                }
                if (!Utils.ParseBool(dtCommentConfig.Rows[0]["IsShowFifth"].ToString())) //是否要显示前五条评论
                {
                    plFifth.Visible = false;
                }
                if (Utils.ParseBool(dtCommentConfig.Rows[0]["IsUserSubmit"].ToString()))//是否只有会员才可以评论
                {
                    className = "validate[required]";
                    this.plLogin.Visible = true;
                    this.plLoginAfter.Visible = false;
                }
                else
                {
                    string nameKey = SystemConst.COOKIE_USERNAME;                       //获取cookie中当前用户名的Key
                    if (!"".Equals(Utils.GetCookie(nameKey)))                           //加载用户名
                    {
                        userName = Utils.GetCookie(nameKey);
                    }
                }
                ltUserName.Text = userName;
            }
            dtCommentConfig.Dispose();
        }

        /// <summary>
        /// 初始化验证
        /// </summary>
        /// <param Name="drCommentConfig"></param>
        /// <returns></returns>
        bool PageVerification(DataRow drCommentConfig)
        {
            BLL.Content.ControlFormEdit bllFormEdit = new AllPower.BLL.Content.ControlFormEdit();
            if (bllFormEdit.isLimitIP(drCommentConfig["SubmitLimitIP"].ToString()))  //如果存在此ip段中,则不让他进入 
            {
                jsMessage = "alert(\"您的IP地址已经被限制提交表单,如有疑问,请联系管理员!\")";
                return true;
            }
            if (!Utils.ParseBool(drCommentConfig["IsEnable"]))  //是否启用
            {
                jsMessage = "alert(\"表单已经禁用!\");";
                return true;
            }
            return false;
        }

        #endregion

        #region 提交
        //提交新闻评论
        protected void btnSave_Click(object sender, EventArgs e)
        {
            DataRow drCommentConfig = TtCommentConfig.Rows[0];
            if (!PageVerification(drCommentConfig))                  //验证是否通过
            {
                if (Utils.ParseBool(drCommentConfig["IsAuthcode"]))  //是否要验证码
                {
                    //先进行验证码的判断,看输入是否正确,不确定则退出
                    if (Utils.ReqFromParameter("validate").ToLower() != Session[SystemConst.SESSION_VALIDATECODE].ToString().ToLower())
                    {
                        jsMessage = "alert(\"验证码输入错误,请重新输入!\");";
                        Session[SystemConst.SESSION_VALIDATECODE] = null;
                        return;
                    }
                }

                if (bllComment.IsSubmitVote(drCommentConfig["SubmitLimitTime"].ToString()))  //进行时间验证
                {
                    //评论的实体
                    AllPower.Model.Content.Comment modelComment = new AllPower.Model.Content.Comment();

                    modelComment.Content = this.txtDescribe.Text.Trim();
                    string[] strTableIdOrOrders = GetTableID("0", "K_Comment");
                    modelComment.ID = strTableIdOrOrders[0];
                    modelComment.Orders = Utils.ParseInt(strTableIdOrOrders[1], 50);
                    if (Utils.ParseBool(drCommentConfig["IsScore"].ToString()))             //是否要评分
                    {
                        modelComment.Score = Utils.ParseInt(rbtlScore.SelectedValue, 5);
                    }
                    else
                    {
                        modelComment.Score = 0;
                    }

                    string uName = "";              //会员名
                    string pwd = "";                //密码
                    //如果要登录
                    if (plLogin.Visible == true)
                    {
                        uName = Request.Form["txtUserName"].ToString();
                        pwd = Request.Form["txtPwd"].ToString();
                    }

                    //初始化评论实例
                    modelComment.AddDate = System.DateTime.Now;
                    modelComment.CounterCount = 0;
                    modelComment.FlowState = 99;
                    modelComment.IsDel = false;
                    modelComment.IsEnable = true;
                    modelComment.NeutralCount = 0;
                    modelComment.SquareCount = 0;
                    modelComment.ViewType = 0;
                    modelComment.ReplyCount = 0;
                    modelComment.ReferenceId = "0";
                    modelComment.SiteId = SiteID.ToString();
                    modelComment.IP = Utils.GetIP();
                    modelComment.IsMember = false;
                    modelComment.NewsID = StrNewsId;
                    modelComment.CategoryId = NodeCode;
                    modelComment.NewsUrl = Request.Url.OriginalString;
                    modelComment.NodeId = NodeCode;
                    modelComment.MemberId = "";
                    modelComment.UserName = this.ltUserName.Text.Trim();
                    modelComment.AddMan = "Admin";

                    //判断会员登录,登录成功了就把会员ID,会员用户名保存
                    if (uName.Length > 0 && pwd.Length > 0 && plLogin.Visible == true)
                    {
                        string[] result = bblMember.MemberLogin(uName, pwd).Split('_');          //登录返回结果

                        //判断返回的会员ID是否为空
                        if (result[1].Length > 0)
                        {
                            modelComment.IsMember = true;
                            modelComment.MemberId = result[1];
                        }

                        //判断登录的结果，并提示相应的信息
                        switch (result[0])
                        {
                            case "0":
                                jsMessage = "alert(\"用户名不存在！\");";
                                break;
                            case "1":
                                //登录成功后，显示用户名并隐藏登录框
                                plLogin.Visible = false;
                                ltUserName.Text = uName;
                                plLoginAfter.Visible = true;
                                modelComment.UserName = uName;

                                string strMessage = bllComment.Save("SpecialNew", modelComment);       //保存评论信息
                                if (strMessage == "1")                                          //添加成功
                                {
                                    jsMessage ="alert('评论成功！');";
                                }
                                else
                                {
                                   jsMessage = "alert(\"" + Utils.GetResourcesValue("model", "AddError") + "\");";
                                }
                                break;
                            case "2":
                               jsMessage = "alert(\"用户名或密码输入错误！\")";
                                break;
                        }
                    }
                    else             //不需要登录
                    {
                        string strMessage = bllComment.Save("SpecialNew", modelComment);        //保存评论信息
                        if (strMessage == "1")                                                  //添加成功
                        {
                            jsMessage = "alert('评论成功！');";
                        }
                        else
                        {
                           jsMessage = "alert(\"" + Utils.GetResourcesValue("model", "AddError") + "\");";
                        }
                    }
                }
                else
                {
                    jsMessage = "alert(\"您的评论速度太快了,请在" + drCommentConfig["SubmitLimitTime"].ToString() + "分钟内评论一次!\");";
                }
            }
        }
        #endregion

        #region 获取当前站点的信息(ID，目录等)

        //获取当前站点的文件夹名称
        protected string GetSiteDir()
        {
            string path = Server.MapPath("../../config/SiteParam.config");
            string siteDir = Utils.XmlRead(path, "SiteParamConfig/SiteDir", "");
            if (siteDir.Length < 0)                     //如果站点目录为空时,通过ID从数据库中取
            {
                SysWebSite bllWebSite = new SysWebSite();
                DataTable dt = bllWebSite.GetList("ONE", Utils.getOneParams(SiteID.ToString()));
                siteDir = dt.Rows[0]["Directory"].ToString();
            }
            return siteDir;
        }

        //站点的ID
        public int SiteID
        {
            get
            {
                string path = Server.MapPath("../../config/SiteParam.config");
                string siteId = Utils.XmlRead(path, "SiteParamConfig/SiteID", "");
                if (siteId.Length > 0)
                {
                    return Utils.ParseInt(siteId, 1);
                }
                else
                {
                    Session.Abandon();
                    return 1;
                }
            }
            set
            {
                Session["SiteID"] = value;
            }
        }

        //获取站点文件夹
        private string _SiteDir;
        public string SiteDir
        {
            get
            {
                if (Session["SiteDir"] != null)
                {
                    this._SiteDir = Session["SiteDir"].ToString();
                }
                else
                {
                    this._SiteDir = GetSiteDir();
                    Session["SiteDir"] = this._SiteDir;
                }
                return this._SiteDir;
            }
            set { Session["SiteDir"] = value; }
        }
        #endregion

        #region 实现列表信息绑定

        /// <summary>
        /// 绑定
        /// </summary>
        private void PageData()
        {
            //获取信息列表
            DataTable dt = bllComment.GetList("COMMENTTOP", Utils.getTwoParams(StrNewsId, NodeCode)).Tables[0];
            //绑定
            if (dt.Rows.Count > 0)
            {
                rptModelFileGroup.DataSource = dt;
                rptModelFileGroup.DataBind();
            }
        }

        /// <summary>
        /// 获取按钮是否显示
        /// </summary>
        /// <param Name="strColumnName"></param>
        /// <returns></returns>
        public bool GetLinkButtonVisible(string strColumnName)
        {
            return Utils.ParseBool(TtCommentConfig.Rows[0][strColumnName].ToString());
        }

        /// <summary>
        /// 获取按钮文本
        /// </summary>
        /// <param Name="strColumnName"></param>
        /// <returns></returns>
        public string GetLinkButtonText(string strColumnName, string strCount)
        {
            return TtCommentConfig.Rows[0][strColumnName].ToString() + "[" + strCount + "]";
        }
        #endregion

        #region 投票的事件

        //投票
        protected void lbtnl_Click(object sender, CommandEventArgs e)
        {
            DataRow drCommentConfig = TtCommentConfig.Rows[0];
            string[] strArgs = Utils.strSplit(e.CommandArgument.ToString(), "|");
            if (Utils.ParseBool(drCommentConfig["is" + strArgs[1]].ToString())) //是否启用了投票
            {
                string lastVoteTime = Utils.GetCookie(SystemConst.COOKIE_COMMENT_Vote, strArgs[1]);
                if (lastVoteTime != "")  //如果有投过票,则要进行判断
                {
                    if (drCommentConfig["LimitTime"].ToString() == "0") //如果规定1台电脑只能投一次票 ,则因为已经投过,此处不能再投了
                    {
                        jsMessage = "alert(\"您已经投过票了,系统规定1台电脑只能投票一次!\");";
                        return;
                    }
                    else
                    {
                        if (Convert.ToDateTime(lastVoteTime).AddMinutes(Utils.ParseInt(drCommentConfig["LimitTime"], 0)).CompareTo(DateTime.Now) != -1)
                        {
                            jsMessage =  "alert(\"您的投票速度太快了,系统规定" + drCommentConfig["LimitTime"].ToString() + "分投票一次!\");";
                            return;
                        }
                    }
                }

                string strMessage = bllComment.CommentSet(strArgs[1], "", strArgs[0]);  //更新投票
                if (strMessage == "1") //投票成功
                {
                    Utils.WriteCookie(SystemConst.COOKIE_COMMENT_Vote, strArgs[1], DateTime.Now.ToString()); //保存这次投票的时间
                }
                PageData();
            }
            else
            {
                jsMessage = "alert(\"投票未开启\");";
            }
        }
        #endregion

        #region 获取NodeID

        //通过NodeCode和SiteID获取Nodeid
        private string GetNodeId()
        {
            string strResult = string.Empty;
            AllPower.BLL.SysManage.ModuleNode bll = new AllPower.BLL.SysManage.ModuleNode();
            DataTable dt = bll.GetModeNodeFromCache();
            DataRow[] dr = dt.Select("NodeCode='" + NodeCode + "' and webSiteID=" + SiteID);
            if (dr.Length > 0)
            {
                strResult = dr[0]["NodeID"].ToString();
            }
            return strResult;
        }
        #endregion

        #region 生成表主键
        /// <summary>
        /// 生成表主键（ID），未知表的最大排序号时使用此方法,返回数组，GetTableID[0]=ID，GetTableID[1]=排序号
        /// </summary>
        /// <param Name="isTop">是否置顶，0=否，1=是</param>
        /// <param Name="tableName">表名</param>
        /// <returns></returns>
        public string[] GetTableID(string isTop, string tableName)
        {
            string[] strNo = { "0", "0" };  //序列号

            string maxOrders = "";  //最大排序号码

            string strRandom = "";  //5位随机数 

            if (isTop != "1" && isTop != "0") //判断isTop是否是0和1，如果两者都不是将isTop置为0
            {
                isTop = "0";
            }

            maxOrders = AllPower.BLL.Public.Orders(tableName).ToString();

            System.Random a = new Random(int.Parse(maxOrders));
            strRandom = a.Next(10000, 100000).ToString();

            strNo[0] = (int.Parse(isTop) + 1).ToString() + maxOrders.ToString().PadLeft(9, '0') + strRandom;
            strNo[1] = maxOrders;
            return strNo;
        }
        #endregion
    }
}