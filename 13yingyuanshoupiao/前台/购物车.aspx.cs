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

public partial class 前台_购物车 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 下载于www.51aspx.com
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string name = Session["username"].ToString();
        float tatal = 0;
        float sum = 0;
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        string str = @"SELECT Price FROM BookingCart where State = '否' and UserName = '"+name+"'";
        SqlCommand cmd = sql.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = str;
        sql.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            tatal += Single.Parse(dr["Price"].ToString());
        
        }
        dr.Close();
        cmd.CommandText = @"select balance from [user] where username = '"+name+"'";
        dr = cmd.ExecuteReader();
        dr.Read();
        sum= Single.Parse(dr["balance"].ToString());
        sum = sum - tatal;
        dr.Close();
        if (sum < 0)
        {
            this.Label3.Visible = true;
        }
        else 
        {
            cmd.CommandText = @"UPDATE BookingCart SET State = '是'  WHERE Username = '"+name+"'";
            cmd.ExecuteScalar();
            cmd.CommandText = @"UPDATE [user] SET balance = '"+sum.ToString()+"'  WHERE Username = '" + name + "'";
            cmd.ExecuteScalar();
            this.Label4.Visible = true;
        }
        sql.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/前台/首页.aspx");
    }
}
