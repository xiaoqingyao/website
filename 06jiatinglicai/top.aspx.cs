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

public partial class top : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uno"] == null)
        {
            Response.Write("<script>alert('登陆超时，请重新登陆！');top.location='login.aspx';</script>");
            Response.End();
        }

        if (!IsPostBack)
        {
            Label1.Text = Session["uname"].ToString();
            Label2.Text = Session["power"].ToString();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Write("<script>top.location='login.aspx';</script>");
    }
}
