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

public partial class Order : System.Web.UI.Page
{
    Common com = new Common();
    EntOrder obj = new EntOrder();
    CtlOrder ctl = new CtlOrder();
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["perName"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "window.parent.location.href='Login.aspx'", true); return;
        }

        BindGridView();
    }
    public void BindGridView()
    {
        DataTable dt = new DataTable();
        dt = ctl.selectOrder("select * from g_order where perName='" + Session["perName"].ToString() + "'");
        this.gvOrder.DataSource = dt;
        this.gvOrder.DataBind();
    }
    protected void gvOrder_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gvOrder_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void gvOrder_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}
