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

public partial class 前台_账户充值 : System.Web.UI.Page
{
    string temp;
    protected void Page_Load(object sender, EventArgs e)
    {
        //this.login_btn.Text = "Log out";
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;


        if (Request.Cookies["TicketBooking"] != null)
        {
            temp = Convert.ToString(Request.Cookies["TicketBooking"].Values["username"]);
            if (temp == "")
            {
                Server.Transfer("~/前台/Login.aspx");
            }
            else
            {
                string strSQL = "select * from [user] where ";
                strSQL += "username='" + temp + "'";
                sql.Open();
                SqlCommand cmd = new SqlCommand(strSQL, sql);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.Label_Balance.Text = dr["balance"].ToString();
                    this.Label2.Text = dr["familyname"].ToString();
                    this.Label2.Text += dr["givenname"].ToString();
                }
                sql.Close();
            }
        }
        else
            Server.Transfer("~/前台/Login.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (this.TextBox_Recharge.Text == "")
            this.TextBox_Recharge.Text = "0.00";
        double recharge = Convert.ToDouble(this.TextBox_Recharge.Text);
        double balance = Convert.ToDouble(this.Label_Balance.Text);
        recharge += balance;
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        string strSQL = "update [user] set [balance] = " + recharge + " where [username]='" + temp + "'";

        SqlCommand cmd = new SqlCommand(strSQL, sql);
        sql.Open();
        cmd.ExecuteReader();
        sql.Close();
        Response.AddHeader("refresh", "0");
        Response.Redirect("~/前台/首页.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/前台/首页.aspx");
    }
}
