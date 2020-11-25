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

public partial class Admin_ChooseCompany : System.Web.UI.Page
{
    CtlCompany cc = new CtlCompany();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvCompanyDataBinding();
        }
    }
    protected void gvCompany_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int i = e.NewEditIndex;
        string companyid = System.Convert.ToString(gvCompany.Rows[i].Cells[0].Text);
        string companyname = System.Convert.ToString(gvCompany.Rows[i].Cells[1].Text);
        Session["companname"] = companyname;
        Session["companId"] = companyid;
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>window.returnValue=true;window.close();</script>");
    }
    private void gvCompanyDataBinding()
    {
        DataTable dt = new DataTable();
        dt = cc.SelectCompany();
        this.gvCompany.DataSource = dt;
        this.gvCompany.DataBind();
    }
}
