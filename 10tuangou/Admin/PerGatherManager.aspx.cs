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

public partial class Admin_PerGatherManager : System.Web.UI.Page
{
    Common com = new Common();
    EntPerGather obj = new EntPerGather();
    CtlPerGather ctl = new CtlPerGather();
    protected void Page_Load(object sender, EventArgs e)
    {
        bindGridView();
    }

    public void bindGridView()
    {
        try
        {
            DataTable dt = new DataTable();
            dt = ctl.getAllPerGather();
            this.gvPerGather.DataSource = dt;
            this.gvPerGather.DataBind();
        }
        catch (Exception ex)
        {
            com.Alert("Error");
        }
    }
    protected void gvPerGather_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int i = e.RowIndex;
        String pGatherId = this.gvPerGather.Rows[i].Cells[0].Text.ToString().Trim();
        ctl.deletePerGather(pGatherId);
        bindGridView();
    }
    protected void gvPerGather_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex < 0) return;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            String pGatherId = System.Convert.ToString(e.Row.Cells[0].Text);
            e.Row.Attributes.Add("onclick", "if(window.oldtr!=null){window.oldtr.runtimeStyle.cssText='';}this.runtimeStyle.cssText='background-color:LightSkyBlue';window.oldtr=this;");
            e.Row.Attributes.Add("ondblclick", "var bRef=window.showModalDialog('PerGatherDetails.aspx?id=" + pGatherId + "','','dialogHeight:500px;dialogWidth:600px;help:no;toolbar:no;status:no;');if(bRef==true){window.location=window.location;}");
        }
    }
}
