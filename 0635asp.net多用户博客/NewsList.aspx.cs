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

public partial class NewsList : System.Web.UI.Page
{
    protected string typeid = "1";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["typeid"]))
            typeid = Request.QueryString["typeid"];
        if (!IsPostBack)
        {
            rptListNews.DataSource = DB.getDataTable("select * from News where typeid=" + typeid + " order by Newsid desc");
            rptListNews.DataBind();
        }
    }
}
