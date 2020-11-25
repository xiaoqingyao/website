using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.SessionState;
using System.Web;
using KingTop.Common;
using KingTop.Model.SysManage;
using System.IO;
namespace KingTop.Web.Admin
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
                isvalid = true;
            }
            else
            {
                //退出系统
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
