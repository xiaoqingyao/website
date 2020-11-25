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

public partial class analysis_loan_analysis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "月借(贷)款分析";

            DataSet ds = SqlHelper.ExecuteforDataSet("select distinct convert(char(4),im_time1,121) as mo from Loan_Money");
            ddlfamily_Id.DataSource = ds;
            ddlfamily_Id.DataTextField = "mo";
            ddlfamily_Id.DataValueField = "mo";
            ddlfamily_Id.DataBind();
        
            BindData();
        }
    }

    /// <summary>
    /// 绑定
    /// </summary>
    private void BindData()
    {
        
        string where = " where 1=1  ";

        if (ddlfamily_Id.SelectedValue != "")
        {
            where += " and convert(char(4),im_time1,121)='" + ddlfamily_Id.SelectedValue + "'";
        }

        string sql = @"select convert(char(7),im_time1,121) as mm,sum(im_money) as t1 from Loan_Money " + where + @"
                        group by convert(char(7),im_time1,121) 
                        order by mm desc";

        Repeater1.DataSource = SqlHelper.ExecuteforDataSet(sql);
        Repeater1.DataBind();

        Label2.Text = SqlHelper.ExecuteScalar("select sum(im_money) from Loan_Money a where convert(char(4),im_time1,121)='" + ddlfamily_Id.SelectedValue + "'").ToString();
        Label2.Text = Label2.Text == "" ? "0" : Label2.Text;
    }

    /// <summary>
    /// 搜索
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindData();
    }
}