using System;
using System.Web;
using System.Collections.Generic;
using System.Text;
using System.IO;
using AllPower.Model;
using AllPower.Common;
using AllPower.Config;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.SessionState;
using System.Data;
using AllPower.BLL.SysManage;

namespace AllPower.Web.Admin
{
    public class AdminPage : System.Web.UI.Page
    {
        #region 页面初始化

        public AdminPage()
        {

        }

        //初始化
        protected override void OnInit(EventArgs e)
        {
            //判断Session过期
            LoginInfoHelper.ValidateLoginInfo(Session, Response);
            base.OnInit(e);
        }
        #endregion

        #region 初始化的参数
        //设置变量
        private string _action, _id, _isValid, _nodeid, _moduleID, _SiteDir;
        private string strKeySearch;

        //节点编码
        public virtual string NodeCode
        {
            get
            {
                return HttpContext.Current.Request.QueryString["NodeCode"];
            }
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

                if (System.Web.HttpContext.Current.Request.Cookies["AdminUserInfo"] != null)
                {
                    string cookieValue = System.Web.HttpContext.Current.Request.Cookies["AdminUserInfo"].Value;
                    string[] arr = cookieValue.Split('|');
                    System.Web.HttpContext.Current.Response.Cookies["AdminUserInfo"].Value = arr[0] + "|" + value;
                }
            }
        }

        //添加人
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

            string moduleName = Utils.GetResourcesValue("Common", ModuleName);
            if (string.IsNullOrEmpty(moduleName))
            {
                moduleName = ModuleName;
            }

