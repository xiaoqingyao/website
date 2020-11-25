using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop.Common;
using System.Data;
using KingTop.BLL.SysManage;
using KingTop.Config;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:何伟
    创建时间:2010-9-25
    功能描述:问卷调查前台调用模板
 * 
  更新日期:  更新人:  更新原因/内容:
--===============================================================*/
#endregion
namespace KingTop.Web.Admin
{
    public partial class SurveyTemplate : System.Web.UI.Page
    {
        #region 初始化
        protected BLL.Content.Survey bllSurvey = new KingTop.BLL.Content.Survey();
        protected DataRow dr = null;
        private string surveyID = null;         //问卷ID

        /// <summary>
        /// 缓存表
        /// </summary>` 
        private DataTable ViewTable
        {
            set { ViewState["ViewTable"] = value; }
            get { return ViewState["ViewTable"] as DataTable; }
        }

        //页面初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            // 权限验证（是否登陆或登陆超时）        
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        /// <summary>
        /// 初始化
        /// </summary>
        private void PageInit()
        {
            DataTable dtSurvey = bllSurvey.GetList("ONE", Utils.getOneParams(hdnSurveyID.Value));
            if (dtSurvey.Rows.Count > 0)
            {
                surveyID = Convert.ToString(dtSurvey.Rows[0]["ID"]);
                ViewTable = dtSurvey;
                if (!PageVerification(dtSurvey.Rows[0]))
                {
                    if (dtSurvey.Rows[0]["SurveyPwd"].ToString().Length > 0)  //如果设置了密码
                    {
                        plContent.Visible = false;
                        plPwd.Visible = true;
                    }
                }
                else
                {
                    plContent.Visible = false;
                }
                dtSurvey.Dispose();
            }
            else
            {
                Utils.AlertJavaScript(this, "你的操作有误!");
            }
        }

        /// <summary>
        /// 初始化验证
        /// </summary>
        /// <param Name="drCommentConfig">当前的问卷记录</param>
        /// <returns>是否成功</returns>
        bool PageVerification(DataRow drCommentConfig)
        {
            BLL.Content.ControlFormEdit bllFormEdit = new KingTop.BLL.Content.ControlFormEdit();

            //是否已经删除
            if (Utils.ParseBool(drCommentConfig["IsDel"]))  //是否启用
            {
                Utils.AlertJavaScript(this, "问卷调查已经禁用!");
                return true;
            }

            //是否禁用
            if (!Utils.ParseBool(drCommentConfig["IsEnable"]))  //是否启用
            {
                Utils.AlertJavaScript(this, "问卷调查已经禁用!");
                return true;
            }
            //截止日期
            if (DateTime.Now.CompareTo(Utils.ParseDateTime(drCommentConfig["LimitTime"].ToString())) == 1)
            {
                Utils.UrlRedirect(this, "", "问卷调查已经关闭!");
                return true;
            }

            //IP是否限制
            if (bllFormEdit.isLimitIP(drCommentConfig["LimitIP"].ToString()))  //如果存在此ip段中,则不让他进入 
            {
                Utils.AlertJavaScript(this, "您的IP地址已经被限制提交问卷调查,如有疑问,请联系管理员!");
                return true;
            }

            //投票次数
            if (drCommentConfig["SurveyIPCount"].ToString() != "0")
            {
                int VoteCount = Utils.ParseInt(Utils.GetCookie(SystemConst.COOKIES_KEY, SystemConst.COOKIE__SURVEY), 0);
                if (VoteCount >= Utils.ParseInt(drCommentConfig["SurveyIPCount"].ToString(), 0))
                {
                    Utils.AlertJavaScript(this, "您已经提交过" + VoteCount.ToString() + "了,已经达到最大次数!");
                    return true;
                }
            }

            //还要根据是否会员才能查看进行判断
            if (Utils.ParseBool(drCommentConfig["IsUserSurvey"].ToString()))  //只能会员才能查看
            {
                //判断是否登录,没登录则返回
                //判断会员投票次数
                if (drCommentConfig["VoteUserCount"].ToString() != "0")
                {
                    int VoteCount = Utils.ParseInt(Utils.GetCookie(SystemConst.COOKIES_KEY, SystemConst.COOKIE_User_Vote), 0);
                    if (VoteCount >= Utils.ParseInt(drCommentConfig["VoteUserCount"].ToString(), 0))
                    {
                        Utils.AlertJavaScript(this, "您已经投过" + VoteCount.ToString() + "了,已经达到最大次数!");
                        return true;
                    }
                }
                Utils.AlertJavaScript(this, "此问卷需要会员才能填写,您还没有登录!");
                return true;
            }
            return false;
        }
        #endregion

