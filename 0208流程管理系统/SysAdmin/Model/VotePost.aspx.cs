using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.Model;
using System.Text;
using System.IO;
using AllPower.BLL.SysManage;
using AllPower.Config;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      何伟
    创建时间： 2010年9月20日
    功能描述： 投票前台调用模板
 
// 更新日期:2010-9-21  更新人:何伟  更新原因/内容:提交投票并更新
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class VotePost : System.Web.UI.Page
    {
        #region 初始化
        BLL.Content.Vote bllVote = new AllPower.BLL.Content.Vote();
        BLL.Content.VoteItems bllVoteItem = new AllPower.BLL.Content.VoteItems();
        /// <summary>
        /// Vote临时缓存表
        /// </summary>
        public DataTable ViewVote
        {
            set { ViewState["Vote"] = value; }
            get { return ViewState["Vote"] as DataTable; }
        }

        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        #region 数据初始化

        private void PageInit()
        {
            string[] strValues = Utils.strSplit(hdnVoteID.Value, ",");      //隐藏控件里的实际值
            string voteId = strValues[0];                                   //投票的ID
            if (voteId.Length > 0)                                          //如果ID不为空,则缓存当前的投票信息
            {
                ViewVote = bllVote.GetList("ONE", Utils.getOneParams(voteId));
            }
        }
        #endregion

        /// <summary>
        /// 初始化验证
        /// </summary>
        /// <param Name="drCommentConfig"></param>
        /// <returns></returns>
        bool PageVerification(DataRow drCommentConfig)
        {
            BLL.Content.ControlFormEdit bllFormEdit = new AllPower.BLL.Content.ControlFormEdit();
            //截止日期
            if (DateTime.Now.CompareTo(Utils.ParseDateTime(drCommentConfig["LimitTime"].ToString())) == 1)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('投票已经关闭!');</script>");
                return true;
            }
            //IP过滤
            if (bllFormEdit.isLimitIP(drCommentConfig["LimitIP"].ToString()))  //如果存在此ip段中,则不让他进入 
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('您的IP地址已经被限制提交投票,如有疑问,请联系管理员!');</script>");
                return true;
            }
            //投票次数
            if (drCommentConfig["VoteIPCount"].ToString() != "0")
            {
                int VoteCount = Utils.ParseInt(Utils.GetCookie(SystemConst.COOKIES_KEY, SystemConst.COOKIE__Vote), 0);
                if (VoteCount >= Utils.ParseInt(drCommentConfig["VoteIPCount"].ToString(), 0))
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "alert", string.Format("<script>alert('您已经投过{0}了,已经达到最大次数!');</script>", VoteCount.ToString()));
                    return true;
                }
            }
            //是否启用
            if (!Utils.ParseBool(drCommentConfig["IsEnable"]))  //是否启用
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('投票已经禁用!');</script>");
                return true;
            }
            //还要根据是否会员才能查看进行判断
            if (Utils.ParseBool(drCommentConfig["IsUserVote"]))  //只能会员才能查看
            {
                //判断是否登录,没登录则返回
                //判断会员投票次数
                if (drCommentConfig["VoteUserCount"].ToString() != "0")
                {
                    int VoteCount = Utils.ParseInt(Utils.GetCookie(SystemConst.COOKIES_KEY, SystemConst.COOKIE_User_Vote), 0);
                    if (VoteCount >= Utils.ParseInt(drCommentConfig["VoteUserCount"].ToString(), 0))
                    {
                        this.ClientScript.RegisterStartupScript(this.GetType(), "alert", string.Format("<script>alert('您已经投过{0}了,已经达到最大次数!');</script>", VoteCount.ToString()));
                        return true;
                    }
                }
                this.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('只有会员才能投票!');</script>");
                return true;
            }
            return false;
        }
        #endregion

        #region 操作事件(投票/查看)
        //投票
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!PageVerification(ViewVote.Rows[0]))                           //如果通过了验证
            {
                string[] strValues = Utils.strSplit(hdnVoteID.Value, ",");    //隐藏控件里的实际值
                StringBuilder voteItemsID = new StringBuilder(16);            //当投票选项的ID列表
                string[] strValueAll = null;                                  //复选,单选选中值
                string strValue = "";                                         //实际选项值
                string[] strTemp = null;                                     //临时变量
                string strName = strValues[1];                               //控件的ID
                strValueAll = Utils.strSplit(Utils.ReqFromParameter(strName), ",");  //先得到当前选择的全部项值 
                for (int j = 0; j < strValueAll.Length; j++)                         //再根据全部值进行单个操作
                {
                    strTemp = Utils.strSplit(strValueAll[j], "|");
                    if (j > 0)
                    {
                        strValue += ",";
                    }
                    if (voteItemsID.Length > 0)
                    {
                        voteItemsID.Append(",");
                    }
                    voteItemsID.Append(strTemp[1]);         //添加ID
                    strValue += strTemp[0];                 //添加value
                }
                if (bllVote.SavePostVote(voteItemsID.ToString()))      //更新选中的投票数 
                {
                    Utils.WriteCookie(SystemConst.COOKIES_KEY, SystemConst.COOKIE__SURVEY, Utils.ParseInt(Utils.GetCookie(SystemConst.COOKIES_KEY, SystemConst.COOKIE__SURVEY), 0) + 1);  //更改投票值

                    //成功后提示
                    string siteName = GetSiteDomain();
                    if (!"/".Equals(siteName.Substring(siteName.Length - 1)))
                    {
                        siteName += "/";
                    }
                    Utils.UrlRedirect(this, siteName + "Plus/Common/VoteResult.aspx?vid=" + strValues[0]);
                }
                else
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('你的投票有误!');</script>");
                }
            }
        }
        #endregion

        #region 获取当前站点域名
        public string GetSiteDomain()
        {
            string reUrl;
            SiteParamConfig siteobj = SiteParam.GetConfig(Server.MapPath("/" + SiteDir + "/config/SiteParam.config"));

            if (string.IsNullOrEmpty(siteobj.SiteDomain))
            {
                reUrl = siteobj.SiteRootURL + "/" + SiteDir;
            }
            else
            {
                reUrl = siteobj.SiteDomain;
            }

            if (reUrl.Substring(reUrl.Length - 1) != "/")
            {
                reUrl = reUrl + "/";
            }

            return reUrl;
        }
        #endregion

        #region 获取当前站点的目录

        //获取当前站点的文件夹名称
        protected string GetSiteDir()
        {
            string strSiteDir = "";
            SysWebSite bllWebSite = new SysWebSite();
            DataTable dt = bllWebSite.GetList("ONE", Utils.getOneParams(SiteID.ToString()));
            strSiteDir = dt.Rows[0]["Directory"].ToString();
            return strSiteDir;
        }

        //站点的ID
        public int SiteID
        {
            get
            {
                if (Session["SiteID"] != null)
                {
                    return Utils.ParseInt(Session["SiteID"].ToString(), 0);
                }
                else
                {
                    Session.Abandon();
                    return 0;
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
    }
}
