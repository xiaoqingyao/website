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

public partial class Admin_SdfList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //调用事件
            Button1_Click(sender, e);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //显示全小区的水电费信息列表
        this.GridView1.DataSource = SQL.GetTable("select (楼栋名称 + 房间号 + '--' + 户主 + '--面积：' +  房屋面积 + '--' + 房屋用途) as 信息,* from 水电气费,住户,楼栋,员工信息 where 住户.楼栋代码=楼栋.楼栋代码 and 水电气费.住户代码=住户.住户代码 and 水电气费.员工代码 =员工信息.员工代码 and 水电气费.是否缴费=1 and 水电气费.收费单号 like '%" + TextBox1.Text + "%'");
        this.GridView1.DataBind();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string Key = this.GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
        if (e.CommandName == "See")
        {
            //传递修改的标志 跳转页面
            Response.Redirect("SdfSee.aspx?ID=" + Key);
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0)
        {
            //格式化显示日期
            e.Row.Cells[1].Text = Convert.ToDateTime(e.Row.Cells[1].Text).Date.ToShortDateString();
        }
    }
}
