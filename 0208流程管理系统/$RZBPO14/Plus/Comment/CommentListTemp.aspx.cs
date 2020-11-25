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

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      何伟
    创建时间： 2010年10月15日    功能描述： 前台评论列表模板
 * 
--===============================================================*/
#endregion

namespace AllPower.WEB.main.Plus.Comment
{
    public partial class CommentListTemp : System.Web.UI.Page
    {
        #region 业务类
        protected string jsMessage = string.Empty;
        BLL.Content.Comment bllComment = new AllPower.BLL.Content.Comment();                         //评论
        BLL.Content.CommentConfig bllCommentConfig = new AllPower.BLL.Content.CommentConfig();       //评论配置
        #endregion

        #region 初始参数
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

        private string strNewsId, strNodeCode;

        /// <summary> 
        /// 所属的栏目节点
        /// </summary>
        public string StrNodeCode
        {
            get
            {
                if (strNodeCode == null)
                {
                    strNodeCode = Utils.UrlDecode(Utils.ReqUrlParameter("NodeCode"));
                }
                return strNodeCode;
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
        /// CommentConfig临时缓存表
        /// </summary>
        public DataTable TtCommentConfig
        {
            set { ViewState["CommentConfig"] = value; }
            get
            {
                DataTable dt = null;
                if (ViewState["CommentConfig"] != null)
                {
                    dt = ViewState["CommentConfig"] as DataTable;
                }
                else
                {
                    dt = bllCommentConfig.GetList("ONE", Utils.getOneParams("1"));
                }
                return dt;
            }
        }

        #endregion

        #region 页面加载初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageData();    //初始化绑定             
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
            dcWhere.Add("IsDel", "0");
            dcWhere.Add("NewsId", StrNewsId);
            dcWhere.Add("NodeId", StrNodeCode);
            dcWhere.Add("FlowState", "99");
            dcWhere.Add("IsEnable", "1");
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.DicWhere = dcWhere;
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptModelFileGroup;
            bllComment.PageData(p);
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
                            jsMessage = "alert(\"您的投票速度太快了,系统规定" + drCommentConfig["LimitTime"].ToString() + "分投票一次!\");";
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
    }
}
