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
using System.Data.OleDb;

public partial class admin_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("../default.aspx");
        }
        else
        {
            lblwz.Text = Session["admin"].ToString();
            OleDbConnection conn = baseClass.GetCon();
            conn.Open();
            OleDbCommand cmd = new OleDbCommand("select adminName from tb_admin where adminID='" + lblwz.Text + "'", conn);
            lblname.Text = cmd.ExecuteScalar().ToString();
            conn.Close();
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Loginout.aspx");
    }
}
