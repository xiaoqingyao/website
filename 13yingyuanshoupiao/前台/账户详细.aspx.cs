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

public partial class 前台_AccountDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        SqlCommand cmd = sql.CreateCommand();
        cmd.CommandType = CommandType.Text;
        if (Request.Cookies["TicketBooking"] != null)
        {
            string temp = Convert.ToString(Request.Cookies["TicketBooking"].Values["username"]);
            if (temp == "")
            {
                Server.Transfer("~/前台/Login.aspx");
            }
            else
            {
                this.Label1.Text = temp;
                //this.Label2.Text = Convert.ToString(Request.Cookies["TicketBooking"].Values["familyname"]);
                //this.Label3.Text = Convert.ToString(Request.Cookies["TicketBooking"].Values["givenname"]);
                string strSQL = "select * from [user] where ";
                strSQL += "username='" + this.Label1.Text + "'";
                sql.Open();
                cmd.CommandText = strSQL;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    this.Label2.Text = dr["familyname"].ToString();
                    this.Label3.Text = dr["givenname"].ToString();
                    this.Label4.Text = dr["address"].ToString();
                    this.Label5.Text = dr["email"].ToString();
                    this.Label6.Text = dr["idcard"].ToString();
                    this.Label7.Text = dr["balance"].ToString();
                }
                sql.Close();
            }
        }
        else
            Server.Transfer("~/前台/Login.aspx");
    }
    protected void modifyDetails_btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/前台/修改信息.aspx");
    }
    protected void return_btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/前台/首页.aspx");
    }
}
