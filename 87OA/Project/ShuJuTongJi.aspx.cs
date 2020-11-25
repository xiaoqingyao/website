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

public partial class Project_ShuJuTongJi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview();
            this.Label1.Text = ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select count(*) from ERPProject");
        }
    }
    public void DataBindToGridview()
    {
        GVData.DataSource = ZWL.DBUtility.DbHelperSQL.GetDataTable("select '" + DropDownList1.SelectedValue.ToString() + "' as DropStr," + DropDownList1.SelectedValue.ToString() + " as TongJiFenLei,count(*) as TongJiShuLiang from ERPProject group by " + DropDownList1.SelectedValue.ToString());
        GVData.DataBind();
    }
    protected void GVData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ZWL.Common.PublicMethod.GridViewRowDataBound(e);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DataBindToGridview();
    }
}