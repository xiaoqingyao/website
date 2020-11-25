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

public partial class 后台_管理员登陆 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_btn_Click(object sender, EventArgs e)
    {
        string strSQL = @"select * from Admin where AdminName = '"+this.username_txt.Text.ToString()+"' and Password = '"+this.password_txt.Text.ToString()+"'";
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
            Session["username"] = dr["AdminName"].ToString();
            Session["Role"] = dr["Role"].ToString();
        }
        dr.Close();
        if (Session["Role"] != null)
        {
            Response.Redirect("~/后台/管理员工作界面.aspx");
        }

    }
    protected void reset_btn_Click(object sender, EventArgs e)
    {
        this.username_txt.Text = "";
        this.password_txt.Text="";
    }
}
