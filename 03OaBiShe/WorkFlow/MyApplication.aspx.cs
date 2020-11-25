using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WorkFlow_MyApplication : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) { ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true); return; }
        if (!IsPostBack)
        {
            init();
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    private void init() {
        DataTable dt = bc.GetDataSet("select * from wf_ApplicationForm where billuser='" + Session["loginName"].ToString() + "' order by billDate desc", "12").Tables[0];
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("del"))
        {
            string billcode = GridView1.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text.ToString();
            string sql = "delete from wf_ApplicationForm where billcode='" + billcode + "' ";
            bc.ExecSQL(sql);
            init();
        }
    }
}