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

public partial class Admin_PersonalManager : System.Web.UI.Page
{
    Common com = new Common();
    EntPersonal obj = new EntPersonal();
    CtlPersonal ctl = new CtlPersonal();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            bindGridView();
        }
        catch (Exception ex)
        {
            com.Alert("Error!" + ex.Message.ToString());
        }
    }

    public void bindGridView()
    {
        DataTable dt = new DataTable();
        dt = ctl.getAllPersonal();
        this.gvPersonal.DataSource = dt;
        this.gvPersonal.DataBind();
    }
    protected void gvPersonal_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int i = e.RowIndex;
        String perName = this.gvPersonal.Rows[i].Cells[0].Text.ToString();
        ctl.deletePersonal(perName);
        bindGridView();
    }
    protected void bnSelect_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = ctl.selectPersonal(this.txtPerName.Text);
            this.gvPersonal.DataSource = dt;
            this.gvPersonal.DataBind();

        }
        catch (Exception ex)
        {
            com.Alert("Error!" + ex.Message.ToString());
        }
    }
    protected void gvPersonal_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex < 0) return;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            String id = System.Convert.ToString(e.Row.Cells[0].Text);
            e.Row.Attributes.Add("onclick", "if(window.oldtr!=null){window.oldtr.runtimeStyle.cssText='';}this.runtimeStyle.cssText='background-color:LightSkyBlue';window.oldtr=this;");
        }
    }
}
