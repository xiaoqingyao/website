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

public partial class Top : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Label1.Text = Session["teacherName"].ToString();

        //未登录即 session["statusid"]为空时，跳转到登录页面
        //if (Session["statusid"] == null || "".Equals(Session["statusid"].ToString()))
        //{
        //    Response.Redirect("UserLogin.aspx", true);
        //}
    }

}
