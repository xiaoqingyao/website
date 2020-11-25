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
using System.Data.SqlClient;

public partial class shebei_look : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind();
    }
    protected SqlConnection GetConnection()
    {
        string conn = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        SqlConnection myConn = new SqlConnection(conn);
        return myConn;

    }
    public void Bind()
    {
        SqlConnection conn = GetConnection();
        conn.Open();
        string sqlstr = "select * from shebei ";
        SqlDataAdapter ada = new SqlDataAdapter(sqlstr, conn);
        DataSet ds = new DataSet();
        ada.Fill(ds, "shebei");
        //ds = dss.ExceDSS(strQuery, "FindEmployerInfo","machine");

        if (ds.Tables["shebei"].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataKeyNames = new string[] { "id" };//----
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            Response.Write("<script lanuage=javascript>alert('没有相关数据！');</script>");
        }
        conn.Close();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }
}
