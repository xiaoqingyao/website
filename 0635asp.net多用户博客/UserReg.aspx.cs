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
using System.Data.SqlClient;

public partial class UserReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["memberinfo"] != null)
            {
                JavaScriptHelper.AlertAndRedirect("您已经登录。", "usermain.aspx");
                return;
            }
        }
    }

    /// <summary>
    /// 注册
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnReg_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtRegUserName.Text))
        {
            txtRegUserName.Focus();
            JavaScriptHelper.Alert("帐号不能为空。");
            return;
        }
        if (string.IsNullOrEmpty(txtRegUserPwd.Text))
        {
            txtRegUserPwd.Focus();
            JavaScriptHelper.Alert("密码不能为空。");
            return;
        }
        if (string.IsNullOrEmpty(txtRegUserPwd2.Text))
        {
            txtRegUserPwd2.Focus();
            JavaScriptHelper.Alert("确认密码不能为空。");
            return;
        }
        if (txtRegUserPwd.Text != txtRegUserPwd2.Text)
        {
            txtRegUserPwd2.Focus();
            JavaScriptHelper.Alert("两次密码输入不一致。");
            return;
        }


        if (DB.getDataTable("select * from Member where UserName='" + txtRegUserName.Text + "'").Rows.Count > 0)
        {
            JavaScriptHelper.Alert("此帐号已存在。");
            return;
        }

        string userpwd = txtRegUserPwd.Text;
        string sql = "insert into Member(username,userpwd,membername,tel,wenti,daan) ";
        sql += "values('" + txtRegUserName.Text + "','" + userpwd + "','" + txtRegTitle.Text + "','" + txtRegTel.Text + "','" + wenti.Text + "','" + daan.Text + "')";

        SqlConnection cn = DB.OpenConnection();
        SqlCommand cmd = new SqlCommand(sql, cn);
        cmd.ExecuteNonQuery();
        cn.Close();
        cn.Dispose();

        Common.ShowMessage(this.Page, "注册成功，请登录。", "", "userlogin.aspx");
    }
}
