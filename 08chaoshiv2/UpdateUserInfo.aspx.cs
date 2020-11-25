using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UpdateUserInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            GetUserInfo();
        } 
    } 

    private void GetUserInfo()
    {
        string sql = "select * from tb_Member where MemberID =" + Session["MemberID"];//MemberID是整数，不用加单引号
        DataTable dt = DBHelper.GetDataSet(sql).Tables[0];

        this.TextBox1.Text = dt.Rows[0]["MemberName"].ToString();
        this.TextBox2.Text = dt.Rows[0]["MemberPwd"].ToString();
        this.TextBox3.Text = dt.Rows[0]["MemberPwd"].ToString();
        this.TextBox4.Text = dt.Rows[0]["RealName"].ToString();
        this.TextBox5.Text = dt.Rows[0]["Address"].ToString();
        this.TextBox6.Text = dt.Rows[0]["Email"].ToString();
        this.TextBox7.Text = dt.Rows[0]["MobileTel"].ToString();
        this.TextBox8.Text = dt.Rows[0]["Code"].ToString();
        this.DropDownList1.Text = dt.Rows[0]["Sex"].ToString();
        
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
        string sql1 = "update tb_Member set MemberName='" + name + "',RealName='" + realname + "',Sex='" + sex + "',MemberPwd='" + pwd + "',MobileTel='" + mobiletel + "'" + ",Email='" + email + "',Address='" + address + "',Code='" + code + "' where MemberID=" + Convert.ToInt32(Session["MemberID"]);

        bool b = DBHelper.ExecSql(sql1);
        if (b)
        {
            GetUserInfo();
            Response.Write("<script language='javascript'>alert('修改成功！');location='javascript:history.go(-1)';</script>");
        } 
        else
        {
            Response.Write("<script language='javascript'>alert('修改失败！');location='javascript:history.go(-1)';</script>");
        } 
    } 
} 