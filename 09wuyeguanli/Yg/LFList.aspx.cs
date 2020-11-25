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

public partial class Yg_LF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.GridView1.DataSource = SQL.GetTable("select * from  来访信息");
            this.GridView1.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //跳转页面 
        Response.Redirect("LFEdit.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string Key = this.GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
        if (e.CommandName == "Mod")
        {
            //传递修改的标志 跳转页面
            Response.Redirect("LFEdit.aspx?ID=" + Key);
        }
        else if (e.CommandName == "Del")
        {
            //当前的住户报修

            SQL.ExecData("delete from  来访信息 where 来访代码=" + Key + "");
            this.GridView1.DataSource = SQL.GetTable("select * from  来访信息 ");
            this.GridView1.DataBind();
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0)
        {
            e.Row.Cells[1].Text = e.Row.Cells[1].Text.ToString();
        }
    }
}