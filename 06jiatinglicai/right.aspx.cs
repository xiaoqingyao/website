using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class right : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["power"].ToString() == "管理员")
        {
            Response.Redirect("in_Type/manage.aspx");
        }
        else
        {
            Response.Redirect("in_pay/manage.aspx");
        }
    }
}
