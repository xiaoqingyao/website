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

public partial class NewsInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = DB.getDataTable("select * from News where Newsid=" + Request.QueryString["id"]);
            if (dt.Rows.Count == 1)
            {
                ltlTitle.Text = dt.Rows[0]["Title"].ToString();
                ltlAddTime.Text = dt.Rows[0]["AddTime"].ToString();
                ltlContent.Text = DB.ConvertStringToHtml(dt.Rows[0]["content"].ToString());

            }
        }
    }
}
