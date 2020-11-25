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

public partial class AddPerGather : System.Web.UI.Page
{
    Common com = new Common();
    EntPerGather obj = new EntPerGather();
    CtlPerGather ctl = new CtlPerGather();

    protected void Page_Load(object sender, EventArgs e)
    {
        BindDropDownList();
    }
    public void BindDropDownList()
    {
        DataTable dt = new DataTable();
        dt = ctl.getAllGatherType();
        this.ddlCategroy.DataSource = dt;
        this.ddlCategroy.DataTextField = "gTypeName";
        this.ddlCategroy.DataValueField = "gTypeId";
        this.ddlCategroy.DataBind();
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        obj.gTypeId = this.ddlCategroy.SelectedValue;
        obj.perName = "fenfen";
        obj.title = this.txtTitle.Text;
        obj.gatherDesc = this.txtGatherInfo.Text;
        obj.gatherTime = System.DateTime.Now.ToString();
        if (ctl.AddPerGather(obj))
        {
            com.Alert("发布成功");
            Response.Redirect("~/PerGatherMgr.aspx");
        }
        else
        {
            com.Alert("发布失败");
        }
    }
}
