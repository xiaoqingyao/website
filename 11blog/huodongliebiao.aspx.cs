using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class huodongliebiao : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
    }
    protected void GridView1_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.Header && e.Row.RowType != DataControlRowType.Footer)
        {
            string huodongid = e.Row.Cells[0].Text.Trim();
            string sl = e.Row.Cells[3].Text.Trim();
            e.Row.Cells[3].Text = "<a href=# style=\"color:Blue\" onclick=\"openDetail('baomingmx.aspx?role=admin&huodongid=" + huodongid + "');\">" + sl + "</a>";
            e.Row.Cells[1].Text = "<a href=# style=\"color:Blue\" onclick=\"openDetail('huodongmingxi.aspx?huodongid=" + huodongid + "');\">" + e.Row.Cells[1].Text + "</a>";
        }
    }

    private void bind() {
        this.GridView1.DataSource = new Class1().hsggetdata("select *,(select count(*) from huodong_baoming where huodongid=hd.listid) as bms from huodong hd order by riqi desc");
        this.GridView1.DataBind();
    }

    protected void btn_DEL_Click(object sender, EventArgs e)
    {
        string id = ((Button)sender).CommandArgument;
        new Class1().hsgexucute("delete from huodong where listid='" + id + "'");
        bind();
    }
}
