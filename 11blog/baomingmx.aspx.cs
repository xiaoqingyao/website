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

public partial class baomingmx : System.Web.UI.Page
{
    string role = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["role"] != null)
        {
            role = Request["role"];
        }
        if (!IsPostBack)
        {
            bind();
        }
    }
    private void bind()
    {
        string huodongid = Request["huodongid"].ToString();
        DataSet ds = new Class1().hsggetdata("select bm.listid as bmid,* from huodong_baoming bm,huiyuan hy where bm.uid=hy.id and huodongid='" + huodongid + "' order by bmdate desc");
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblmsg.Text = "以下是活动报名明细";
        }
        else
        {
            lblmsg.Text = "暂时没有人报名哦~";
        }
        this.lblname.Text = new Class1().hsggetdata("select * from huodong where listid='" + huodongid + "'").Tables[0].Rows[0]["biaoti"].ToString();
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        string id = ((Button)sender).CommandArgument;
        new Class1().hsgexucute("delete from huodong_baoming where listid='" + id + "'");
        bind();
    }

    protected void rowdatabind(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        {
            if (!role.Equals("admin"))
            {
                e.Row.Cells[6].Visible = false;
            }
        }
    }
}
