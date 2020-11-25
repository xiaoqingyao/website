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

public partial class Yg_ZhList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 在此处放置用户代码以初始化页面
        if (!Page.IsPostBack)
        {
            //显示当前操作员的住户列表
            this.GridView1.DataSource = SQL.GetTable("select * from 住户,楼栋 where 住户.楼栋代码=楼栋.楼栋代码 and 住户.员工代码='"+ Session["员工代码"].ToString() +"'");
            this.GridView1.DataBind();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //显示住户信息列表
        this.GridView1.DataSource = SQL.GetTable("select *  from 住户,楼栋 where 住户.楼栋代码=楼栋.楼栋代码 and 住户.户主 like '%" + TextBox1.Text + "%'");
        this.GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //跳转页面 
        Response.Redirect("ZhEdit.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string Key = this.GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
        if (e.CommandName == "Mod")
        {
            //传递修改的标志 跳转页面
            Response.Redirect("ZhEdit.aspx?ID=" + Key);
        }
        else if (e.CommandName == "Del")
        {
            //判断住户是否已经使用
            if (SQL.GetTable("select * from 物业费 where 住户代码=" + Key + "").Rows.Count > 0)
            {
                Terr.InnerHtml = "<font color='red'>当前住户有操作信息</font>";
                return;
            }
            if (SQL.GetTable("select * from 水电气费 where 住户代码=" + Key + "").Rows.Count > 0)
            {
                Terr.InnerHtml = "<font color='red'>当前住户有操作信息</font>";
                return;
            }
            if (SQL.GetTable("select * from 车位管理 where 住户代码=" + Key + "").Rows.Count > 0)
            {
                Terr.InnerHtml = "<font color='red'>当前住户有操作信息</font>";
                return;
            }
            if (SQL.GetTable("select * from  住户报修 where 住户代码=" + Key + "").Rows.Count > 0)
            {
                Terr.InnerHtml = "<font color='red'>当前住户有操作信息</font>";
                return;
            }
            //删除当前住户信息
            SQL.ExecData("delete from 住户 where 住户代码=" + Key + "");
            this.GridView1.DataSource = SQL.GetTable("select * from 住户,楼栋 where 住户.楼栋代码=楼栋.楼栋代码 and 住户.员工代码='" + Session["员工代码"].ToString() + "'");
            this.GridView1.DataBind();
        }
    }

}
