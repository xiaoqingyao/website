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

public partial class pass_up : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        username.Text = Session["username"].ToString();
    }
    protected SqlConnection GetConnection()
    {
        string conn = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        SqlConnection myConn = new SqlConnection(conn);
        return myConn;

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = GetConnection();
        conn.Open();
        string username1 = username.Text.Trim();
        string password1 = password.Text.Trim();
        //修改密码关键语句
        string strsql = "update login set password='" + password1 + "' where username='" + username1 + "'";
        SqlCommand cmd = new SqlCommand(strsql, conn);

        cmd.ExecuteNonQuery();
        Response.Write("<script language=javascript>alert('密码更新成功!');location.history(-1);</script>");
        conn.Close();
    }
}
