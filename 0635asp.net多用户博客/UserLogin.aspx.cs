using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class UserLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["memberinfo"] != null)
            {
                JavaScriptHelper.AlertAndRedirect("您已经登录。", "usermain.aspx");
                return;
            }
        }
    }

    /// <summary>
    /// 登录
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtLoginUserName.Text;
        string userpwd = txtLoginUserPwd.Text;
        
        DataTable dt = DB.getDataTable("select * from Member where Username='" + username + "' and userpwd='" + userpwd + "'");

        if (dt.Rows.Count > 0)
        {
            //写COOKIE
            HttpCookie cookie = new HttpCookie("memberinfo");
            cookie.Values["UserName"] = HttpContext.Current.Server.UrlEncode(txtLoginUserName.Text.Trim());
            cookie.Values["MemberId"] = dt.Rows[0]["MemberId"].ToString();
            cookie.Values["MemberName"] = HttpContext.Current.Server.UrlEncode(dt.Rows[0]["MemberName"].ToString());


            HttpContext.Current.Response.AppendCookie(cookie);

            Response.Redirect("usermain.aspx");
        }
        else
        {
            Common.ShowMessage(this.Page, "帐号或密码错误。", "");
            return;
        }
    }

}
