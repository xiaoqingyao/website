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

public partial class Admin_UserList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 在此处放置用户代码以初始化页面
        if (!Page.IsPostBack)
        {
            //显示员工信息列表
            this.GridView1.DataSource = SQL.GetTable("select * from 员工信息");
            this.GridView1.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //跳转页面 
        Response.Redirect("UserEdit.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //显示员工信息列表
        this.GridView1.DataSource = SQL.GetTable("select *  from 员工信息 where 员工信息.员工代码 like '%" + TextBox1.Text + "%'");
        this.GridView1.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        string Key = this.GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
        if (e.CommandName == "Mod")
        {
            //传递修改的标志 跳转页面
            Response.Redirect("UserEdit.aspx?ID=" + Key);
        }
        else if (e.CommandName == "Del")
        {
            //判断员工信息是否已经被使用
            if (SQL.GetTable("select * from 住户 where 员工代码='" + Key + "'").Rows.Count > 0)
            {
                Terr.InnerHtml = "<font color='red'>当前员工有操作信息</font>";
                return;
            }
            if (SQL.GetTable("select * from 物业费 where 员工代码='" + Key + "'").Rows.Count > 0)
            {
                Terr.InnerHtml = "<font color='red'>当前员工有操作信息</font>";
                return;
            }
            if (SQL.GetTable("select * from 水电气费 where 员工代码='" + Key + "'").Rows.Count > 0)
            {
                Terr.InnerHtml = "<font color='red'>当前员工有操作信息</font>";
                return;
            }
            if (SQL.GetTable("select * from 车位管理 where 员工代码='" + Key + "'").Rows.Count > 0)
            {
                Terr.InnerHtml = "<font color='red'>当前员工有操作信息</font>";
                return;
            }
            if (SQL.GetTable("select * from  住户报修 where 员工代码='" + Key + "'").Rows.Count > 0)
            {
                Terr.InnerHtml = "<font color='red'>当前员工有操作信息</font>";
                return;
            }
            //删除员工信息  刷新列表
            SQL.ExecData("delete from 员工信息 where 员工代码='" + Key + "'");
            this.GridView1.DataSource = SQL.GetTable("select * from 员工信息"); 
            this.GridView1.DataBind();
        }
    }
}
