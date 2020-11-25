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

public partial class UserContral_DetailControl : System.Web.UI.UserControl
{
    EntGather eg = new EntGather();
    CtlGather cg = new CtlGather();
    public String gid;//相应产品的ID
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gid = Request["gid"];
            DataTable dt = new DataTable();
            dt = cg.GatherDetail(gid);
            this.DataList1.DataSource = dt;
            this.DataList1.DataBind();
        }
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            HiddenField i = (HiddenField)e.Item.FindControl("HiddenField1");
            string productidId = i.Value;
            DataTable dt = new DataTable();
            dt = cg.selectProductPritrue(productidId);
            DataList dl = (DataList)e.Item.FindControl("DataList2");
            dl.DataSource = dt;
            dl.DataBind();
        }
    }
}
