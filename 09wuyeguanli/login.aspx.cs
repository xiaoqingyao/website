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

public partial class Login : System.Web.UI.Page
{
    public string html = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// 登录
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void BtnOK_Click(object sender, EventArgs e) {


        if (txtUserName.Text == null || txtUserName.Text == "" || txtUserName.Text.Length <= 0) {
            ShowMessage("用户名称为空，请输入用户名称！");
            return;
        }

        if (txtPassword.Text == null || txtPassword.Text == "" || txtPassword.Text.Length <= 0) {
            ShowMessage("用户密码为空，请输入用户密码！");
            return;
        }

        string sql = "select * from 住户 where 户主='"+txtUserName.Text+"'";
        DataTable dt =  SQL.GetTable(sql);
        if (dt.Rows.Count == 0) {
            ShowMessage("对不起，未找到该用户信息，请重新输入！");
		} else if (dt.Rows[0]["密码"].ToString() == txtPassword.Text) {//.ItemArray[0]
            Session["UserName"] = txtUserName.Text;
			Session["UserCode"] = dt.Rows[0]["住户代码"].ToString();
            Response.Write("<script>window.alert('登录成功。');window.location.href='Default.aspx'</script>");
        } else {
            ///显示错误信息
            ShowMessage("你输入的用户名称/密码有误，请重新输入！");
        }
       
    }

    protected void BtnCancel_Click(object sender, EventArgs e) {
        Response.Redirect("Close.aspx");
    }

    private void ShowMessage(string sMsg) {
        ///显示操作结果信息
        Response.Write("<script>window.alert('" + sMsg + "')</script>");
    }
}
