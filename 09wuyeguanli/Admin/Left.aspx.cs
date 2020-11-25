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

public partial class Admin_Left : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //保存修改后的密码
        if (this.TextBox1.Text != this.TextBox2.Text)
        {
            Response.Write("<script>alert('密码不一致');</script>");
            return;
        }
        SQL.ExecData("update 管理员 set 密码='" + this.TextBox1.Text + "' ");
        Response.Write("<script>alert('修改成功');</script>");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
		Session["UserName"] = null;
		Session["UserCode"] = null;
        //跳转页面
		Response.Write("<script>parent.window.location.href='../Default.aspx'</script>");
    }
}
