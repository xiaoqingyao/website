using System;
using System.Web;
using System.Collections.Generic;
using System.Text;
using System.IO;
using KingTop.Model;
using KingTop.Common;
using KingTop.Config;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.SessionState;
using System.Data;
using KingTop.BLL.SysManage;

namespace KingTop.Web.Admin
{
    public class AdminPage:Page
    {
        public AdminPage()
        {

        }

        protected override void OnInit(EventArgs e)
        {
            //判断Session过期
            LoginInfoHelper.ValidateLoginInfo(Session, Response);
            base.OnInit(e);
        }

        #region 初始参数
        //设置变量
        private string _action, _id, _isValid, _nodeid, _moduleID, _SiteDir;
        private string strKeySearch;

        //节点编码
        public virtual string NodeCode
        {
            get
            {
                return Request.QueryString["NodeCode"];
            }
        }

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

        public string AddMan
        {
            get { return GetLoginAccountName(); }
        }

        /// <summary>
        /// 用户账号
        /// </summary>
        public string UserNo
        {
            get { return GetLoginAccountName(); }
        }

        /// <summary>
        /// 写入日志的标题

        /// </summary>
        public string LogTitle
        {
            get
            {
                string logTitle;
                if (string.IsNullOrEmpty(Request.Form["hidLogTitle"]))
                {
                    logTitle = Request.QueryString["hidLogTitle"];
                }
                else
                {

                    logTitle = Request.Form["hidLogTitle"];
                }
                return logTitle;
            }
        }
        /// <summary>
        /// 获取日志内容
        /// </summary>
        /// <param name="logTitle">标题</param>
        /// <param name="OperateName">操作名称，比如删除：Del</param>
        /// <param name="ModuleName">模块名称，比如用户管理：SysUser</param>
        /// <param name="SuccessOrFailure">成功或者是不，true=成功，false=失败</param>
        /// <returns></returns>
        public string GetLogValue(string logTitle, string OperateName, string ModuleName, bool SuccessOrFailure)
        {
            string resultValue;
            if (SuccessOrFailure)
                resultValue = "Success";
            else
                resultValue = "Failure";

            return Utils.GetResourcesValue("Common", OperateName) + Utils.GetResourcesValue("Common", ModuleName) + logTitle + Utils.GetResourcesValue("Common", resultValue);
        }



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
        //框架左边菜单传过来的节点ID，每个页面都需要它来判断权限



        //获取Nodeid
        public string NodeID
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Nodeid"]))
                {
                    this._nodeid = Utils.ReqUrlParameter("Nodeid").ToUpper();
                }
                //当页面没有NodeID参数时就是点左边导航过来的列表页，这时候需要重新查询NodeID，缓存没用

