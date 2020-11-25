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

public partial class Admin_ZhBxList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //显示全小区的住户保修列表
            this.GridView1.DataSource = SQL.GetTable("select (楼栋名称 + 房间号 + '--' + 户主 + '--面积：' +  房屋面积 + '--' + 房屋用途) as 信息,* from 住户报修,住户,楼栋,员工信息 where 住户.楼栋代码=楼栋.楼栋代码 and 住户报修.住户代码=住户.住户代码 and 住户报修.员工代码 =员工信息.员工代码 ");
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
