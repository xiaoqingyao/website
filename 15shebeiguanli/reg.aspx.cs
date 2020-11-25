using System;
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

public partial class reg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected SqlConnection GetConnection()
    {
        string conn = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        SqlConnection myConn = new SqlConnection(conn);
        return myConn;

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = GetConnection();
        conn.Open();
        string users1 = users.Text.Trim();
        string pass1 = pass.Text.Trim();
        string sex1 = sex.Text.Trim();
        string tel1 = tel.Text.Trim();
        string qq1 = qq.Text.Trim();
        string email1 = email.Text.Trim();
        string beizhu1 = beizhu.Text.Trim();
        if (users.Text.Length == 0)
        {
            Response.Write("<script language=javascript>alert('用户名不能为空!');location='reg.aspx'</script>");
        }
        //插入语句，用来将数据提交到数据库当中的关键代码
        string strsql = "insert into reg(users,pass,sex,tel,qq,email,beizhu,shijian) values(N'" + users1 + "',N'" + pass1 + "',N'" + sex1 + "',N'" + tel1 + "',N'" + qq1 + "',N'" + email1 + "',N'" + beizhu1 + "','" + DateTime.Now.ToShortDateString() + "') ";
        SqlCommand cmd = new SqlCommand(strsql, conn);
        //执行sql语句
        cmd.ExecuteNonQuery();
        Response.Write("<script language=javascript>alert('用户注册成功!');</script>");
        //清空变量
        users.Text = "";
        pass.Text = "";
        sex.Text = "";
        tel.Text = "";
        qq.Text = "";
        email.Text = "";
        beizhu.Text = "";
    }
}
