﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class listhuiyuan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["role"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "a", "window.parent.href='login.aspx'", true);
            return;
        }
        if (Session["role"].ToString().Trim() != "超级管理员")
        {
            Response.Write("<script>javascript:alert('对不起,您没有这个权限');history.back();</script>");
            Response.End();
        }
        if (!IsPostBack)
        {
            string sql;
            sql = "select *,(select SUM(jifen) as jifen from huodong hd,huodong_baoming bm where hd.listid=bm.huodongid and bm.uid=huiyuan.id) as jifen from huiyuan order by id desc";
            getdata(sql);
        }

    }

    private void getdata(string sql)
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                DataGrid1.DataSource = result.Tables[0];
                DataGrid1.DataBind();
            }
            else
            {
                DataGrid1.DataSource = null;
                DataGrid1.DataBind();
            }
        }
    }
}