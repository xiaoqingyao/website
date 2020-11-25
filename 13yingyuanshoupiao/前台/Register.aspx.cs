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

public partial class 前台_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void reset_btn_Click(object sender, EventArgs e)
    {
        this.username_txt.Text = "";
        this.password_txt.Text = "";
        this.passward_confirm_txt.Text = "";
        this.email_txt.Text = "";
        this.familyname_txt.Text = "";
        this.givenname_txt.Text = "";
        this.idcard_txt.Text = "";
    }
    protected void account_detail_btn_Click(object sender, EventArgs e)
    {
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        SqlCommand cmd = new SqlCommand("select * from [user] where username='" + this.username_txt.Text + "'", sql);
        SqlCommand cmd2 = new SqlCommand("select * from [user] where email='" + this.email_txt.Text + "'", sql);

        string strSQL = "insert into [user] ([username],[password],[email],[address],[familyname],[givenname],[idcard]) values ";
        strSQL += "('" + this.username_txt.Text + "','" + this.password_txt.Text + "','" + this.email_txt.Text + "','" + this.address_txt.Text + "',";
        strSQL += "'" + this.familyname_txt.Text + "','" + this.givenname_txt.Text + "','" + this.idcard_txt.Text + "')";

        SqlCommand cmd3 = new SqlCommand(strSQL, sql);
        sql.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            this.Label1.Visible = true;
            dr = cmd2.ExecuteReader();
            if (dr.Read())
            {
                this.Label2.Visible = true;
                sql.Close();
            }
        }
        else
        {
            this.Label1.Visible = false;
            this.Label2.Visible = false;
            cmd3.ExecuteNonQuery();
            Server.Transfer("~/前台/Login.aspx");
        }
        sql.Close();
    }
}
