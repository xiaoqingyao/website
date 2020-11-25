﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Yg_SdfList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 在此处放置用户代码以初始化页面
        if (!Page.IsPostBack)
        {
            //显示当前操作员的车位列表
            this.GridView1.DataSource = SQL.GetTable("select * from 水电气费");
            this.GridView1.DataBind();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string Key = this.GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
        if (e.CommandName == "Mod")
        {
            if (SQL.GetTable("select 是否缴费 from 水电气费 where 收费单号 = " + Key + "").Rows[0][0].ToString() == "0")
            {
                //传递修改的标志 跳转页面
                Response.Redirect("SdfEdit.aspx?ID=" + Key);
            }
            else
            {
                Response.Write("<script>alert('已交费不能编辑!');</script>");
            }
        }
        else if (e.CommandName == "Del")
        {
            if (SQL.GetTable("select 是否缴费 from 水电气费 where 收费单号 = '" + Key + "'").Rows[0][0].ToString() == "0")
            {
                //删除当前的收费
                SQL.ExecData("delete from 水电气费 where 收费单号 = '" + Key + "'");
                this.GridView1.DataSource = SQL.GetTable("select * from 水电气费");
                this.GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('已交费不能删除!');</script>");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //传递修改的标志 跳转页面
        Response.Redirect("SdfEdit.aspx");
    }
}
