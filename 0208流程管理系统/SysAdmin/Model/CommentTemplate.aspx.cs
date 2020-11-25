using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower;
using System.Data;
using AllPower.Common;
using AllPower.Web.Admin;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      何伟
    创建时间： 2010年10月15日
    功能描述： 前台评论列表
 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Model
{
    public partial class CommentTemplate : AdminPage
    {
        #region 初始化参数
        protected string className = "";        //用户名和密码验证样式
        protected string userName = "";         //会员名
        BLL.Content.Comment bllComment = new AllPower.BLL.Content.Comment();
        BLL.MemberManage.Member bblMember = new AllPower.BLL.MemberManage.Member();

        private string strNewsId, strCategoryId;
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
        /// 所属的栏目ID
        /// </summary>
        public string StrCategoryId
        {
            get
            {
                if (strCategoryId == null)
                {
                    strCategoryId = Utils.ReqUrlParameter("CategoryId");
                }
                return strCategoryId;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();    //初始化绑定             
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
            if (dtCommentConfig.Rows.Count > 0)                                             //是否存在配置文件
            {
                TtCommentConfig = dtCommentConfig;
                if (!PageVerification(dtCommentConfig.Rows[0]))                             //如果返回true  证明验证没通过
                {
                    if (Utils.ParseBool(dtCommentConfig.Rows[0]["IsAuthcode"].ToString()))  //是否启用验证码
                    {
                        plcode.Visible = true;
                    }
                    if (Utils.ParseBool(dtCommentConfig.Rows[0]["IsScore"].ToString()))     //是否要评分
                    {
                        plScore.Visible = true;
                    }
                    if (Utils.ParseBool(dtCommentConfig.Rows[0]["IsUserSubmit"].ToString()))//是否只有会员才可以评论
                    {
                        className = "validate[required]";
                    }
                    else
                    {
                        string nameKey = SystemConst.COOKIE_USERNAME;                       //获取cookie中当前用户名的Key
                        if (!"".Equals(Utils.GetCookie(nameKey)))                           //加载用户名
                        {
                            userName = Utils.GetCookie(nameKey);
                        }
                        else
                        {
                            userName = "游客";
                        }
                    }
                }
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
                Utils.AlertJavaScript(this, "您的IP地址已经被限制提交表单,如有疑问,请联系管理员!");
                return true;
            }
            if (!Utils.ParseBool(drCommentConfig["IsEnable"]))  //是否启用
            {
                Utils.AlertJavaScript(this, "表单已经禁用!");
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
                        Utils.AlertJavaScript(this, "验证码输入错误,请重新输入!");
                        Session[SystemConst.SESSION_VALIDATECODE] = null;
                        return;
                    }
                }

                if (bllComment.IsSubmitVote(drCommentConfig["SubmitLimitTime"].ToString()))  //进行时间验证
                {
                    AllPower.Model.Content.Comment modelComment = new AllPower.Model.Content.Comment();
                    modelComment.Content = Utils.UrlEncode(txtDescribe.Text.Trim());
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

                    string uName = Request.Form["txtUserName"].ToString();      //会员名
                    string pwd = Request.Form["txtPwd"].ToString();             //密码
                    //初始化评论实例
                    modelComment.SiteId = SiteID.ToString();
                    modelComment.IP = Utils.GetIP();
                    modelComment.IsMember = false;
                    modelComment.NewsID = StrNewsId;
                    modelComment.CategoryId = StrCategoryId;
                    modelComment.NewsUrl = Request.Url.OriginalString;
                    modelComment.NodeId = NodeID;
                    modelComment.MemberId = "0";
                    modelComment.UserName = uName;
                    modelComment.AddMan = UserNo;

                    //判断会员登录,登录成功了就把会员ID,会员用户名保存
                    if (uName.Length > 0 && pwd.Length > 0)
                    {
                        string result = bblMember.MemberLogin(uName, pwd);          //登录返回结果
                        switch (result)
                        {
                            case "0":
                                Utils.AlertJavaScript(this, "用户名不存在！");
                                break;
                            case "1":
                                string strMessage = bllComment.Save("new", modelComment);       //保存评论信息
                                if (strMessage == "1")                                          //添加成功
                                {
                                    Response.Write("<script type='text/javascript'>alert('评论成功！');document.execCommand('Refresh');</script>");
                                }
                                else
                                {
                                    Utils.AlertJavaScript(this, Utils.GetResourcesValue("model", "AddError"));
                                }
                                break;
                            case "2":
                                Utils.AlertJavaScript(this, "用户名或密码输入错误！");
                                break;
                        }
                    }
                    else             //不需要登录
                    {
                        string strMessage = bllComment.Save("new", modelComment);       //保存评论信息
                        if (strMessage == "1")                                          //添加成功
                        {
                            Response.Write("<script type='text/javascript'>alert('评论成功！');document.execCommand('Refresh');</script>");
                        }
                        else
                        {
                            Utils.AlertJavaScript(this, Utils.GetResourcesValue("model", "AddError"));
                        }
                    }
                }
                else
                {
                    Utils.AlertJavaScript(this, "您的评论速度太快了,请在" + drCommentConfig["SubmitLimitTime"].ToString() + "分钟内评论一次!");
                }
            }
        }
        #endregion
    }
}