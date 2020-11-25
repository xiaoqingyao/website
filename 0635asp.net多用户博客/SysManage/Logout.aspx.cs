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

public partial class SysManage_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["xzfgw"];
        if (cookie != null)
        {
            cookie.Expires = DateTime.Now.AddDays(-1);
            cookie.Values.Clear();
            System.Web.HttpContext.Current.Response.Cookies.Set(cookie);
            Response.Redirect("login.aspx");
        }
    }
}
