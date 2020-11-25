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

public partial class Admin_LdList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 在此处放置用户代码以初始化页面
        if (!Page.IsPostBack)
        {
            //显示楼栋信息列表
            this.GridView1.DataSource = SQL.GetTable("select * from 楼栋");
            this.GridView1.DataBind();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //显示楼栋信息列表
        this.GridView1.DataSource = SQL.GetTable("select *  from 楼栋 where 楼栋.楼栋名称 like '%" + TextBox1.Text + "%'");
        this.GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //跳转页面 
        Response.Redirect("LdEdit.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       
        string Key = this.GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
        if (e.CommandName == "Mod")
        {
            //传递修改的标志 跳转页面
            Response.Redirect("LdEdit.aspx?ID=" + Key);
        }
        else if (e.CommandName == "Del")
        {
            //删除当前的楼栋信息
            if (SQL.GetTable("select * from 住户 where 楼栋代码=" + Key + "").Rows.Count > 0)
            {
                Terr.InnerHtml = "<font color='red'>当前楼栋使用中</font>";
                return;
            }
            SQL.ExecData("delete from 楼栋 where 楼栋代码=" + Key + "");
            this.GridView1.DataSource = SQL.GetTable("select * from 楼栋");
            this.GridView1.DataBind();
        }
    }
}
