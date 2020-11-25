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
            SDLX.Common.PublicMethod.CheckSession();
            DataBindToGridview();            
        }
    }
    public void DataBindToGridview()
    {
        string ConditionStr = "";
        try
        {
            if (Request.QueryString["Condition"].ToString().Trim().Length <= 0)
            {
                ConditionStr = "";
            }
            else
            {
                ConditionStr = " and UserName in ('" + SDLX.DBUtility.DbHelperSQL.GetSHSL("select top 1 JingBanRenYuanList from ERPWorkFlowJieDian where ID=" + Request.QueryString["Condition"].ToString()).Replace(",", "','") + "')";
            }
        }
        catch
        { }
        //Response.Write(ConditionStr);
        SDLX.DBUtility.DbHelperSQL.BindGridView("select distinct UserName as SelectContent from ERPUser where UserName like '%" + this.TextBox1.Text + "%' " + ConditionStr + " and Department like '%" + this.TextBox2.Text + "%' and JiaoSe like '%" + this.TextBox3.Text + "%'", this.GridView1);
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
