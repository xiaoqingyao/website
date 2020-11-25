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

public partial class SelectCondition : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview();            
        }
    }
    public string GetTypeStr()
    {
        try
        {
            if (Request.QueryString["GetType"].ToString() == "My")
            {
                return " and UserName='" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "' ";
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
            ZWL.DBUtility.DbHelperSQL.BindGridView("select CanShuName as SelectContent from "+GetTable+" where TableName='" + Request.QueryString["TableName"].ToString() + "'  and LieName='" + Request.QueryString["LieName"].ToString() + "' and CanShuName like '%" + this.TextBox1.Text + "%' " + GetTypeStr(), this.GridView1);
        }
        catch
        {
            ZWL.DBUtility.DbHelperSQL.BindGridView("select distinct " + Request.QueryString["LieName"].ToString() + " as SelectContent from " + Request.QueryString["TableName"].ToString() + " where " + Request.QueryString["LieName"].ToString() + " like '%" + this.TextBox1.Text + "%' " + GetTypeStr(), this.GridView1);
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.GridView1.PageIndex = e.NewPageIndex;
        DataBindToGridview();
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        DataBindToGridview();
    }
}
