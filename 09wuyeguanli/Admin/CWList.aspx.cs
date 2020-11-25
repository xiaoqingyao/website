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

public partial class Admin_CWList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //显示全小区的车位列表上
            this.GridView1.DataSource = SQL.GetTable("select (楼栋名称 + 房间号 + '--' + 户主 + '--面积：' +  房屋面积 + '--' + 房屋用途) as 信息,* from 车位管理,住户,楼栋,员工信息 where 住户.楼栋代码=楼栋.楼栋代码 and 车位管理.住户代码=住户.住户代码 and 车位管理.员工代码 =员工信息.员工代码 ");
            this.GridView1.DataBind();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
