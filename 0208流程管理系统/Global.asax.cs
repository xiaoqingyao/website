using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using AllPower.Common;

namespace AllPower.WEB
{
    public class Global : System.Web.HttpApplication
    {
        public System.Threading.Thread TaskThread = null;

        protected void Application_Start(object sender, EventArgs e)
        {
            //TaskThread=AllPower.BLL.SysManage.TaskTool.CreateTimerTaskService();
            //TaskThread.Start();
            Application["SysStartTime"] = DateTime.Now;
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            try
            {
                string strLang = Utils.GetCookie(SystemConst.COOKIES_KEY, SystemConst.COOKIES_LANG_KEY);
                if (strLang != "")  //如果当前选定了语言包,则使用选定的语言包

                {
                    System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture(strLang);
                    System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(strLang);
                }                
            }
            catch (Exception ex)
            { }

            try
            {
                string session_param_name = "ASPSESSID";
                string session_cookie_name = "ASP.NET_SESSIONID";

                if (HttpContext.Current.Request.Form[session_param_name] != null)
                {
                    UpdateCookie(session_cookie_name, HttpContext.Current.Request.Form[session_param_name]);
                }
                else if (HttpContext.Current.Request.QueryString[session_param_name] != null)
                {
                    UpdateCookie(session_cookie_name, HttpContext.Current.Request.QueryString[session_param_name]);
                }
            }
            catch (Exception)
            {
            }

        }

        void UpdateCookie(string cookie_name, string cookie_value)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies.Get(cookie_name);
            if (cookie == null)
            {
                HttpCookie cookie1 = new HttpCookie(cookie_name, cookie_value);
                Response.Cookies.Add(cookie1);
            }
            else
            {
                cookie.Value = cookie_value;
                HttpContext.Current.Request.Cookies.Set(cookie);
            }
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {
            if (null != TaskThread)
            {
                TaskThread.Abort();
            }
        }
    }
}