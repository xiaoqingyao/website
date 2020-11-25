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
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //用户登录
    protected void Button1_Click(object sender, EventArgs e)
    {
        string err = "";

        //判断输入
        if (lname.Value == "")
        {
            err += "用户名不能为空!";
        }

        if (pwd.Value == "")
        {
            err += "密码不能为空!";
        }

        //验证输入，如果不合法就弹出相应提示，并返回
        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        SqlDataReader sdr = null;
        if (DropDownList1.SelectedValue == "管理员")
        {
            sdr = SqlHelper.ExecuteReader("select * from admin where adminLname='" + lname.Value + "' and adminPass='" + pwd.Value + "'");
        }
        else
        {
            sdr = SqlHelper.ExecuteReader("select * from family where family_Lname='" + lname.Value + "' and family_Pass='" + pwd.Value + "'");
        }


        //判断用户是否存在
        if (sdr.Read())
        {
            //把用户信息存入到Session
            if (DropDownList1.SelectedValue == "管理员")
            {
                Session["uno"] = sdr["adminId"].ToString();
                Session["uname"] = sdr["adminLname"].ToString();
            }
            else
            {
                Session["uno"] = sdr["family_Id"].ToString();
                Session["uname"] = sdr["family_Name"].ToString();
            }
           
            Session["power"] = DropDownList1.SelectedValue;           

            //跳转到后台
            Response.Redirect("index.html");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('用户名或密码错误，请重试！');</script>");
            return;
        }
    }
}