                //else if(Session["Nodeid"]!=null)
                //{
                //    this._nodeid = Session["Nodeid"].ToString();
                //}
                else
                {
                    this._nodeid = GetNodeId();
                    //Session["Nodeid"] = this._nodeid;
                }
                return this._nodeid;
            }
        }

        //通过NodeCode和SiteID获取Nodeid
        private string GetNodeId()
        {
            string strResult = string.Empty;
            KingTop.BLL.SysManage.ModuleNode bll = new KingTop.BLL.SysManage.ModuleNode();
            DataTable dt = bll.GetList("GETNODEID", Utils.getTwoParams(NodeCode, SiteID.ToString()));
            if (dt.Rows.Count > 0)
            {
                strResult = dt.Rows[0]["NodeID"].ToString();
            }
            return strResult;
        }

        //模块ID
        public string ModuleID
        {
            get
            {
                if (this._moduleID == null)
                {
                    this._moduleID = Utils.ReqUrlParameter("ModuleID");
                    // 参数格式验证，非法则重置为空字符串

                }

                return this._moduleID;
            }
        }
        public string ID
        {
            get
            {
                if (this._id == null)
                {
                    this._id = Utils.ReqUrlParameter("ID").ToUpper();
                }

                return this._id;
            }
        }
        //有效性

        public string IsValid
        {
            get
            {
                if (this._isValid == null)
                {
                    this._isValid = Utils.ReqUrlParameter("IsValid").ToUpper();
                }

                return this._isValid;
            }
        }
        //RequestQuery中操作(NEW，EDIT)
        public string Action
        {
            get
            {
                if (this._action == null)
                {
                    this._action = Utils.ReqUrlParameter("Action").ToUpper();
                }
                if (_action == "")
                {
                    _action = "NEW";
                }
                return this._action;
            }
        }

        #endregion


        /// <summary>
        /// 日志扩展方法
        /// 周武 2010.5.14
        /// </summary>
        /// <param name="logTitle">日志标题</param>
        /// <param name="logTitle">日志修改前的标题</param>
        /// <param name="operateName">操作名称(资源文件中的名称)</param>
        /// <param name="moduleName">模块名称(资源文件中的名称)</param>
        /// <param name="postContent">数据库操作后返回的内容</param>
        public void WriteLogExpand(string logTitle, string oldTitle, string operateName, string moduleName, string postContent)
        {
            if (oldTitle != "" && logTitle != oldTitle) //如果更改了标题
            {
                logTitle = oldTitle + " => " + logTitle;
            }
            WriteLogExpand(logTitle, operateName, moduleName, postContent);
        }

        /// <summary>
        /// 日志扩展方法
        /// 周武 2010.5.14
        /// </summary>
        /// <param name="logTitle">日志标题</param>
        /// <param name="operateName">操作名称(资源文件中的名称)</param>
        /// <param name="moduleName">模块名称(资源文件中的名称)</param>
        /// <param name="postContent">数据库操作后返回的内容</param>
        public void WriteLogExpand(string logTitle, string operateName, string moduleName, string postContent)
        {
            bool IsSuccess = true;
            int logType = 2;
            if (postContent != "1")  //如果不为1 则操作失败
            {
                IsSuccess = false;
                logType = 3; //操作失败
            }
            else
            {
                postContent = "";
            }
            string strLogTitle = GetLogValue(logTitle, operateName, moduleName, IsSuccess);
            WriteLog(strLogTitle, postContent, logType); //写日志

        }


        #region 保存日志:ycl@360hqb.com
        /// <summary>
        /// 保存日志:ycl@360hqb.com
        /// </summary>
        /// <param Name="Content">日志内容</param>
        /// <param Name="PostContent">提交内容</param>
        /// <param Name="LogType">日志类型，1=登录日志，2=操作日志，3=错误日志</param>
        public void WriteLog(string Content, string PostContent, int LogType)
        {
            string ip = Utils.GetIP();       //IP地址
            string ScriptName = HttpContext.Current.Request.ServerVariables["SCRIPT_NAME"] + "?" + HttpContext.Current.Request.ServerVariables["QUERY_STRING"]; //提交的页面地址
            SiteParamConfig pci = SiteParam.GetConfig(GetSiteParamPath);
            if (pci.LogType == "0")  //保存到数据库
            {
                KingTop.Model.SysManage.SysLog objlog = new KingTop.Model.SysManage.SysLog();
                KingTop.BLL.SysManage.SysLog objBllLog = new KingTop.BLL.SysManage.SysLog();
                objlog.IP = ip;
                objlog.Content = Content;
                objlog.LogType = LogType;

                // objlog.NodeId = NodeId;

                objlog.NodeCode = NodeCode;

                objlog.PostContent = PostContent;
                objlog.ScriptName = ScriptName;
                objlog.SiteID = SiteID;
                objlog.UserNo = UserNo;
                objBllLog.Save("NEW", objlog);
            }
            else  //保存到文件
            {
                string logPath = pci.LogDir;
                StreamWriter sw = null;
                DateTime date = DateTime.Now;
                string FileName = date.Year + "-" + date.Month;
                if (logPath.IndexOf(":") == -1)  //相对路径
                {
                    if (logPath.Trim().Length == 0)  //路径为空
                    {
                        logPath = "hqbLogs";
                    }
                    logPath = HttpContext.Current.Server.MapPath("~/" + logPath);
                }

                try
                {

                    FileName = logPath + "/" + UserNo + "_" + FileName + "-" + DesSecurity.DesEncrypt(FileName, "hqbonline") + "-s.log";

                    #region 检测日志目录是否存在

                    if (!Directory.Exists(logPath))
                    {
                        Directory.CreateDirectory(logPath);
                    }

                    if (!File.Exists(FileName))
                        sw = File.CreateText(FileName);
                    else
                    {
                        sw = File.AppendText(FileName);
                    }
                    #endregion

                    sw.WriteLine("[NodeCode]       :" + NodeCode + "\r");
                    sw.WriteLine("[SiteID]       :" + SiteID + "\r");
                    sw.WriteLine("[Content]      :" + Content);
                    sw.WriteLine("[AddDate]      :" + date.ToString("yyyy-MM-dd hh:mm:ss") + "\r");
                    sw.WriteLine("[UserNo]       :" + UserNo + "\r");
                    sw.WriteLine("[IP]           :" + ip + "\r");
                    sw.WriteLine("[ScriptName]   :" + ScriptName + "\r");
                    sw.WriteLine("[PostContent]  :" + PostContent + "\r");
                    sw.WriteLine("[LogType]      :" + LogType + "\r");
                    sw.WriteLine("≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡\r");
                    sw.Flush();
                }
                finally
                {
                    if (sw != null)
                        sw.Close();
                }
            }

        }
        #endregion

        #region 生成表主键 ycl@360hqb.com
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

            maxOrders = KingTop.BLL.Public.Orders(tableName).ToString();

            System.Random a = new Random(int.Parse(maxOrders));
            strRandom = a.Next(10000, 100000).ToString();

            strNo[0] = (int.Parse(isTop) + 1).ToString() + maxOrders.ToString().PadLeft(9, '0') + strRandom;
            strNo[1] = maxOrders;
            return strNo;
        }

        /// <summary>
        /// 生成表主键（ID），已知最大排序号
        /// </summary>
        /// <param Name="isTop">是否置顶，0=否，1=是</param>
        /// <param Name="maxOrders">排序号</param>
        /// <returns></returns>
        protected string GetTableID(string isTop, int maxOrders)
        {
            string strNo = "";  //序列号

            string strRandom = "";  //5位随机数 

            if (isTop != "1" && isTop != "0") //判断isTop是否是0和1，如果两者都不是将isTop置为0
            {
                isTop = "0";
            }

            System.Random a = new Random(maxOrders);
            strRandom = a.Next(10000, 100000).ToString();
            strNo = (int.Parse(isTop) + 1).ToString() + maxOrders.ToString().PadLeft(9, '0') + strRandom;
            return strNo;
        }

        #endregion

        #region  得到登录信息  @author 陈顺 by 2010-03-24
        /// <summary>
        /// 得到当前登录的用户账号的主键（表Account中的主键）

        /// </summary>
        /// <returns></returns>
        protected string GetLoginAccountId()
        {
            return LoginInfoHelper.GetLoginAccountId(Session, Response);
        }

        /// <summary>
        /// 得到当前登录的用户账号的账号名（表Account中的AccountName）

        /// </summary>
        /// <returns></returns>
        protected string GetLoginAccountName()
        {
            return LoginInfoHelper.GetLoginAccount(Session, Response).UserName;
        }

        #endregion

        #region 判断是否分页
        protected bool IsPageChanged()
        {
            bool ispc = false;
            string urlreferrer = Request.UrlReferrer.ToString().ToLower();
            string scriptname = Request.ServerVariables["SCRIPT_NAME"].ToLower();

            if (urlreferrer.IndexOf("nodeid") == -1)  //没有节点参数的，只比较页面
            {
                if (urlreferrer.IndexOf(scriptname) != -1)  //页面一样
                {
                    ispc = true;
                }
            }
            else
            {
                if (urlreferrer.IndexOf(scriptname) != -1 && urlreferrer.IndexOf("nodeid=" + NodeID.ToLower()) != -1)  //页面一样,且节点一样
                {
                    ispc = true;
                }
            }
            return ispc;
        }
        #endregion

        #region 判断是否有操作权限，根据accountid,nodeid得到权限遍历页面控件
        public void SetRight(Page p, Repeater rpt)
        {
            KingTop.BLL.SysManage.RightTool RightToo = new KingTop.BLL.SysManage.RightTool();
            bool b = RightToo.SetRight(NodeID, GetLoginAccountId(), p, rpt);
            if (b == false)
            {
                Response.Redirect("~/NoRight.aspx");
            }
        }
        #endregion

        #region 根据操作编码查找用户是否存在此权限

        public bool IsHaveRightByOperCode(string OperType)
        {
            KingTop.BLL.SysManage.RightTool RightToo = new KingTop.BLL.SysManage.RightTool();
            return RightToo.IsHaveRightByOperCode(NodeID, OperType, GetLoginAccountId());
            //return RightToo.IsHaveRightByOperCodeFromCache(NodeID, OperType, GetLoginAccountId());
        }
        #endregion

        //获取当前站点的文件夹名称
        protected string GetSiteDir()
        {
            string strSiteDir = "";
            SysWebSite bllWebSite = new SysWebSite();
            DataTable dt = bllWebSite.GetList("ONE", Utils.getOneParams(SiteID.ToString()));
            strSiteDir = dt.Rows[0]["Directory"].ToString();
            return strSiteDir;
        }

        //获取站点文件夹

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
        }

        //获得上传文件物理路径
        public string GetUploadImgPath
        {
            get
            {
                return System.Web.HttpContext.Current.Server.MapPath("~/" + SiteDir + "/config/Upload.config");
            }
        }

        //获得上传文件物理路径
        public string GetSiteParamPath
        {
            get
            {
                return System.Web.HttpContext.Current.Server.MapPath("~/" + SiteDir + "/config/SiteParam.config");
            }
        }

        public string GetVirtualPath
        {
            get
            {
                string virPath;
                virPath = Request.ApplicationPath;
                if (virPath.Substring(virPath.Length - 1) != "/")
                {
                    virPath = virPath + "/";
                }
                return virPath;
            }
        }
    }
}
