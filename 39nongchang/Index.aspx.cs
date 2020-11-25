using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    public string role;
    public string userName;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userCode"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        string userCode = Session["userCode"].ToString();
        userName = Session["userName"].ToString();
        role = Session["role"].ToString();
        if (!IsPostBack)
        {

        }
    }
}