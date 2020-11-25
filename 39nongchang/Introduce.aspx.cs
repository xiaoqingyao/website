using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Introduce : System.Web.UI.Page
{
    sqlHelper server = new sqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindGrid();
        }
    }

    private void bindGrid()
    {
        string sql = "select top 5 * from message order by pubdate desc";
        DataTable dt = server.GetDataTable(sql, null);
        this.GridView1.DataSource = dt;
        this.GridView1.DataBind();
    }
}