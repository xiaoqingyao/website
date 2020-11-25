using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Yg_CwInfoList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 在此处放置用户代码以初始化页面
        if (!Page.IsPostBack)
        {
            //显示当前操作员的车位列表
            this.GridView1.DataSource = SQL.GetTable("select *,(select case COUNT(*) when 0 then '未占用' else '已占用' end  from 车位管理 where 车位代码=车位信息.ID) as 占用状态 from 车位信息");
            this.GridView1.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //传递修改的标志 跳转页面
        Response.Redirect("CwInfoEdit.aspx");
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string Key = this.GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
        if (e.CommandName == "Mod")
        {
            //传递修改的标志 跳转页面
            Response.Redirect("CwInfoEdit.aspx?ID=" + Key);
        }
        else if (e.CommandName == "Del")
        {
            //删除当前的车位
            SQL.ExecData("delete from 车位信息 where ID = " + Key + "");
            this.GridView1.DataSource = SQL.GetTable("select * from 车位信息");
            this.GridView1.DataBind();
        }
    }
}
