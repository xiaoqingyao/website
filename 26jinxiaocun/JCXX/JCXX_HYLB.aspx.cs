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


public partial class JCXX_JCXX_HYLB : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            hylbDataBind();
        }
    }
    public string Hylbbh
    {
        get
        {
            if (ViewState["Hylbbh"] != null)
                return (string)ViewState["Hylbbh"];
            else
                return "-1";
        }
        set { ViewState["Hylbbh"] = value; }
    }
    public void hylbDataBind()
    {
        gvHylb.DataSource = HylbManager.getAllHylb();
        gvHylb.DataBind();
    }
    protected void gvHylb_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
            LinkButton lbtnDelete = (LinkButton)e.Row.FindControl("lbtnDelete");
            lbtnDelete.Attributes.Add("onclick", "return confirm('你确定删除吗？')");
        }
    }

    protected void gvHylb_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvHylb.PageIndex = e.NewPageIndex;
        hylbDataBind();
    }

    protected void gvHylb_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Hylbbh = Convert.ToString(e.CommandArgument);
        if (e.CommandName == "De")
        {
            HylbManager.deleteHylbByHylbbh(Hylbbh);
        }
        if (e.CommandName == "Ed")
        {
            Hylb hylb = HylbManager.getHylbByHylbbh(Hylbbh);
            txtbhylbmcgx.Text = hylb.Hylbmc;
            txtbhylbbzgx.Text = hylb.Hylbbz;
        }
        hylbDataBind();
    }

    protected void btnhylbgx_Click(object sender, EventArgs e)
    {
        Hylb hylb = new Hylb();
        if (this.Hylbbh == "-1")
        {
            lblmassagegx.Text = "请选择某编辑项！";
        }
        else
        {
            if (txtbhylbmcgx.Text == null || txtbhylbmcgx.Text == "")
            {
                lblmassagegx.Text = "请填写产品类别名称！";
            }
            else
            {
                hylb.Hylbbh = Convert.ToInt32(Hylbbh);
                hylb.Hylbmc = txtbhylbmcgx.Text;
                hylb.Hylbbz = txtbhylbbzgx.Text;
                lblmassagegx.Text = HylbManager.modifyHylb(hylb);
                hylbDataBind();
                cleanGX();
            }

        }
    }
    protected void btnhylbtj_Click(object sender, EventArgs e)
    {
        Hylb hylb = new Hylb();
        if (txtbhylbmctj.Text == null || txtbhylbmctj.Text == "")
        {
            lblmassagetj.Text = "请填写产品类别名称！";
        }
        else
        {
            hylb.Hylbmc = txtbhylbmctj.Text;
            hylb.Hylbbz = txtbhylbbztj.Text;
            if (HylbManager.existsHylbByHylbmc(txtbhylbmctj.Text) == 1)
            {
                lblmassagetj.Text = "此产品类别已存在！";
            }
            else
            {
                lblmassagetj.Text = HylbManager.addHylb(hylb);
                hylbDataBind();
                cleanTJ();
            }
        }
    }
    public void cleanGX()
    {
        txtbhylbmcgx.Text = "";
        txtbhylbbzgx.Text = "";
    }
    public void cleanTJ()
    {
        txtbhylbmctj.Text = "";
        txtbhylbbztj.Text = "";
    }
}
