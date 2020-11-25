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

public partial class message_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        message_name.Text = Session["userinfo"].ToString();
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
        string message_name1 = message_name.Text.Trim();
        string message_title1 = message_title.Text.Trim();
        string message_content1 = message_content.Text.Trim();

        if (message_name.Text.Length == 0)
        {
            Response.Write("<script language=javascript>alert('留言人不能为空!');location='message_add.aspx'</script>");
        }
        string strsql = "insert into message(message_name,message_title,message_content,message_shijian) values(N'" + message_name1 + "',N'" + message_title1 + "',N'" + message_content1 + "','" + DateTime.Now.ToShortDateString() + "') ";
        SqlCommand cmd = new SqlCommand(strsql, conn);

        cmd.ExecuteNonQuery();
        Response.Write("<script language=javascript>alert('留言成功!');</script>");
        message_name.Text = "";
        message_title.Text = "";
        message_content.Text = "";

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        message_name.Text = "";
        message_title.Text = "";
        message_content.Text = "";
    }
}
