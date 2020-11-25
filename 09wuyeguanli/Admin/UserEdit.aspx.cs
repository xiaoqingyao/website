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

public partial class Admin_UserEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //显示当前的员工信息
            if (Request.QueryString["ID"] != null)
            {
                DataTable dt = new DataTable();
                dt = SQL.GetTable("select * from 员工信息 where 员工代码='" + Request.QueryString["ID"] + "'");
                if (dt.Rows.Count > 0)
                {
                    TextBox9.Text = dt.Rows[0]["员工代码"].ToString();
                    TextBox10.Text = dt.Rows[0]["员工名称"].ToString();
                    TextBox4.Text = dt.Rows[0]["职位"].ToString();
                    TextBox1.Text = dt.Rows[0]["地址"].ToString();
                    TextBox2.Text = dt.Rows[0]["联系电话"].ToString();
                    TextBox3.Text = dt.Rows[0]["身份证号"].ToString();
                    TextBox5.Text = dt.Rows[0]["性别"].ToString();
                    TextBox6.Text = dt.Rows[0]["婚否"].ToString();
                    TextBox8.Text = dt.Rows[0]["员工介绍"].ToString();
                    TextBox9.Enabled = false;
                }
            }
        }
       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //跳转页面
        Response.Redirect("UserList.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //判断信息是否正确
        if (TextBox9.Text == "" || TextBox10.Text == "")
        {
            Terr.InnerHtml = "<font color='red'>员工代码或员工名称不能为空</font>";
            return;
        }
        if (TextBox9.Text == "admin")
        {
            Terr.InnerHtml = "<font color='red'>员工代码不能为admin</font>";
            return;
        }
        //根据不同的标志  添加或修改员工信息
        if (TextBox9.Enabled == false)
        {
            SQL.ExecData("update 员工信息 set 员工名称='" + TextBox10.Text + "',职位='" + TextBox4.Text + "',地址='" + TextBox1.Text + "',联系电话='" + TextBox2.Text + "',员工介绍='" + TextBox8.Text + "',性别='" + TextBox5.Text + "',身份证号='" + TextBox3.Text + "',婚否='" + TextBox6.Text + "' where 员工代码='" + Request.QueryString["ID"] + "'");
        }
        else
        {
            if (SQL.GetTable("select * from 员工信息 where 员工代码='" + Request.QueryString["ID"] + "'").Rows.Count > 0)
            {
                Terr.InnerHtml = "<font color='red'>员工代码重复</font>";
                return;
            }
            SQL.ExecData("insert into 员工信息(员工代码,员工名称,职位,地址,联系电话,员工介绍,密码,身份证号,性别,婚否) values('" + TextBox9.Text + "','" + TextBox10.Text + "','" + TextBox4.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox8.Text + "','wuye','" + TextBox3.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "')");
        }
        Response.Redirect("UserList.aspx");
    }
}
