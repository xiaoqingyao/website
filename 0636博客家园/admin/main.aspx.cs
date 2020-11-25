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

public partial class admin_main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                lblAdminName.Text = Session["AdminName"].ToString();
            }
            catch
            { }
        }
    }
    protected void lbtnExit_Click(object sender, EventArgs e)
    {
        Session["AdminNo"] = null;
        Session["AdminName"] = null;
        Session["AdminLogName"] = null;
        Response.Redirect("login.aspx");
    }
}
