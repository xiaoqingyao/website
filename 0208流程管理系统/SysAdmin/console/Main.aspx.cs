using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AllPower.Common;
using AllPower.BLL.SysManage;
using System.Configuration;
using System.Diagnostics;
using System.Threading;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:     胡志瑶
    创建时间： 2010年8月25日
    功能描述： 系统标签/通用列表类型
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin.console
{
    public partial class Main : AdminPage
    {
        #region 变量成员
        //用户登录信息
        protected string strLastLoginDate = "";
        protected string strLastLoginIP = "";
        protected string strLoginCount = "";
        //系统运行环境
        protected string NetVersion = "";
        protected string IISVersion = "";
        protected string OSVersion = "";
        protected string DataBaseVersion = "";
        protected string DataBaseVersionCode = "";
        protected string DataBaseSize = "";
        protected string LogSize = "";
        //系统运行信息
        protected string SysVersion = "";
        protected string SysStartTime = "";     
        protected string SysCacheNum = "";

        private string userID = "";
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            userID = GetLoginAccountId();
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["op"] == "get")
                {
                    Response.Write(GetPosition());
                    Response.End();
                }
                else if (Request.QueryString["op"] == "update")
                {
                    UpdatePosition(Request.QueryString["position"]);
                }
                else if (Request.QueryString["op"] == "memorandum")
                {
                    Response.Write(UpdateMorandum(Request.QueryString["content"]));
                    Response.End();                    
                }
                else if (Request.QueryString["op"] == "memo")
                {
                    Response.Write(GetMemo());
                    Response.End();
                }
                else if (Request.QueryString["op"] == "cpu")
                {
                    Response.Write(GetCPU());
                    Response.End();
                }
                GetLoginInfo();
                GetEnvironmentInfo();
                Innitessage();
                InitMemorandum();
                InnitNote();
                InnitMeInfo();
                InitPendingAudit();
            }
        }

        
        #endregion        

        #region 获取用户登陆信息
        /// <summary>
        /// 获取用户登陆信息
        /// </summary>
        protected void GetLoginInfo()
        {
            if (userID == "0")
            {
                //admin
                string xml = Server.MapPath("~/SysAdmin/Configuraion/adminLoginInfo.xml");
                strLastLoginDate = Utils.XmlRead(xml, "/root/LastLoginDate", "");
                strLastLoginIP = Utils.XmlRead(xml, "/root/LastLoginIp", "");
                strLoginCount = Utils.XmlRead(xml, "/root/LoginCount", "");
            }
            else
            {
                AccountSite bllAccountSite = new AccountSite();
                DataTable dt = bllAccountSite.GetList("USERID", Utils.getTwoParams(userID, SiteID.ToString()));
                if (dt.Rows.Count > 0)
                {
                    strLastLoginDate = dt.Rows[0]["LastLoginDate"].ToString();
                    strLastLoginIP = dt.Rows[0]["LastLoginIP"].ToString();
                    strLoginCount = dt.Rows[0]["LoginCount"].ToString();
                }
            }
            List<string> dbInfo = new Top().GetDataBaseInfo();
            DataBaseVersion =dbInfo[0];
            DataBaseSize=dbInfo[1];
            LogSize =dbInfo[2];
            
        }
        //获得系统信息
        protected void GetEnvironmentInfo()
        {
            string xmlPath = Server.MapPath("/sysadmin/Configuraion/SystemInfo.config");
            NetVersion = Environment.Version.ToString();
        
            OSVersion = Environment.OSVersion.ToString();
            SysCacheNum = Cache.Count.ToString(); 
            SysStartTime = Application["SysStartTime"].ToString();
            SysVersion = Utils.XmlRead(xmlPath, "SystemInfo/SystemType", "").Replace("AllPower ","")+"  V"+ Utils.XmlRead(xmlPath, "SystemInfo/SystemVer", "");
            IISVersion = Request.ServerVariables["SERVER_SOFTWARE"];
        }
        //及时获得系统cpu使用情况
        protected string GetCPU()
        {
            PerformanceCounter pc = new PerformanceCounter("Processor", "% Processor Time", "_Total");
            pc.NextValue();
            Thread.Sleep(250);
            string cpuPro = (pc.NextValue() / Environment.ProcessorCount).ToString("0.0") + "%";
            return cpuPro;
        }
        //及时获得系统物理内存
        protected string GetMemo()
        {
            return ((Double)GC.GetTotalMemory(false) / 1048576).ToString("N2") + "M";
        }
        #endregion


        #region 工作台
        /// <summary>
        /// 获取工作台的位置信息
        /// </summary>
        /// <returns></returns>
        protected string GetPosition()
        {
            string position = "";           
            //先判断是不是超级用户
            if (userID == "0")
            {
                string xml = Server.MapPath("~/SysAdmin/Configuraion/adminLoginInfo.xml");
                position = Utils.XmlRead(xml, "/root/Position", "");
            }
            else
            {
                AccountSite bllAccountSite = new AccountSite();
                DataTable dt = bllAccountSite.GetList("USERID", Utils.getTwoParams(userID, SiteID.ToString()));
                //数据库若没位置信息，则默认为"c1:1@2@3|c2:4@5@6"
                position = (dt.Rows.Count > 0 && dt.Rows[0]["POSITION"].ToString().Trim() != "") ? dt.Rows[0]["POSITION"].ToString() : "c1:1@3@5@7@|c2:2@4@6@8@|"; 
            }
            
            return position;
        }

        /// <summary>
        /// 更改工作台位置信息
        /// </summary>
        /// <param name="position"></param>
        protected void UpdatePosition(string position)
        {
            string strMessage = "";
            //先判断是不是超级用户
            if (userID == "0")
            {
                try
                {
                    string xml = Server.MapPath("~/SysAdmin/Configuraion/adminLoginInfo.xml");
                    Utils.XmlUpdate(xml, "/root/Position", "", position);
                    strMessage = "1";
                }
                catch (Exception exp)
                {
                    strMessage = exp.ToString();
                }
            }
            else
            {

                AllPower.Model.SysManage.AccountSite modelAccountSite = new AllPower.Model.SysManage.AccountSite();
                AccountSite bllAccountSite = new AccountSite();
                modelAccountSite.UserID = int.Parse(userID);
                modelAccountSite.LoginDate = DateTime.Now; //无实际作用
                modelAccountSite.SiteID = SiteID;
                modelAccountSite.PoSition = position;
                strMessage = bllAccountSite.Save("UPDATEPOSITION", modelAccountSite);           
            }
            WriteLog(GetLogValue("", "EDIT", "WorkStation", true), "", 2);
        }
        #endregion


        #region 获得短消息列表
        /// <summary>
        /// 获得短消息列表
        /// </summary>
        private void Innitessage()
        {
            rptMessage.DataSource= new AllPower.BLL.SysManage.MessageSendee().GetMessageList(5, userID, SiteID.ToString());
            rptMessage.DataBind();
        }
        
        #region Repeater列表的用户组列

        public string GetUserName(string strUserID, string strUserName) //repeater列表的 用户组列
        {
            if (strUserID == "0")
            {
                strUserName = ConfigurationManager.AppSettings["SuperUser"].ToString();
            }
            return strUserName;
        }
        #endregion
        #endregion

        #region 公告
        private void InnitNote()
        {
            AllPower.BLL.SysManage.Top top = new AllPower.BLL.SysManage.Top();

            //公告
            rptNote.DataSource = top.GetMessage(5,SiteID.ToString(), UserNo, userID);
            rptNote.DataBind();
        }
        #endregion
        #region 备忘录



        /// <summary>
        /// 保存备忘录
        /// </summary>
        private string UpdateMorandum(string content)
        { 
            try
            {
                string strMessage = "";
                //先判断是不是超级用户
                if (userID == "0")
                {
                    string xml = Server.MapPath("~/SysAdmin/Configuraion/adminLoginInfo.xml");
                    try
                    {
                        Utils.XmlUpdate(xml, "/root/Morandum", "", content);
                    }
                    catch (Exception exp)
                    {
                        strMessage = exp.ToString();
                    }
                }
                else
                {
                    AllPower.Model.SysManage.Account modelAccount = new AllPower.Model.SysManage.Account();
                    Account bllAccount = new Account();
                    modelAccount.UserID = int.Parse(userID);
                    modelAccount.Memorandum = content;
                    strMessage = bllAccount.Save("MEMORANDUM", modelAccount);
                    //如数据操作出现异常，这行将报错
                    int.Parse(strMessage);
                }
                //写日志
                WriteLog(GetLogValue("", "EDIT", "Memorandum", true), "", 2);
                return "保存成功！";
            }
            catch
            {

                return "数据操作失败！";
            }
            
        }

        private void InitMemorandum()
        {
            //先判断是不是超级用户
            //if (userID == "0")
            //{
            //    string xml = Server.MapPath("~/SysAdmin/Configuraion/adminLoginInfo.xml");
            //    txtMemorandum.Text = Utils.XmlRead(xml, "/root/Morandum", "");
            //}
            //else
            //{
            //    DataTable dt = new Account().GetList("ONE", Utils.getOneParams(userID));
            //    if (dt.Rows.Count > 0)
            //    {
            //        txtMemorandum.Text = dt.Rows[0]["Memorandum"].ToString();
            //    }
            //}
        }
        #endregion

        #region 我发表的信息
        private void InnitMeInfo()
        {
            try
            {
                //DataTable dt = new Top().GetMeInfo(UserNo,SiteID);
                //reptMeInfo.DataSource =dt;
                //reptMeInfo.DataBind();
            }
            catch 
            {
                
            }
          
        }
        #endregion

        #region 绑定待审核
        private void InitPendingAudit()
        {
            try
            {
                AllPower.Model.SelectParams prams = new AllPower.Model.SelectParams();
                prams.I1 = SiteID;
                prams.I2 = Utils.ParseInt(userID, 0);
                DataTable dt = new Top().GetPendingAudi(prams);
                reptAudit.DataSource = dt;
                reptAudit.DataBind();
            }
            catch
            { }
        }
        #endregion
    }
}
