using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
public partial class BasicInfo_MoneyStart : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlDataReader dr;
            dr = data.GetDataReader("select * from SumMoney  ");
            dr.Read();
            TextBox1.Text = dr["SumMoney"].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql1 = "update  SumMoney set SumMoney='" + TextBox1.Text + "'";
        data.RunSql(sql1);
        Alert.AlertAndRedirect("设置成功", "MoneyStart.aspx");
    }
}
