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

public partial class 前台_修改信息 : System.Web.UI.Page
{
        public string tempEmail = "";
        public bool done = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (done == false)
            {
                this.oldpassword_txt.Text = "";
                this.password_txt.Text = "";
                this.passward_confirm_txt.Text = "";

                string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;


                if (Request.Cookies["TicketBooking"] != null)
                {
                    string temp;
                    temp = Convert.ToString(Request.Cookies["TicketBooking"].Values["username"]);
                    if (temp == "")
                    {
                        Server.Transfer("~/前台/Login.aspx");
                    }
                    else
                    {
                        this.Label1.Text = temp.ToString();
                        this.Label1.Visible = true;
                        string strSQL = "select * from [user] where ";
                        strSQL += "username='" + this.Label1.Text + "'";
                        sql.Open();
                        SqlCommand cmd = new SqlCommand(strSQL, sql);
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            tempEmail = dr["email"].ToString();
                            this.email_txt.Text = tempEmail;
                            this.address_txt.Text = dr["address"].ToString();
                            this.familyname_txt.Text = dr["familyname"].ToString();
                            this.givenname_txt.Text = dr["givenname"].ToString();
                            this.idcard_txt.Text = dr["idcard"].ToString();
                        }
                        sql.Close();
                    }
                }
                else
                    Server.Transfer("~/前台/Login.aspx");
            }
            done = true;
        }
    
    protected void modify_btn_Click1(object sender, EventArgs e)
    {
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;

            SqlDataReader dr;
            sql.Open();
            string strSQL = "update [user] set ";
            if (this.oldpassword_txt.Text != "" && this.password_txt.Text != "" && this.passward_confirm_txt.Text != ""
                && this.password_txt.Text == this.passward_confirm_txt.Text)
            {
                SqlCommand cmd2 = new SqlCommand("select * from [user] where [username]='" + this.Label1.Text + "' and [password]='" + this.oldpassword_txt.Text + "'", sql);
                dr = cmd2.ExecuteReader();
                if (dr.Read())
                {
                    strSQL += "[password]='" + this.password_txt.Text + "', ";
                }
                else
                {
                    this.Label3.Text = "Incorrect Old Password";
                    this.Label3.Visible = true;
                    this.oldpassword_txt.Text = "";
                    this.password_txt.Text = "";
                    this.passward_confirm_txt.Text = "";
                }
                sql.Close();

            }
            else
            {
                if (this.oldpassword_txt.Text != "" && this.password_txt.Text != "" && this.passward_confirm_txt.Text != ""
                    && this.password_txt.Text != this.passward_confirm_txt.Text)
                {
                    this.Label3.Text = "Two Password not match";
                    this.Label3.Visible = true;
                }
            }
            SqlCommand cmd4 = new SqlCommand("select * from [user] where email='" + this.email_txt.Text + "'", sql);
            dr = cmd4.ExecuteReader();
            if (dr.Read() && email_txt.Text != tempEmail)
            {
                this.Label2.Visible = true;
            }
            else
                strSQL += "[email]='" + this.email_txt.Text + "',";

            strSQL += "[address]='" + this.address_txt.Text + "',";
            strSQL += "[familyname]='" + this.familyname_txt.Text + "',";
            strSQL += "[givenname]='" + this.givenname_txt.Text + "',";
            strSQL += "[idcard]='" + this.idcard_txt.Text + "'";
            strSQL += "where [username]='" + this.Label1.Text + "'";
            SqlCommand cmd3 = new SqlCommand(strSQL, sql);
            cmd3.ExecuteNonQuery();
            sql.Close();
            done = false;
            Response.AddHeader("refresh", "0");
        
    }
}
