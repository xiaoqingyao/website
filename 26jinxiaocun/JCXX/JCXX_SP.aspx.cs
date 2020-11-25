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

public partial class JCXX_JCXX_SP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            spDataBind();
            splbDataBind();
        }
    }
    public void spDataBind() {
        gvSp.DataSource = SpManager.getAllSp();
        gvSp.DataBind();
    }
    public int Spbh
    {
        get
        {
            if (ViewState["Spbh"] != null)
                return (int)ViewState["Spbh"];
            else
                return -1;
        }
        set { ViewState["Spbh"] = value; }
    }
    protected void gvSp_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvSp.PageIndex = e.NewPageIndex;
        spDataBind();
    }
    protected void gvSp_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Spbh = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "De")
        {
            SpManager.deleteSpBySpbh(Spbh);
        }
        if (e.CommandName == "Ed")
        {
            Sp sp = SpManager.getSpBySpbh(Spbh);
            txtbspmcgx.Text = sp.Spmc;
            txtbsptxmgx.Text = sp.Sptxm;
            ddlsplbgx.SelectedItem.Selected = false;//把默认的选项去掉，因为不可以多选
            ddlsplbgx.Items.FindByValue(Convert.ToString(sp.Splbbh)).Selected = true;//设置需要的选项
            txtbsprkjggx.Text = Convert.ToString(sp.Sprkjg);
            txtbspfxjggx.Text = Convert.ToString(sp.Spfxjg);
            txtbsplsjggx.Text = Convert.ToString(sp.Splsjg);
            txtbspsccjgx.Text = sp.Spsccj;
            txtbspgxrqgx.Text = sp.Spgxrq;
            txtbspbzgx.Text = sp.Spbz;
        }
        spDataBind(); 
    }
    protected void gvSp_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
            LinkButton lbtnDelete = (LinkButton)e.Row.FindControl("lbtnDelete");
            lbtnDelete.Attributes.Add("onclick", "return confirm('你确定删除吗？')");
        }
    }
    public void cleanGX() {
        txtbspmcgx.Text = "";
        txtbsptxmgx.Text = "";
        txtbsprkjggx.Text = "";
        txtbspfxjggx.Text = "";
        txtbsplsjggx.Text = "";
        txtbspsccjgx.Text = "";
        txtbspbzgx.Text = "";
    }
    public void cleanTJ() {
        txtbspmctj.Text = "";
        txtbsptxmtj.Text = "";
        txtbsprkjgtj.Text = "";
        txtbspfxjgtj.Text = "";
        txtbsplsjgtj.Text = "";
        txtbspsccjtj.Text = "";
        txtbspbztj.Text = "";
    }
    protected void btngx_Click(object sender, EventArgs e)
    {
        Sp sp = new Sp();
        if (Spbh == -1)
        {
            lblmassagegx.Text = "请选择某编辑项！";
        }
        else
        {
            if(txtbspgxrqgx.Text == null || txtbspgxrqgx.Text == "")
                lblmassagegx.Text = "请填写更新日期！";
            else
            {
                sp.Spbh = Spbh;
                sp.Spmc = txtbspmcgx.Text;
                sp.Sptxm = txtbsptxmgx.Text;
                sp.Splbbh = Convert.ToInt32(ddlsplbgx.SelectedValue);
                sp.Sprkjg = Convert.ToDecimal(txtbsprkjggx.Text);
                sp.Spfxjg = Convert.ToDecimal(txtbspfxjggx.Text);
                sp.Splsjg = Convert.ToDecimal(txtbsplsjggx.Text);
                sp.Spsccj = txtbspsccjgx.Text;
                sp.Spgxrq = txtbspgxrqgx.Text;
                sp.Spbz = txtbspbzgx.Text;
                
                lblmassagegx.Text = SpManager.modifySp(sp);
                spDataBind();
                cleanGX();
            }
            
        }
    }
    protected void btntj_Click(object sender, EventArgs e)
    {
        Sp sp = new Sp();
        if (txtbspmctj.Text == null || txtbspmctj.Text == "")
        {
            lblmassagetj.Text = "请输入商品名称！";
        }
        else
        {
            if(SpManager.existsSpBySpmc(txtbspmctj.Text) == 1){
                lblmassagetj.Text = "商品名称已存在！";
            }
            else{
                if (ddlsplbtj.SelectedValue == "-1")
                {
                    lblmassagetj.Text = "请选择商品类别！";
                }
                else
                {
                    sp.Spmc = txtbspmctj.Text;
                    sp.Sptxm = txtbsptxmtj.Text;
                    sp.Splbbh = Convert.ToInt32(ddlsplbtj.SelectedValue);
                    sp.Sprkjg = Convert.ToDecimal(txtbsprkjgtj.Text);
                    sp.Spfxjg = Convert.ToDecimal(txtbspfxjgtj.Text);
                    sp.Splsjg = Convert.ToDecimal(txtbsplsjgtj.Text);
                    sp.Spsccj = txtbspsccjtj.Text;
                    sp.Spgxrq = txtbspgxrqtj.Text;
                    sp.Spbz = txtbspbztj.Text;
                    lblmassagetj.Text = SpManager.addSp(sp);
                    spDataBind();
                    cleanTJ();
                }
            }
            

        }
    }
    public string getSplbmcBySplbbh(string splbbh) {
        return SpManager.getSplbmcBySplbbh(splbbh);
    }
    //商品类别绑定
    public void splbDataBind()
    {
        ddlsplbgx.DataSource = CplbManager.getAllCplb();
        ddlsplbgx.DataTextField = "cplbmc";
        ddlsplbgx.DataValueField = "cplbbh";
        ddlsplbgx.DataBind();
        ddlsplbtj.DataSource = CplbManager.getAllCplb();
        ddlsplbtj.DataTextField = "cplbmc";
        ddlsplbtj.DataValueField = "cplbbh";
        ddlsplbtj.DataBind();
        ListItem itemtj = new ListItem("请选择", "-1", true);//初始化一个列表数据项
        ddlsplbtj.Items.Insert(0, itemtj);//把该项添加到ddlsplbtj
    }
}
