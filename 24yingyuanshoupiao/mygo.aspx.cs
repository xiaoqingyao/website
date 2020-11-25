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

public partial class mygo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["cx"].ToString().Trim() == "超级管理员" || Session["cx"].ToString().Trim() == "普通管理员")
        {
            Response.Redirect("left.html");
        }
       
        if (Session["cx"].ToString().Trim() == "注册用户" )
        {
            Response.Redirect("left2.html");
        }
    }
}
