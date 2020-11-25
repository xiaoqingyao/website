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

public partial class JCXX_JCXX_CK : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ckDataBind();
        }
    }
    public string Ckbh
    {
        get
        {
            if (ViewState["Ckbh"] != null)
                return (string)ViewState["Ckbh"];
            else
                return "-1";
        }
        set { ViewState["Ckbh"] = value; }
    }
    public void ckDataBind()
    {
        gvCk.DataSource = CkManager.getAllCk();
        gvCk.DataBind();
    }
    protected void gvCk_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
            LinkButton lbtnDelete = (LinkButton)e.Row.FindControl("lbtnDelete");
            lbtnDelete.Attributes.Add("onclick", "return confirm('你确定删除吗？')");
        }
    }
    
    protected void gvCk_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCk.PageIndex = e.NewPageIndex;
        ckDataBind();
    }

    protected void gvCk_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Ckbh = Convert.ToString(e.CommandArgument);
        if (e.CommandName == "De")
        {
            CkManager.deleteCkByCkbh(Ckbh);
        }
        if (e.CommandName == "Ed")
        {
            Ck ck = CkManager.getCkByCkbh(Ckbh);
            txtbckbhgx.Text = ck.Ckbh;
            txtbckmcgx.Text = ck.Ckmc;
            txtbckbzgx.Text = ck.Ckbz;
        }
        ckDataBind();
    }

    protected void btnckgx_Click(object sender, EventArgs e)
    {
        Ck ck = new Ck();
        if (this.Ckbh == "-1")
        {
            lblmassagegx.Text = "请选择某编辑项！";
        }
        else
        {
            if(txtbckbhgx.Text == null || txtbckbhgx.Text == ""){
                lblmassagegx.Text = "请填写仓库编号！";
            }
            else{
                
                if (txtbckmcgx.Text == null || txtbckmcgx.Text == "")
                {
                    lblmassagegx.Text = "请填写仓库名称！";
                }
                else{
                    ck.Ckbh = txtbckbhgx.Text;
                    ck.Ckmc = txtbckmcgx.Text;
                    ck.Ckbz = txtbckbzgx.Text;
                    lblmassagegx.Text = CkManager.modifyCk(ck);
                    ckDataBind();
                    cleanGX();
                }
                
            }
            
        }
    }
    protected void btncktj_Click(object sender, EventArgs e)
    {
        Ck ck = new Ck();
        if (txtbckbhtj.Text == null || txtbckbhtj.Text == "")
        {
            lblmassagetj.Text = "请填写仓库编号！";
        }
        else
        {
            if(txtbckmctj.Text == null || txtbckmctj.Text == ""){
                lblmassagetj.Text = "请填写仓库名称！";
            }
            else{
                ck.Ckbh = txtbckbhtj.Text;
                ck.Ckmc = txtbckmctj.Text;
                ck.Ckbz = txtbckbztj.Text;
                if (CkManager.existsCkByCkBh(txtbckbhtj.Text.Trim()) == 1)
                {
                    lblmassagetj.Text = "此仓库已存在！";
                }
                else
                {
                    lblmassagetj.Text = CkManager.addCk(ck);
                    ckDataBind();
                    cleanTJ();
                }
            }
        }
    }
    public void cleanGX() {
        txtbckbhgx.Text = "";
        txtbckmcgx.Text = "";
        txtbckbzgx.Text = "";
    }
    public void cleanTJ()
    {
        txtbckbhtj.Text = "";
        txtbckmctj.Text = "";
        txtbckbztj.Text = "";
    }
}