            return Utils.GetResourcesValue("Common", OperateName) + moduleName + logTitle + Utils.GetResourcesValue("Common", resultValue);

        }

        /// <summary>
        /// 分页页面参数,列表页面和编辑页面按照规范命名，如newslist.aspx，newsedit.aspx
        /// </summary>       
        public string StrPageParams
        {
            get
            {
                string pageKey = System.Web.HttpContext.Current.Request.ServerVariables["SCRIPT_NAME"].ToLower();
                int num = pageKey.LastIndexOf("edit");
                if (num > 0)
                {
                    string[] arrpage = pageKey.Substring(0, num).Split('/');
                    pageKey = arrpage[arrpage.Length - 1];
                }
                else
                {
                    pageKey = "";
                }
                string sessionid = Session.SessionID;
                string strCookieKey = sessionid + Utils.ReqUrlParameter("NodeCode") + pageKey;
                string strPageParams = AllPower.Common.Utils.GetCookie(SystemConst.COOKIES_PAGE_KEY, strCookieKey);
                if (string.IsNullOrEmpty(strPageParams))
                {
                    strCookieKey = sessionid + Utils.ReqUrlParameter("NodeCode");
                    strPageParams = AllPower.Common.Utils.GetCookie(SystemConst.COOKIES_PAGE_KEY, strCookieKey);
                }
                if (string.IsNullOrEmpty(strPageParams))
                {
                    strCookieKey = sessionid;
                    strPageParams = AllPower.Common.Utils.GetCookie(SystemConst.COOKIES_PAGE_KEY, strCookieKey);
                }
                if (strPageParams.Length > 0)
                {
                    strPageParams = strPageParams.Replace("|", "&");
                    return "?" + strPageParams;
                }
                else
                {
                    return "";
                }
            }
        }

        /// <summary>
        /// 分页页面参数,列表页面和编辑页面不规范，或者节点不同，如newslist.aspx,编辑页面命名为infoedit.aspx
        /// </summary>     
        /// <param name="PageName">列表页面名称，如：newslist.aspx</param>
        /// <param name="NodeCode">列表页面的节点编码，如：100020001</param>
        public string StrPageParams2(string PageName, string NodeCode)
        {
            int num = PageName.ToLower().LastIndexOf("list");
            if (num > 0)
            {

                PageName = PageName.Substring(0, num);
            }
            string sessionid = Session.SessionID;
            string strCookieKey = Session.SessionID + NodeCode + PageName;
            string strPageParams = AllPower.Common.Utils.GetCookie(SystemConst.COOKIES_PAGE_KEY, strCookieKey);
            if (strPageParams.Length > 0)
            {
                strPageParams = strPageParams.Replace("|", "&");
                return "?" + strPageParams;
            }
            else
            {
                return "";
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
                    strKeySearch = Utils.cutBadStr(Utils.UrlDecode(Utils.ReqUrlParameter("keySearch")));
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
                else
                {
                    this._nodeid = GetNodeId();
                }
                return this._nodeid;
            }
        }

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

        //当前的ID
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
            set
            {
                this._id = value;
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

        #region 日志扩展方法 By hewei 2010-10-27 Update

        /// <summary>
        /// 日志扩展方法
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
        #endregion

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
            //string ScriptName = HttpContext.Current.Request.Url.ToString (); //提交的页面地址
            //int urlNum = ScriptName.IndexOf(HttpContext.Current.Request.ServerVariables["SCRIPT_NAME"]);
            //if (urlNum > 0)
            //    ScriptName = ScriptName.Substring(urlNum);

            SiteParamConfig pci = SiteParam.GetConfig(GetSiteParamPath);
            if (pci.LogType == "0")  //保存到数据库
            {
                AllPower.Model.SysManage.SysLog objlog = new AllPower.Model.SysManage.SysLog();
                AllPower.BLL.SysManage.SysLog objBllLog = new AllPower.BLL.SysManage.SysLog();
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

            maxOrders = AllPower.BLL.Public.Orders(tableName).ToString();

            //System.Random a = new Random(int.Parse(maxOrders));
            //strRandom = a.Next(10000, 100000).ToString();
            Random rdm1 = new Random(unchecked((int)DateTime.Now.Ticks));
            strRandom = (DateTime.Now.ToString("fffff").Replace ("0","") + rdm1.Next(10000, 99999).ToString ()).Substring(0, 5);
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
            
            //System.Random a = new Random(maxOrders);
            //strRandom = a.Next(10000, 100000).ToString();
            Random rdm1 = new Random(unchecked((int)DateTime.Now.Ticks));
            strRandom = (DateTime.Now.ToString("fffff").Replace("0", "") + rdm1.Next(10000, 99999).ToString()).Substring(0, 5);
            
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
            return LoginInfoHelper.GetLoginAccountId(Session, HttpContext.Current.Response);
        }

        /// <summary>
        /// 得到当前登录的用户账号的账号名（表Account中的AccountName）
        /// </summary>
        /// <returns></returns>
        protected string GetLoginAccountName()
        {
            return LoginInfoHelper.GetLoginAccount(Session, HttpContext.Current.Response).UserName;
        }

        /// <summary>
        /// 得到当前登录的用户账号的用户组（表Account中的UserGroupCode）
        /// </summary>
        /// <returns></returns>
        protected string GetLoginUserGroupCode()
        {
            return LoginInfoHelper.GetLoginAccount(Session, HttpContext.Current.Response).UserGroupCode;
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
            AllPower.BLL.SysManage.RightTool RightToo = new AllPower.BLL.SysManage.RightTool();
            bool b = RightToo.SetRight(NodeCode, GetLoginAccountId(), GetLoginUserGroupCode(), p, rpt);
            if (b == false)
            {
                Response.Redirect("../NoRight.aspx");
            }
        }


        //权限判断 gavin by 2010-07-12
        public bool HasLeftMenuRights(string NodeCode)
        {
            AllPower.BLL.SysManage.RightTool RightToo = new AllPower.BLL.SysManage.RightTool();
            return RightToo.HasLeftMenuRights(int.Parse(GetLoginAccountId()), GetLoginUserGroupCode(), NodeCode);
        }
        #endregion

        #region 根据操作编码查找用户是否存在此权限

        public bool IsHaveRightByOperCode(string OperType)
        {
            AllPower.BLL.SysManage.RightTool RightToo = new AllPower.BLL.SysManage.RightTool();
            return RightToo.IsHaveRightByOperCode(NodeID, OperType, GetLoginAccountId());
            //return RightToo.IsHaveRightByOperCodeFromCache(NodeID, OperType, GetLoginAccountId());
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
            set { Session["SiteDir"] = value; }
        }

        #endregion

        #region 得到上传图片域名，配置路径，配置信息

        //得到上传图片配置参数，0=允许上传大小，1=上传绝对路径，2=允许上传类型
        public string[] GetUploadImgSetParam()
        {
            string[] imgParam = new string[3];

            UploadConfig uploadobj = Upload.GetConfig(GetUploadImgPath);
            string maxSize;
            string savePath;
            string allowExt;
            maxSize = "0";
            savePath = string.Empty;
            allowExt = string.Empty;

            maxSize = (Utils.ParseInt(uploadobj.UploadImageSize, 1) * 1024).ToString();
            savePath = uploadobj.ImageSavePath + "/" + SiteDir + "/Images";
            if (savePath.IndexOf(":") == -1)  //判断输入的是虚拟路径
            {
                savePath = Server.MapPath(GetVirtualPath + savePath);
            }

            if (!Directory.Exists(savePath))
            {
                Directory.CreateDirectory(savePath);
            }

            allowExt = uploadobj.UploadImageType;
            imgParam[0] = maxSize;
            imgParam[1] = savePath;
            imgParam[2] = allowExt;

            return imgParam;
        }


        //获得上传文件配置路径
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

        //获取虚拟路径
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

        //获取上传图片的域名URL
        public string GetUploadImgUrl()
        {
            string reUrl;
            UploadConfig uploadobj = Upload.GetConfig(GetUploadImgPath);

            if (string.IsNullOrEmpty(uploadobj.ImageUrl))
            {
                reUrl = GetVirtualPath + uploadobj.ImageSavePath + "/" + SiteDir + "/Images";
                reUrl = reUrl.Replace("//", "/");
            }
            else
            {
                reUrl = uploadobj.ImageUrl;
            }
            if (reUrl.Substring(reUrl.Length - 1) != "/")
            {
                reUrl = reUrl + "/";
            }

            return reUrl;
        }

        //获取上传文件的域名URL
        public string GetUploadFileUrl()
        {
            string reUrl;
            UploadConfig uploadobj = Upload.GetConfig(GetUploadImgPath);

            if (string.IsNullOrEmpty(uploadobj.FileUrl))
            {
                reUrl = GetVirtualPath + uploadobj.FileSavePath + "/" + SiteDir + "/Files";
                reUrl = reUrl.Replace("//", "/");
            }
            else
            {
                reUrl = uploadobj.FileUrl;
            }
            if (reUrl.Substring(reUrl.Length - 1) != "/")
            {
                reUrl = reUrl + "/";
            }

            return reUrl;
        }

        //获取上传视频的域名URL
        public string GetUploadMediaUrl()
        {
            string reUrl;
            UploadConfig uploadobj = Upload.GetConfig(GetUploadImgPath);

            if (string.IsNullOrEmpty(uploadobj.MediaUrl))
            {
                reUrl = GetVirtualPath + uploadobj.MediaSavePath + "/" + SiteDir + "/Medias";
                reUrl = reUrl.Replace("//", "/");
            }
            else
            {
                reUrl = uploadobj.MediaUrl;
            }
            if (reUrl.Substring(reUrl.Length - 1) != "/")
            {
                reUrl = reUrl + "/";
            }

            return reUrl;
        }
        #endregion

        #region 得到当前站点域名
        public string GetSiteDomain()
        {
            string reUrl;
            SiteParamConfig siteobj = SiteParam.GetConfig(Server.MapPath("/" + SiteDir + "/config/SiteParam.config"));

            if (string.IsNullOrEmpty(siteobj.SiteDomain))
            {
                reUrl = siteobj.SiteRootURL;

                if (string.IsNullOrEmpty(reUrl))
                    reUrl = "/";

                if(reUrl.Substring (reUrl .Length -1)=="/")
                    reUrl=reUrl+ SiteDir;
                else
                    reUrl = reUrl +"/"+ SiteDir;
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

        #region 根据NodeCode得到当前位置导航
        public void GetPageNav(string nodeCode)
        {
            if (string.IsNullOrEmpty(nodeCode))
                return;

            ModuleNode nodeObj = new ModuleNode();
            int i = 0;
            string parentCode = string.Empty;
            DataTable dt = nodeObj.GetModeNodeFromCache();
            DataRow[] dr;
            while (i != nodeCode.Length)
            {
                i = i + 3;
                parentCode = nodeCode.Substring(0, i);
                dr = dt.Select("NodeCode='" + parentCode + "'");
                if (dr.Length > 0)
                {
                    if (i != 3)
                    {
                        Response.Write(" &gt; ");
                    }
                    Response.Write("<a href=\"#\">" + dr[0]["NodeName"].ToString() + "</a>");
                }
            }
        }
        #endregion
    }

}
