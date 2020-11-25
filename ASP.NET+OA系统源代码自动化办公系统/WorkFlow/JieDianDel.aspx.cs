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

public partial class WorkFlow_JieDianDel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SDLX.DBUtility.DbHelperSQL.ExecuteSQL("delete from ERPWorkFlowJieDian where ID=" + Request.QueryString["ID"].ToString());
        Response.Redirect("WorkFlowDesign.aspx?ID=" + Request.QueryString["WorkFlowID"].ToString());
    }
}