        #region 操作的事件
        //提交
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!PageVerification(ViewTable.Rows[0]))  //如果通过了验证
            {
                string[] strs = Utils.strSplit(hdnSurveyColumn.Value, ","); //得到有多少列
                Dictionary<string, string> dcWhere = new Dictionary<string, string>();
                System.Text.StringBuilder strVotemID = new System.Text.StringBuilder(16);
                string[] strValueAll = null;                    //下拉,单选等选中值
                string strValue = null;
                string[] strValues = null;
                string[] strTemp = null;                        //临时变量
                string sid = string.Empty;                      //问卷的ID
                if (hdnSurveyID.Value.Length > 0)
                {
                    sid = hdnSurveyID.Value.Trim();
                }

                for (int i = 0; i < strs.Length; i++)
                {
                    strValues = Utils.strSplit(strs[i], "|");  //得到真实数据
                    string strName = "Q" + strValues[0];
                    switch (strValues[1])                      //数据类型
                    {
                        case "1":
                        case "3":
                        case "5":
                        case "7":
                        case "8":
                            dcWhere.Add(strName, Utils.ReqFromParameter(strName));
                            break;
                        case "2":
                        case "4":
                        case "6":
                        case "9":
                            strValue = "";
                            strValueAll = Utils.strSplit(Utils.ReqFromParameter(strName), ",");  //先得到当前选择的全部项值 
                            for (int j = 0; j < strValueAll.Length; j++)                         //再根据全部值进行单个操作
                            {
                                strTemp = Utils.strSplit(strValueAll[j], "|");
                                if (j > 0)
                                {
                                    strValue += ",";
                                }
                                if (strVotemID.Length > 0)
                                {
                                    strVotemID.Append(",");
                                }
                                strVotemID.Append(strTemp[1]);  //添加ID
                                strValue += strTemp[0];         //添加value
                            }
                            dcWhere.Add(strName, strValue);
                            break;
                    }
                }
                dcWhere.Add("IP", Utils.GetIP());         //ip的值
                dcWhere.Add("SurveyID", sid);             //问卷的ID
                dcWhere.Add("UserName", UserNo);          //用户名
                if (bllSurvey.SavePostSurvey(dcWhere, strVotemID.ToString(), sid))
                {
                    Utils.WriteCookie(SystemConst.COOKIES_KEY, SystemConst.COOKIE__SURVEY, Utils.ParseInt(Utils.GetCookie(SystemConst.COOKIES_KEY, SystemConst.COOKIE__SURVEY), 0) + 1);  //更改投票值

                    //this.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('问卷调查提交成功!');</script>");
                    string siteName = GetSiteDomain();
                    if (!"/".Equals(siteName.Substring(siteName.Length - 1)))
                    {
                        siteName += "/";
                    }
                    Utils.UrlRedirect(this, siteName + "Plus/Common/SurveyResult.aspx?sid=" + sid);
                }
                else
                {
                    Utils.AlertJavaScript(this, "你的提交有误!");
                }
            }
        }

        //验证密码
        protected void btnPwd_Click(object sender, EventArgs e)
        {
            if (txtPwd.Text.Trim() == ViewTable.Rows[0]["SurveyPwd"].ToString())  //如果密码输入正确
            {
                plPwd.Visible = false;
                plContent.Visible = true;
            }
            else
            {
                Utils.AlertJavaScript(this, "您的密码输入错误!");
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

        #region 获取当前登录的用户名
        /// <summary>
        /// 用户账号
        /// </summary>
        public string UserNo
        {
            get { return GetLoginAccountName(); }
        }

        /// <summary>
        /// 得到当前登录的用户账号的账号名（表Account中的AccountName）
        /// </summary>
        /// <returns></returns>
        protected string GetLoginAccountName()
        {
            return LoginInfoHelper.GetLoginAccount(Session, HttpContext.Current.Response).UserName;
        }
        #endregion
    }
}
