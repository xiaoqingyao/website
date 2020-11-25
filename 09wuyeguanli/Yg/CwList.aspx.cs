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

public partial class Yg_CwList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 在此处放置用户代码以初始化页面
        if (!Page.IsPostBack)
        {
            //显示当前操作员的车位列表
            this.GridView1.DataSource = SQL.GetTable("select (楼栋名称 + 房间号 + '--' + 户主 ) as 信息,* from 车位管理,住户,楼栋 where 住户.楼栋代码=楼栋.楼栋代码 and 车位管理.住户代码=住户.住户代码 and 车位管理.员工代码 = '"+ Session["员工代码"].ToString() +"' ");
            this.GridView1.DataBind();
        }
    }
  /*  protected void Button2_Click(object sender, EventArgs e)
    {
        //显示车位信息列表
        this.GridView1.DataSource = SQL.GetTable("select *  from 车位信息 where 车位信息.车位名称 like '%" + TextBox1.Text + "%'");
        this.GridView1.DataBind();
    }*/
    protected void Button1_Click(object sender, EventArgs e)
    {
        //跳转页面 
        Response.Redirect("CwEdit.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string Key = this.GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
        if (e.CommandName == "Mod")
        {
            //传递修改的标志 跳转页面
            Response.Redirect("CwEdit.aspx?ID=" + Key);
        }
        else if (e.CommandName == "Del")
        {
            //删除当前的车位

            SQL.ExecData("delete from 车位管理 where 车位代码=" + Key + "");
            this.GridView1.DataSource = SQL.GetTable("select (楼栋名称 + 房间号 + '--' + 户主 + '--面积：' +  房屋面积 + '--' + 房屋用途) as 信息,* from 车位管理,住户,楼栋 where 住户.楼栋代码=楼栋.楼栋代码 and 车位管理.住户代码=住户.住户代码 and 车位管理.员工代码 = '" + Session["员工代码"].ToString() + "' "); 
            this.GridView1.DataBind();
        }
    }
}
