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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cx.Items.Add("管理员");
            cx.Items.Add("注册用户");

        }
    }

    
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text.ToString().Trim() == "" || TextBox1.Text.ToString().Trim() == "")
        {
            Response.Write("<script>javascript:alert('请输入完整');history.back();</script>");
            Response.End();
        }
        string sql;
        sql = "";
        if (cx.Text.ToString().Trim() == "管理员")
        {
            sql = "select * from allusers where username='" + TextBox1.Text.ToString().Trim() + "' and pwd='" + TextBox2.Text.ToString().Trim() + "'";
        }
        //if (cx.Text.ToString().Trim() == "教师")
        //{
        //    sql = "select * from allusers where username='" + TextBox1.Text.ToString().Trim() + "' and pwd='" + TextBox2.Text.ToString().Trim() + "' and cx='教师'";
        //}
        //if (cx.Text.ToString().Trim() == "学生")
        //{
        //    sql = "select * from ruzhuxinxi where xuehao='" + TextBox1.Text.ToString().Trim() + "' and mima='" + TextBox2.Text.ToString().Trim() + "' ";
        //}
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        // result = new TestOnline.Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                Session["username"] = TextBox1.Text.ToString().Trim();


                Session["cx"] = result.Tables[0].Rows[0]["cx"].ToString().Trim();


                Response.Redirect("main.aspx");
            }
            else
            {
                Response.Write("<script>javascript:alert('对不起，用户名或密码不正确!');history.back();</script>");
            }
        }
        else
        {
            Response.Write("<script>javascript:alert('对不起，系统错误，请不要越权操作!');</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
       // Response.Redirect("yonghuzhuce_add.aspx");
    }
   
}
