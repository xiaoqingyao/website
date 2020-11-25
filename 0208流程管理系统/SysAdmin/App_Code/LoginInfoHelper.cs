using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.SessionState;
using System.Web;
using AllPower.Common;
using AllPower.Model.SysManage;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;

namespace AllPower.Web.Admin
{

    /// <summary>
    /// 对当前登陆用户信息进行操作的类

    /// @author 陈顺 by 2010-03-24
    /// </summary>

    public class LoginInfoHelper
    {
        /// <summary>
        /// 验证登录信息是否有效
        /// </summary>
        /// <param Name="session">HttpSessionState对象(Page的Session)</param>
        /// <param Name="response">HttpResponse对象(Page的Response)</param>
        /// <returns></returns>
        public static bool ValidateLoginInfo(HttpSessionState session, HttpResponse response)
        {

            bool isvalid = false;
            if (session != null && session[SystemConst.SYSTEM_SESSION_LOGININFO] != null)
            {
                if (System.Web.HttpContext.Current.Request.Cookies["AdminUserInfo"] == null)
                {
                    Account account = (Account)session[SystemConst.SYSTEM_SESSION_LOGININFO];

                    BinaryFormatter bf = new BinaryFormatter();  //声明一个序列化类
                    MemoryStream ms = new MemoryStream();  //声明一个内存流
                    bf.Serialize(ms, account);  //执行序列化操作
                    byte[] result = new byte[ms.Length];
                    result = ms.ToArray();
                    string temp = System.Web .HttpContext .Current .Server.UrlEncode(System.Convert.ToBase64String(result));
                    ms.Flush();
                    ms.Close();

                    System.Web.HttpContext.Current.Response.Cookies["AdminUserInfo"].Value = temp + "|" + session["SiteID"];
                }

                isvalid = true;
            }
            else
            {
                //退出系统
                isvalid = GetAccountByCookies();
                if (isvalid == false)
                    response.Redirect("~/SysAdmin/Login.aspx");
            }
            return isvalid;
        }


        /// <summary>
        /// 得到当前登录的用户的对象
        /// </summary>
        /// <param Name="session">HttpSessionState对象(Page的Session)</param>
        /// <param Name="response">HttpResponse对象(Page的Response)</param>
        /// <returns></returns>
        public static Account GetLoginAccount(HttpSessionState session, HttpResponse response)
        {
            if (ValidateLoginInfo(session, response))
            {
                Account account = (Account)session[SystemConst.SYSTEM_SESSION_LOGININFO];
                return account;
            }
            else
            {
                return null;
            }
        }

        private static bool GetAccountByCookies()
        {
            if (System.Web.HttpContext.Current.Request.Cookies["AdminUserInfo"] != null)
            {
                string account = System.Web.HttpContext.Current.Request.Cookies["AdminUserInfo"].Value.ToString();
                if (account.IndexOf("|") > 0)
                {
                    string[] arr = account.Split('|');
                    byte[] b = System.Convert.FromBase64String(System.Web.HttpContext.Current.Server.UrlDecode(arr[0]));  //将得到的字符串根据相同的编码格式分成字节数组
                    MemoryStream ms = new MemoryStream(b, 0, b.Length);  //从字节数组中得到内存流
                    BinaryFormatter bf = new BinaryFormatter();
                    Account super = bf.Deserialize(ms) as Account;  //反序列化得到Person类对象
                    System.Web.HttpContext.Current.Session[SystemConst.SYSTEM_SESSION_LOGININFO] = super;
                    System.Web.HttpContext.Current.Session["SiteID"] = arr[1];

                    return true;
                }
            }
            return false;
        }

        /// <summary>
        /// 得到当前登录的用户账号的主键（表SysAccount中的主键）

        /// </summary>
        /// <param Name="session">HttpSessionState对象(Page的Session)</param>
        /// <param Name="response">HttpResponse对象(Page的Response)</param>
        /// <returns></returns>
        public static string GetLoginAccountId(HttpSessionState session, HttpResponse response)
        {

            return GetLoginAccount(session, response).UserID.ToString();
        }

    }

}
