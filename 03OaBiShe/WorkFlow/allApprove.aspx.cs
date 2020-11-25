using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WorkFlow_allApprove : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) { ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true); return; }
        DataTable dt = bc.GetDataSet("select * from wf_ApplicationForm where statusExplain='审批通过' order by billDate desc", "12").Tables[0];
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}