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

public partial class UserMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["memberinfo"] != null)
            {
                string username = Server.UrlDecode(Request.Cookies["memberinfo"]["UserName"]);
                DataTable dt = DB.getDataTable("select * from member where username='" + username + "'");
                if (dt.Rows.Count > 0)
                {
                    txtUserName.Enabled = false;
                    txtUserName.Text = dt.Rows[0]["username"].ToString();
                    txtUserPwd.Text = dt.Rows[0]["userpwd"].ToString();
                    txtTitle.Text = dt.Rows[0]["membername"].ToString();
                    ltlRegTime.Text = Convert.ToDateTime(dt.Rows[0]["addtime"]).ToString("yyyy-MM-dd HH:mm:ss");
                    tel.Text = dt.Rows[0]["tel"].ToString();
                }
            }
            else
            {
                JavaScriptHelper.AlertAndRedirect("请先登录。", "userlogin.aspx");
                return;
            }
        }
    }

    //修改资料
    protected void btnEditInfo_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["memberinfo"] != null)
        {
            string username = Server.UrlDecode(Request.Cookies["memberinfo"]["UserName"]);
            string userpwd = txtUserPwd.Text;

            string sql = "update member set ";
            sql += "membername='" + txtTitle.Text.Trim() + "'";
            sql += ",tel='" + tel.Text + "'";

            if (!string.IsNullOrEmpty(txtUserPwd.Text.Trim()))
                sql += ",userpwd='" + userpwd + "'";

            sql += " where username='" + username + "'";

            SqlConnection cn = DB.OpenConnection();
            SqlCommand cmd = new SqlCommand(sql, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            cn.Dispose();

            Common.ShowMessage(this.Page, "修改成功。", "", "usermain.aspx");
            
        }
    }
}
