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

public partial class BaseInfo_adddept : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true);
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        //con.Open();
        //SqlCommand dbCommand = new SqlCommand("insert into dept values('" + TextBox1.Text + "','" + TextBox2.Text + "')", con);
        //dbCommand.ExecuteNonQuery();
        BaseClass bc = new BaseClass();
        Boolean bl;
        bl = bc.ExecSQL("insert into dept values('" + TextBox1.Text + "','" + TextBox2.Text + "')");
        if (bl)
        {
            Response.Write(bc.MessageBox("新建班级成功!"));
        }
        else
        {
            Response.Write(bc.MessageBox("新建班级失败!"));
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }
}
