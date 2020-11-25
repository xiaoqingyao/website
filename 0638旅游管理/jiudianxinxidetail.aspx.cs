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

public partial class jiudianxinxidetail : System.Web.UI.Page
{
    public string nbianhao, nmingcheng, nxingji, ndizhi, ndianhua, nzhaopian, nbeizhu;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string sql;
            sql = "select * from jiudianxinxi where id=" + Request.QueryString["id"].ToString().Trim();
            getdata(sql);
            sql = "select * from kefang where jiudian=(select mingcheng from jiudianxinxi where id=" + Request.QueryString["id"].ToString().Trim() + ") order by id desc";
            getdata2(sql);
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
                nbianhao = result.Tables[0].Rows[0]["bianhao"].ToString().Trim(); nmingcheng = result.Tables[0].Rows[0]["mingcheng"].ToString().Trim(); nxingji = result.Tables[0].Rows[0]["xingji"].ToString().Trim(); ndizhi = result.Tables[0].Rows[0]["dizhi"].ToString().Trim(); ndianhua = result.Tables[0].Rows[0]["dianhua"].ToString().Trim(); nzhaopian = result.Tables[0].Rows[0]["zhaopian"].ToString().Trim(); nbeizhu = result.Tables[0].Rows[0]["beizhu"].ToString().Trim();

            }
        }
    }
    private void getdata2(string sql)
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {

            if (result.Tables[0].Rows.Count > 0)
            {
                DataGrid1.DataSource = result.Tables[0];
                DataGrid1.DataBind();
                //Label1.Text = "以上数据中共" + result.Tables[0].Rows.Count + "条";
            }
            else
            {
                DataGrid1.DataSource = null;
                DataGrid1.DataBind();
            }
        }
    }

}

