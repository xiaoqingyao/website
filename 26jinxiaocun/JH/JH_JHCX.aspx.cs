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
using JXCMODEL;
using JXCBLL;

public partial class JH_JH_JHCX : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            jhdcxDataBind();
        }
    }
    public void jhdcxDataBind()
    {
        gvJhdcx.DataSource = JhdManager.getAllJhd();
        gvJhdcx.DataBind();
    }
    protected void gvJhdcx_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string condition = "";
        condition = e.CommandName;
        gvJhdcx.DataSource = JhdManager.getJhdsOrderByCondition(condition);
        gvJhdcx.DataBind();
    }
    protected void gvJhdcx_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
        }
    }
    protected void gvJhdcx_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvJhdcx.PageIndex = e.NewPageIndex;
        jhdcxDataBind();
    }
    protected void btncx_Click(object sender, EventArgs e)
    {
        string condition1 = ddlzd.SelectedValue;
        string condition2 = txtbtj.Text;
        if (condition2 == null || condition2 == "")
        {
            lblmassagecx.Text = "请填写条件！";
        }
        else if (JhdManager.getJhdsByCondition(condition1, condition2) == null)
        {
            lblmassagecx.Text = "没有匹配的项！";
        }
        else
        {
            gvJhdcx.DataSource = JhdManager.getJhdsByCondition(condition1, condition2);
            gvJhdcx.DataBind();
        }
    }
    public string getGysmcByGysbh(string gysbh)
    {
        return GysManager.getGysByGysbh(Convert.ToInt32(gysbh)).Gysmc;
    }
    public string getSpmcBySpbh(string spbh)
    {
        return SpManager.getSpBySpbh(Convert.ToInt32(spbh)).Spmc;
    }
    public string getCkmcByCkbh(string ckbh)
    {
        return CkManager.getCkByCkbh(ckbh).Ckmc;
    }
}
