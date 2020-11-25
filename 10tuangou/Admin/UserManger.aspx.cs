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

public partial class Admin_UserManger : System.Web.UI.Page
{
    Common com = new Common();
    EntUser obj = new EntUser();
    CtlUser ctl = new CtlUser();

    protected void Page_Load(object sender, EventArgs e)
    {
      
       
            bindGridView();
       
    }

    public void bindGridView()
    {
        DataTable dt = new DataTable();
        dt = ctl.getAllUser();
        this.gvUser.DataSource = dt;
        this.gvUser.DataBind();
    }
    protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
      
        int i = e.RowIndex;
        try
        {
            String userName = this.gvUser.Rows[i].Cells[0].Text.ToString().Trim();
            ctl.deleteUser(userName);
            bindGridView();
        }
        catch (Exception ex)
        {
            com.Alert("Error");
        }

    }
    protected void gvUser_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex < 0) return;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            String id = System.Convert.ToString(e.Row.Cells[0].Text);
            e.Row.Attributes.Add("onclick", "if(window.oldtr!=null){window.oldtr.runtimeStyle.cssText='';}this.runtimeStyle.cssText='background-color:LightSkyBlue';window.oldtr=this;");
            //e.Row.Attributes.Add("ondblclick", "var bRef=window.showModalDialog('Register.aspx?gid=" + id + "','','dialogHeight:280px;dialogWidth:420px;help:no;toolbar:no;status:no;');if(bRef==true){window.location=window.location;}");
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddUser.aspx");
    }
}
