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

public partial class Admin_ChooseProduct : System.Web.UI.Page
{
    public static string sql;
    CtlGather cg = new CtlGather();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            sql = "select * from g_product";
            gvProductBinding(sql);
        }
    }
    protected void gvProduct_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int i = e.NewEditIndex;
        string productid = System.Convert.ToString(this.gvProduct.Rows[i].Cells[0].Text);
        string productname = System.Convert.ToString(this.gvProduct.Rows[i].Cells[1].Text);
        Session["productname"] = productname;
        Session["productid"] = productid;
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>window.returnValue=true;window.close();</script>");
    }
    private void gvProductBinding(string sql)
    {
        DataTable dt = new DataTable();
        dt = cg.SelectProduct(sql);
        gvProduct.DataSource = dt;
        gvProduct.DataBind();
    }
    protected void gvProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.gvProduct.PageIndex = e.NewPageIndex;
        gvProductBinding(sql);
    }
    protected void ibtnSreach_Click(object sender, ImageClickEventArgs e)
    {
        if (this.txtSechCompanyName.Text == "")
        {
            sql = "select * from g_product";
        }
        else
        {
            sql = "select * from g_product where productName like '%" + this.txtSechCompanyName.Text.Trim() + "%'";
        }
        gvProductBinding(sql);
    }
}
