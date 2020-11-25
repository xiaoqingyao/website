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

public partial class 前台_反馈 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string strSQL = @"INSERT INTO Feedback (context, FeedDate) VALUES (@context, @FeedDate)";
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        SqlCommand cmd = sql.CreateCommand();
        cmd.CommandText = strSQL;
        cmd.Parameters.Add(new SqlParameter("@context", this.TextBox1.Text.ToString()));
        cmd.Parameters.Add(new SqlParameter("@FeedDate", DateTime.Now.ToString()));
        sql.Open();
        int b = 0;
        b = (int)cmd.ExecuteScalar();
        if (b != 0)
        {
            this.Label1.Visible = true;
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        this.Label1.Visible = false;
        this.TextBox1.Text = "";
    }
}
