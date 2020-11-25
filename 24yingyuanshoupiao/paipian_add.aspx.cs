using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class paipian_add : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string bindyingyuansql = "select * from yingyuan";
            DataSet ds = new Class1().hsggetdata(bindyingyuansql);
            this.yingyuan.DataSource = ds.Tables[0];
            this.yingyuan.DataTextField = "name";
            this.yingyuan.DataValueField = "id";
            this.yingyuan.DataBind();

            string bindyingpiansql = "select * from yingpian";
            ds = new Class1().hsggetdata(bindyingpiansql);
            this.yingpian.DataSource = ds.Tables[0];
            this.yingpian.DataTextField = "yingpianmingcheng";
            this.yingpian.DataValueField = "ID";
            this.yingpian.DataBind();
            playtime.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;

        sql = "insert into paipian(yingyuanid,yingyuanname,yingpianid,yingpianname,playtime) values('" + this.yingyuan.SelectedValue.ToString().Trim() + "','" + this.yingyuan.SelectedItem.Text.ToString().Trim() + "','" + this.yingpian.SelectedValue.ToString().Trim() + "','" + this.yingpian.SelectedItem.Text.ToString().Trim() + "','" + this.playtime.Text + "') ";
        int result;
        result = new Class1().hsgexucute(sql);
        if (result == 1)
        {
            Response.Write("<script>javascript:alert('添加成功');</script>");
        }
        else
        {
            Response.Write("<script>javascript:alert('系统错误，请检查数据库设置问题');</script>");
        }
    }
}