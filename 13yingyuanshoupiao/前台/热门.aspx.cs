using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 前台_热门 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        int n = this.GridView1.SelectedIndex;
        string temp = this.GridView1.Rows[n].Cells[1].Text.ToString();
        string s = "~/前台/MovieDetail.aspx?ArrangeID=" + temp;
        Response.Redirect(s);
    }
}
