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
using System.Web.Configuration;
using System.Data.SqlClient;
// 下载于www.51aspx.com
public partial class 后台_反馈信息 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["username"]!=null)

            this.Label2.Text = Session["username"].ToString();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int n = this.GridView1.SelectedIndex;
        string s = this.GridView1.Rows[n].Cells[1].Text;
        string strSQL = @"select context from Feedback where FeedID = '"+s+"'";
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        sql.Open();
        SqlCommand cmd = sql.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strSQL;
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        { 
            this.TextBox1.Text=dr["context"].ToString();
        }
        dr.Close();
        sql.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Response.Redirect("~/后台/员工登陆.aspx");
    }
}
