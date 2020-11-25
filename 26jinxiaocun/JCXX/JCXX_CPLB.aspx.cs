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
using JXCBLL;
using JXCMODEL;

public partial class JCXX_JCXX_CPLB : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cplbDataBind();
        }
    }
    public int Cplbbh
    {
        get
        {
            if (ViewState["Cplbbh"] != null)
                return (int)ViewState["Cplbbh"];
            else
                return -1;
        }
        set { ViewState["Cplbbh"] = value; }
    }
    public void cplbDataBind()
    {
        gvCplb.DataSource = CplbManager.getAllCplb();
        gvCplb.DataBind();
    }
    protected void gvCplb_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
            LinkButton lbtnDelete = (LinkButton)e.Row.FindControl("lbtnDelete");
            lbtnDelete.Attributes.Add("onclick", "return confirm('你确定删除吗？')");
        }
    }

    protected void gvCplb_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCplb.PageIndex = e.NewPageIndex;
        cplbDataBind();
    }

    protected void gvCplb_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Cplbbh = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "De")
        {
            CplbManager.deleteCplbByCplbbh(Cplbbh);
        }
        if (e.CommandName == "Ed")
        {
            Cplb cplb = CplbManager.getCplbByCplbbh(Cplbbh);
            txtbcplbmcgx.Text = cplb.Cplbmc;
            txtbcplbbzgx.Text = cplb.Cplbbz;
        }
        cplbDataBind();
    }

    protected void btncplbgx_Click(object sender, EventArgs e)
    {
        Cplb cplb = new Cplb();
        if (this.Cplbbh == -1)
        {
            lblmassagegx.Text = "请选择某编辑项！";
        }
        else
        {
            if (txtbcplbmcgx.Text == null || txtbcplbmcgx.Text == "")
            {
                lblmassagegx.Text = "请填写产品类别名称！";
            }
            else
            {
                cplb.Cplbbh = Cplbbh;
                cplb.Cplbmc = txtbcplbmcgx.Text;
                cplb.Cplbbz = txtbcplbbzgx.Text;
                lblmassagegx.Text = CplbManager.modifyCplb(cplb);
                cplbDataBind();
                cleanGX();
            }

        }
    }
    protected void btncplbtj_Click(object sender, EventArgs e)
    {
        Cplb cplb = new Cplb();
        if (txtbcplbmctj.Text == null || txtbcplbmctj.Text == "")
        {
            lblmassagetj.Text = "请填写产品类别名称！";
        }
        else
        {
            cplb.Cplbmc = txtbcplbmctj.Text;
            cplb.Cplbbz = txtbcplbbztj.Text;
            if (CplbManager.existsCplbByCplbmc(txtbcplbmctj.Text) == 1)
            {
                lblmassagetj.Text = "此产品类别已存在！";
            }
            else
            {
                lblmassagetj.Text = CplbManager.addCplb(cplb);
                cplbDataBind();
                cleanTJ();
            }
        }
    }
    public void cleanGX()
    {
        txtbcplbmcgx.Text = "";
        txtbcplbbzgx.Text = "";
    }
    public void cleanTJ()
    {
        txtbcplbmctj.Text = "";
        txtbcplbbztj.Text = "";
    }
    
}
