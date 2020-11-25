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

namespace OA.aspx.Main{ 
 public partial class SelectTXL: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            DataBindToGridview();
        }
    }
    public void DataBindToGridview()
    {
        FTD.DBUnit.DbHelperSQL.BindGridView("select ShouJi as SelectContent,NameStr,TypeStr from ERPTongXunLu where ((TypeStr='个人通讯簿' and UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "') or TypeStr='公共通讯簿'  or IfShare='是') and NameStr like '%" + this.TextBox1.Text + "%' ", this.GridView1);
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.GridView1.PageIndex = e.NewPageIndex;
        DataBindToGridview();
    }
    protected void iButton4_Click(object sender, EventArgs e)
    {
        DataBindToGridview();
    }
}
}