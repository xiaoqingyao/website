using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WorkFlow_addWorkFlowType : System.Web.UI.Page
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
        bl = bc.ExecSQL("insert into wf_type values('" + code.Text + "','" + name.Text + "','" + note.Text + "')");
        if (bl)
        {
            code.Text = "";
            name.Text = "";
            note.Text = "";
            Response.Write(bc.MessageBox("新建流程类型成功!"));
        }
        else
        {
            Response.Write(bc.MessageBox("新建流程类型失败!"));
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        code.Text = "";
        name.Text = "";
        note.Text = "";
    }
}