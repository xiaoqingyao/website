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

public partial class Admin_topMenu : System.Web.UI.Page
{
    public string username = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "window.parent.location.href='Login.aspx'", true);
        }
        else {
            username = Session["userName"].ToString();
        }
    }

    protected void LoginOut_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "window.parent.location.href='Login.aspx'", true);
    }
}
