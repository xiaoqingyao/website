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

public partial class XS_XS_XSCX : System.Web.UI.Page
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
        gvXsdcx.DataSource = XsdManager.getAllXsd();
        gvXsdcx.DataBind();
    }
    protected void gvXsdcx_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string condition = "";
        condition = e.CommandName;
        gvXsdcx.DataSource = XsdManager.getXsdsOrderByCondition(condition);
        gvXsdcx.DataBind();
    }
    protected void gvXsdcx_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
        }
    }
    protected void gvXsdcx_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvXsdcx.PageIndex = e.NewPageIndex;
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
        else if (XsdManager.getXsdsByCondition(condition1, condition2) == null)
        {
            lblmassagecx.Text = "没有匹配的项！";
        }
        else
        {
            gvXsdcx.DataSource = XsdManager.getXsdsByCondition(condition1, condition2);
            gvXsdcx.DataBind();
        }
    }
    public string getKhmcByKhbh(string khbh)
    {
        return KhManager.getKhByKhbh(Convert.ToInt32(khbh)).Khmc;
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
