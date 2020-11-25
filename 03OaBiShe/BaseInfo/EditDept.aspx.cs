﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
public partial class BaseInfo_updateDept : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true);
        GridView1.DataSource= bc.GetDataSet("select * from dept", "dept");
        GridView1.DataKeyNames = new String[] { "deptID" };
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex  = e.NewPageIndex;
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            bc.ExecSQL("delete from dept where deptID='" + this.GridView1.DataKeys[e.RowIndex].Value.ToString() + "'");
            GridView1.DataSource = bc.GetDataSet("select * from dept", "dept");
            GridView1.DataBind();
        }
        catch(Exception ex)
        {
            Response.Write(bc.MessageBox(ex.Message));
        }
    }

}