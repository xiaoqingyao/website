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

namespace OA.aspx.Moa.Main{ 
 public partial class SelectUser: System.Web.UI.Page
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
        string ConditionStr = "";
        try
        {
            if (Request.QueryString["Condition"].ToString().Trim().Length <= 0)
            {
                ConditionStr = "";
            }
            else
            {
                ConditionStr = " and UserName in ('" + FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 JingBanRenYuanList from ERPWorkFlowJieDian where ID=" + Request.QueryString["Condition"].ToString()).Replace(",", "','") + "')";
            }
        }
        catch
        { }
        //Response.Write(ConditionStr);
        FTD.DBUnit.DbHelperSQL.BindItemList("select distinct UserName as SelectContent from ERPUser where Department like '%" + this.TextBox2.Text + "%' " + ConditionStr + " and JiaoSe like '%" + this.TextBox3.Text + "%'", this.ListBox1, "SelectContent", "SelectContent");
    }   
    protected void iButton4_Click(object sender, EventArgs e)
    {
        DataBindToGridview();
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        this.TextBox4.Text = FTD.Unit.PublicMethod.GetListStr(this.ListBox1, this.ListBox2, "添加", "部分");
    }
    protected void iButton2_Click(object sender, EventArgs e)
    {
        this.TextBox4.Text = FTD.Unit.PublicMethod.GetListStr(this.ListBox1, this.ListBox2, "添加", "全部");
    }
    protected void iButton3_Click(object sender, EventArgs e)
    {
        this.TextBox4.Text = FTD.Unit.PublicMethod.GetListStr(this.ListBox1, this.ListBox2, "去除", "部分");
    }
    protected void iButton5_Click(object sender, EventArgs e)
    {
        this.TextBox4.Text = FTD.Unit.PublicMethod.GetListStr(this.ListBox1, this.ListBox2, "去除", "全部");
    }
}
}