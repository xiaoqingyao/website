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

public partial class news_add : System.Web.UI.Page
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = GetConnection();
        conn.Open();
        string news_title1 = news_title.Text.Trim();
        string news_type1 = news_type.SelectedItem.Text;
        string news_content1 = news_content.Text.Trim();

        if (news_title.Text.Length == 0)
        {
            Response.Write("<script language=javascript>alert('资讯标题不能为空!');</script>");
        }
        else
        {
            string strsql = "insert into info(news_title,news_type,news_content,news_shijian) values(N'" + news_title1 + "',N'" + news_type1 + "',N'" + news_content1 + "','" + DateTime.Now.ToShortDateString() + "') ";
            SqlCommand cmd = new SqlCommand(strsql, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script language=javascript>alert('资讯成功!');location='news_add.aspx'</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        news_title.Text = "";
        news_content.Text = "";
    }
}
