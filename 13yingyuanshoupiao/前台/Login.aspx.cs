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
using System.Web.Configuration;
// 下载于www.51aspx.com
public partial class 前台_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_btn_Click(object sender, EventArgs e)
    {
        int b = 0;
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        SqlCommand cmd = sql.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = @"select count(*) from [user] where username = '"+this.username_txt.Text.ToString()+"' and password = '"+this.password_txt.Text.ToString()+"'";
        sql.Open();
        b = (int)cmd.ExecuteScalar();
        if (b != 0)
        {
            this.Label1.Visible = false;
            HttpCookie cookie = new HttpCookie("TicketBooking");
            DateTime dtNow = DateTime.Now;
            TimeSpan tsMinute = new TimeSpan(1, 0, 0);                          //one hour cookies
            cookie.Expires = dtNow.Add(tsMinute);
            cookie.Values.Add("username", this.username_txt.Text.ToString());
          //  cookie.Values.Add("familyname", dr["familyname"].ToString());
           // cookie.Values.Add("givenname", dr["givenname"].ToString());
            Session["username"] = this.username_txt.Text;
            Response.AppendCookie(cookie);
            Response.Redirect("~/前台/首页.aspx");
        }
        else
        {
            this.Label1.Visible = true;
        }
        sql.Close();
    }
    protected void reset_btn_Click(object sender, EventArgs e)
    {
        this.username_txt.Text = "";
        this.password_txt.Text = "";
    }
}
