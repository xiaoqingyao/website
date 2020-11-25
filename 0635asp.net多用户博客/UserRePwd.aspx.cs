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

public partial class UserRePwd : System.Web.UI.Page
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
    /// 验证
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnyz_Click(object sender, EventArgs e)
    {
        DataTable dt= DB.getDataTable("select * from member where username='" + username.Text.Trim() + "'");
        if (dt.Rows.Count > 0)
        {
            username.Enabled = false;

            wenti.Text = dt.Rows[0]["wenti"].ToString();
            hiddaan.Value = dt.Rows[0]["daan"].ToString();

            tr1.Visible = true;
            tr2.Visible = true;
            tr3.Visible = true;
        }
        else
        {
            JavaScriptHelper.Alert("此用户名不存在。");
            return;
        }
    }

    /// <summary>
    /// 找回
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnzh_Click(object sender, EventArgs e)
    {
        if (daan.Text.Trim() == hiddaan.Value.Trim())
        {
            string newpwd = new Random().Next(100, 999).ToString();
            DB.ExecuteSql("update member set UserPwd='" + newpwd + "' where username='" + username.Text.Trim() + "'");
            mess.ForeColor = System.Drawing.Color.Green;
            mess.Text = "恭喜！密保验证正确，您的新密码是：" + newpwd;
        }
        else
        {
            mess.ForeColor = System.Drawing.Color.Red;
            mess.Text = "抱歉！密保验证失败，请重新输入密保答案吧！";
            daan.Focus();
        }
    }
}
