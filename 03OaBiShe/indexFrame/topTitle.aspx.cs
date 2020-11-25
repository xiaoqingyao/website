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

public partial class indexFrame_top : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) { ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true); return; }
        Label1.Text = Session["loginName"].ToString() ;
    }


}
