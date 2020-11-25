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

public partial class Yg_ZhbxList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 在此处放置用户代码以初始化页面
        if (!Page.IsPostBack)
        {
            //显示当前操作员的住户报修列表
            this.GridView1.DataSource = SQL.GetTable("select (楼栋名称 + 房间号 + '--' + 户主 + '--面积：' +  房屋面积 + '--' + 房屋用途) as 信息,* from  住户报修,住户,楼栋 where 住户.楼栋代码=楼栋.楼栋代码 and  住户报修.住户代码=住户.住户代码 and  住户报修.员工代码 = '" + Session["员工代码"].ToString() + "' ");
            this.GridView1.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //跳转页面 
        Response.Redirect("ZhbxEdit.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string Key = this.GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
        if (e.CommandName == "Mod")
        {
            //传递修改的标志 跳转页面
            Response.Redirect("ZhbxEdit.aspx?ID=" + Key);
        }
        else if (e.CommandName == "Del")
        {
            //当前的住户报修

            SQL.ExecData("delete from  住户报修 where 报修代码=" + Key + "");
            this.GridView1.DataSource = SQL.GetTable("select (楼栋名称 + 房间号 + '--' + 户主 + '--面积：' +  房屋面积 + '--' + 房屋用途) as 信息,* from  住户报修,住户,楼栋 where 住户.楼栋代码=楼栋.楼栋代码 and  住户报修.住户代码=住户.住户代码 and  住户报修.员工代码 = '" + Session["员工代码"].ToString() + "' ");
            this.GridView1.DataBind();
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
