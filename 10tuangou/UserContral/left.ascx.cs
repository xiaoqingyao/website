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


public partial class UserContral_left : System.Web.UI.UserControl
{
    DataBase db = new DataBase();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (this.TextBox3.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('请输入产品名称！');</script>");
            return;
        }
        string sql = "select * from vwGatherProduct where productName like '%" + this.TextBox3.Text.Trim() + "%'";
        SqlDataAdapter sqlda = new SqlDataAdapter();
        sqlda = db.RunDataAter(sql);
        Session["list"] = sqlda;
        Response.Redirect("List.aspx");
    }
}
