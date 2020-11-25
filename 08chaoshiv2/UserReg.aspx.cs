using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
             
         
        } 
    } 


    protected void Button1_Click(object sender, EventArgs e)
    {
        string name = this.TextBox1.Text.Trim();
        string pwd = this.TextBox2.Text.Trim();
        string sex = this.DropDownList1.SelectedItem.Text.Trim();
        string realname = this.TextBox4.Text.Trim();

        string mobiletel = this.TextBox7.Text.Trim();
        string email = this.TextBox8.Text.Trim();
        string address = this.TextBox5.Text.Trim();
        string code = this.TextBox6.Text.Trim();

        string sql1 = "insert into tb_Member(MemberName,MemberPwd,Sex,RealName,MobileTel,Email,Address,Code) values ('{0} ','{1} ','{2} ','{3} ','{4} ','{5} ','{6} ','{7} ')";
        string sql2 = string.Format(sql1, name, pwd, sex, realname, mobiletel, email, address, code);//有几个占位符，就要传递几个变量值，而且要一一对应

        bool iRet = DBHelper.ExecSql(sql2);
        if (iRet)
        {

            Response.Write("<script language='javascript'>alert('注册成功！');location='javascript:history.go(-1)';</script>");
        } 
        else
        {
            Response.Write("<script language='javascript'>alert('注册失败！');location='javascript:history.go(-1)';</script>");
        } 
    } 
} 