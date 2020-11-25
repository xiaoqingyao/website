using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop;
using System.Data;
using KingTop.Common;
using KingTop.Web.Admin;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年4月22日
    功能描述： 前台评论列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class CommentTestList : AdminPage
    {
        string NodeId = "1"; //节点ID
        BLL.Content.Comment bllComment = new KingTop.BLL.Content.Comment();     
        /// <summary>
        /// 分页页面参数
        /// </summary>       
        public string StrPageParams
        {
            get
            {
                string strPageParams = KingTop.Common.Utils.GetCookie(SystemConst.COOKIES_PAGE_KEY, Session.SessionID).Replace("|", "&");
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
        #region 初始参数


        private string strKeySearch, strModelId, strNewsId, flowStateId;
        /// <summary> 
        /// 操作步骤
        /// </summary>
        public string FlowStateId
        {
            get
            {
                if (flowStateId == null)
                {
                    flowStateId = Utils.ReqUrlParameter("flowStateId");
                }
                return flowStateId;
            }
        }
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
        /// 查询字段
        /// </summary>
        public string StrKeySearch
        {
            get
            {
                if (strKeySearch == null)
                {
                    strKeySearch = Utils.UrlDecode(Utils.ReqUrlParameter("keySearch"));
                }
                return strKeySearch;
            }
        }
        /// <summary> 
        /// 下拉选中模型ID
        /// </summary>
        public string StrModelId
        {
            get
            {
                if (strModelId == null)
                {
                    strModelId = Utils.ReqUrlParameter("ModelId");
                }
                return strModelId;
            }
        }
        #endregion

        /// <summary>
        /// CommentConfig临时缓存表
        /// </summary>
        public DataTable TtCommentConfig {
            set { ViewState["CommentConfig"] = value; }
            get { return ViewState["CommentConfig"] as DataTable;  }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();    //初始化绑定             
            }
        }




        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        void PageInit()
        {
            //首先从新闻中读取是否评论 进行验证
            BLL.Content.CommentConfig bllCommentConfig = new KingTop.BLL.Content.CommentConfig();
            DataTable dtCommentConfig = bllCommentConfig.GetList("one", Utils.getOneParams("1"));
            if(dtCommentConfig.Rows.Count>0)  //是否存在配置文件
            {
                TtCommentConfig = dtCommentConfig;
                if (!PageVerification(dtCommentConfig.Rows[0])) //如果返回true  证明验证没通过
                {
                    if (Utils.ParseBool(dtCommentConfig.Rows[0]["IsAuthcode"].ToString()))  //是否启用验证码
                    {
                        plcode.Visible = true;
                    }
                    if (Utils.ParseBool(dtCommentConfig.Rows[0]["IsScore"].ToString()))  //是否要评分
                    {
                        plScore.Visible = true;
                    }
                    PageData();//分页绑定列表  
                }         
            }
            else
            {
                //输出错误 
            }
            dtCommentConfig.Dispose();
            //新闻绑定
            //lblAddtime.Text = 
            //Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中            
        }

        /// <summary>
        /// 初始化验证
        /// </summary>
        /// <param Name="drCommentConfig"></param>
        /// <returns></returns>
        bool PageVerification(DataRow drCommentConfig)
        {
            BLL.Content.ControlFormEdit bllFormEdit = new KingTop.BLL.Content.ControlFormEdit();
            if (bllFormEdit.isLimitIP(drCommentConfig["SubmitLimitIP"].ToString()))  //如果存在此ip段中,则不让他进入 
            {
                Utils.UrlRedirect(this, "", "您的IP地址已经被限制提交表单,如有疑问,请联系管理员!");
                return true;
            }
            if (!Utils.ParseBool(drCommentConfig["IsEnable"]))  //是否启用
            {
                Utils.UrlRedirect(this, "", "表单已经禁用!");
                return true;
            }
            
            //还要根据是否会员才能查看进行判断
            if (Utils.ParseBool(drCommentConfig["IsUserSubmit"]))  //只能会员才能查看
            {
                //判断是否登录,没登录则返回
                return true;
            }
            return false;
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
        public string GetLinkButtonText(string strColumnName,string strCount)
        {
            return TtCommentConfig.Rows[0][strColumnName].ToString()+"["+strCount+"]";
        }

        #region 分页
        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            PageData();
        }
        #endregion

        #region 实现列表信息绑定
        private void PageData()
        {
            Dictionary<string, string> dcWhere = new Dictionary<string, string>();
            dcWhere.Add("isdel", "0");
            dcWhere.Add("NewsId", StrNewsId);
            dcWhere.Add("nodeid",NodeCode);
            dcWhere.Add("FlowState", "99");
            dcWhere.Add("IsEnable", "0");
            KingTop.Model.Pager p = new KingTop.Model.Pager();
            p.DicWhere = dcWhere;
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptModelFileGroup;
            bllComment.PageData(p);
        }

        #endregion

        protected void lbtnl_Click(object sender, CommandEventArgs e)
        {
            DataRow drCommentConfig = TtCommentConfig.Rows[0];
            string[] strArgs = Utils.strSplit(e.CommandArgument.ToString(), "|");
            if (Utils.ParseBool(drCommentConfig["is"+strArgs[1]].ToString())) //是否启用了投票
            {  
                string lastVoteTime = Utils.GetCookie(SystemConst.COOKIE_COMMENT_Vote,strArgs[1]);
                if (lastVoteTime != "")  //如果有投过票,则要进行判断
                {
                  if (drCommentConfig["LimitTime"].ToString() == "0") //如果规定1台电脑只能投一次票 ,则因为已经投过,此处不能再投了
                  {
                      Utils.AlertJavaScript(this, "您已经投过票了,系统规定1台电脑只能投票一次!");  
                      return;
                  }
                  else
                  {
                      if(Convert.ToDateTime(lastVoteTime).AddMinutes(Utils.ParseInt(drCommentConfig["LimitTime"],0)).CompareTo(DateTime.Now)!=-1)
                      {
                          Utils.AlertJavaScript(this, "您的投票速度太快了,系统规定" + drCommentConfig["LimitTime"].ToString() + "分投票一次!");
                          return;
                      }
                  }
                }

                BLL.Content.Comment bllComment = new KingTop.BLL.Content.Comment();
              
               string strMessage = bllComment.CommentSet(strArgs[1],"",strArgs[0]);  //更新投票
               if (strMessage == "1") //投票成功
               {
                   Utils.WriteCookie(SystemConst.COOKIE_COMMENT_Vote, strArgs[1], DateTime.Now.ToString()); //保存这次投票的时间
               }
               PageData();
                //写日志 投票成功
              
                
            }
            else
            {
                Utils.AlertJavaScript(this, "投票未开启");
            }
        }

        protected void btnSave_Click1(object sender, EventArgs e)
        {
            DataRow drCommentConfig = TtCommentConfig.Rows[0];
            if (!PageVerification(drCommentConfig)) //如果返回true  证明验证没通过
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
               
                if(bllComment.IsSubmitVote(drCommentConfig["SubmitLimitTime"].ToString()))  //进行时间验证
                {
                    Model.Content.Comment modelComment = new KingTop.Model.Content.Comment();
                    modelComment.Content = Utils.UrlEncode(txtDescribe.Text.Trim());
                     string[] strTableIdOrOrders = GetTableID("0","K_Comment");
                     modelComment.ID = strTableIdOrOrders[0];
                     modelComment.Orders = Utils.ParseInt(strTableIdOrOrders[1],50);
                     if (Utils.ParseBool(drCommentConfig["IsScore"].ToString())) //是否要评分
                     {
                         modelComment.Score = Utils.ParseInt(rbtlScore.SelectedValue, 5);
                     }
                     else
                     {
                         modelComment.Score =0;
                     }                   
                     modelComment.SiteId = SiteID.ToString();
                     switch (drCommentConfig["IsCheck"].ToString())  //是否审核
                     {
                         case "1": //不用审核
                             modelComment.FlowState = 99;
                             break;
                         case "2": //会员不用审核
                             //判断是否会员,如果是会员则直接通过终审 否则状态为待审
                             modelComment.FlowState = 3;
                             break;
                         case "3": //都要审核 
                             modelComment.FlowState = 3;
                             break;
                         default:
                             modelComment.FlowState = 99;
                             break;
                     }
                    //判断会员是否登录,登录了就把会员ID,会员用户名保存
                     modelComment.IP = Utils.GetIP();
                     modelComment.IsMember = false;
                     modelComment.NewsID = StrNewsId;
                     modelComment.NewsUrl = Request.Url.OriginalString;
                     modelComment.NodeId = NodeID;
                     modelComment.MemberId = "0";
                     modelComment.UserName = "游客";
                     string strMessage = bllComment.Save("new", modelComment);
                     if (strMessage == "1") //添加成功
                     {
                         Utils.UrlRedirect(this, "CommentTestList.aspx", Utils.GetResourcesValue("model", "AddSucess"));
                     }
                     else
                     {
                         Utils.AlertJavaScript(this, Utils.GetResourcesValue("model", "AddError"));
                     }
                }
                else
                {
                     Utils.AlertJavaScript(this, "您的投票速度太快了,系统规定" + drCommentConfig["SubmitLimitTime"].ToString() + "分投票一次!");
                }
            }
        }
    }
}
