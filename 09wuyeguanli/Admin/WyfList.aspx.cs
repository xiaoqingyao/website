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

public partial class Admin_WyfList : System.Web.UI.Page
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
        // 在此处放置用户代码以初始化页面
        if (!Page.IsPostBack)
        {
            //显示当前操作员的车位列表
            this.GridView1.DataSource = SQL.GetTable("select * from 物业费 left join 物业费明细 on 物业费.住户代码 = 物业费明细.住户代码;");
            this.GridView1.DataBind();
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (this.GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value == null)
            {
                Response.Write("<script>alert('当前记录没有缴费，不能查看详细信息!');</script>");
                return;
            }
            string Key = this.GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
            if (e.CommandName == "See")
            {
                //传递修改的标志 跳转页面
                Response.Redirect("WyfSee.aspx?ID=" + Key);
            }
        }
        catch
        {
            Response.Write("<script>alert('当前记录没有缴费，不能查看详细信息!');</script>");

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
