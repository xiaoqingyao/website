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

public partial class PersonalManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["perName"] == null)
        {
            string url = Request.Url.AbsoluteUri;
            Session["url"] = url;
            Response.Write("<script LANGUAGE='javascript'>alert('对不起！您还没有登陆请先登陆');window.location='login.aspx'</script>");
        }
        else
        {
            this.lblPerName.Text = Session["PerName"].ToString();
        }
    }
}
