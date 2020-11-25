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
using System.Data.SqlClient;　　　//引入命名空间
public partial class Login_sysLogin : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["vote"] = "";
        //labTitle.Text = Request.QueryString["title"].ToString();

    }
    protected void btnCandel_Click(object sender, EventArgs e)
    {
        txtName.Text = "";
        txtPwd.Text="";
    }
    
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if(txtPwd.Text ==""&&txtName.Text =="")
        {
            
            Response.Write(bc.MessageBox("用户名称和密码不能为空!"));
            return;
        }
        if (this.type.SelectedValue.Equals("sys"))   //系统管理员登录
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
            SqlCommand cmd=new SqlCommand("select count(*) from sysUser where userName='"+txtName.Text +"'and userPwd='"+txtPwd.Text+ "'and system=1",con);
            cmd.Connection.Open();
            int i = (int)cmd.ExecuteScalar();
            cmd.Connection.Close();
            if (i>0)
            {
                //登陆成功后，设置登陆时间和标识
                bc.ExecSQL("update sysUser set logintime='"+DateTime.Now+"',sign=1 where userName='"+txtName.Text+"'");
                Response.Write("<script language=javascript>this.location.href='../index.aspx?flg=sys'</script>");
                Session["loginName"] =txtName.Text;
            }
            else
            {
                Response.Write(bc.MessageBox("用户名或密码错误!"));
            }
            con.Close();
        }
        else　　//学生
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
            SqlCommand cmd = new SqlCommand("select count(*) from sysUser where userName='" + txtName.Text + "'and userPwd='" + txtPwd.Text + "'and system=0", con);
            cmd.Connection.Open();
            int i = (int)cmd.ExecuteScalar();
            cmd.Connection.Close();
            if (i > 0)
            {
                //登陆成功后，设置登陆时间和标识
                bc.ExecSQL("update sysUser set logintime='" + DateTime.Now + "',sign=1 where userName='" + txtName.Text + "'");
                Response.Write("<script language=javascript>this.location.href='../index.aspx?flg=stu'</script>");
                Session["loginName"] = txtName.Text;
            }
            else
            {
                Response.Write(bc.MessageBox("用户名或密码错误!"));
            }
            con.Close();
        }
        
        

    }
}
