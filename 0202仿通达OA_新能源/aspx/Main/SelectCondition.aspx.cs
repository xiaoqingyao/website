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
 public partial class SelectCondition: System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            DataBindToGridview();            
        }
    }
    public string GetTypeStr()
    {
        try
        {
            if (Request.QueryString["GetType"].ToString() == "My")
            {
                return " and UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' ";
            }
            else
            {
                return "";
            }
        }
        catch
        {
            return "";
        }
    }
    public void DataBindToGridview()
    {
        try
        {
            string GetTable = Request.QueryString["GetTable"].ToString();
            FTD.DBUnit.DbHelperSQL.BindGridView("select CanShuName as SelectContent from "+GetTable+" where TableName='" + Request.QueryString["TableName"].ToString() + "'  and LieName='" + Request.QueryString["LieName"].ToString() + "' and CanShuName like '%" + this.TextBox1.Text + "%' " + GetTypeStr(), this.GridView1);
        }
        catch
        {
            FTD.DBUnit.DbHelperSQL.BindGridView("select distinct " + Request.QueryString["LieName"].ToString() + " as SelectContent from " + Request.QueryString["TableName"].ToString() + " where " + Request.QueryString["LieName"].ToString() + " like '%" + this.TextBox1.Text + "%' " + GetTypeStr(), this.GridView1);
        }
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