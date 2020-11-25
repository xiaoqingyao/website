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

public partial class Admin_WysbList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 在此处放置用户代码以初始化页面
        if (!Page.IsPostBack)
        {
            //显示物业设备列表
            this.GridView1.DataSource = SQL.GetTable("select * from 物业设备");
            this.GridView1.DataBind();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //显示物业设备信息列表
        this.GridView1.DataSource = SQL.GetTable("select *  from 物业设备 where 物业设备.设备名称 like '%" + TextBox1.Text + "%'");
        this.GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //跳转页面 
        Response.Redirect("WysbEdit.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string Key = this.GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
        if (e.CommandName == "Mod")
        {
            //传递修改的标志 跳转页面
            Response.Redirect("WysbEdit.aspx?ID=" + Key);
        }
        else if (e.CommandName == "Del")
        {
            //删除物业设备
            SQL.ExecData("delete from 物业设备 where 设备代码=" + Key + "");
            this.GridView1.DataSource = SQL.GetTable("select * from 物业设备");
            this.GridView1.DataBind();
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0)
        {
            //格式化显示日期
            e.Row.Cells[2].Text = Convert.ToDateTime(e.Row.Cells[2].Text).Date.ToShortDateString();  
        }
    }
}
