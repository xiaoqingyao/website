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

public partial class JCXX_JCXX_GYS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            gysDataBind();
        }
    }
    public int Gysbh {
        get
        {
            if (ViewState["Gysbh"] != null)
                return (int)ViewState["Gysbh"];
            else
                return -1;
        }
        set { ViewState["Gysbh"] = value; }
    }
    public void gysDataBind() {
        gvGys.DataSource = GysManager.getAllGys();
        gvGys.DataBind();
    }
    protected void gvGys_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvGys.PageIndex = e.NewPageIndex;
        gysDataBind();
    }
    protected void gvGys_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow) {
            e.Row.Attributes.Add("onmouseover","currentcolor=this.style.backgroundColor;this.style.backgroundColor='#ccff99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
            LinkButton lbtnDelete = (LinkButton)e.Row.FindControl("lbtnDelete");
            lbtnDelete.Attributes.Add("onclick","return confirm('你确定要删除马？')");
        }

    }
    protected void gvGys_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        this.Gysbh = Convert.ToInt32(e.CommandArgument);
        if(e.CommandName == "De"){
            GysManager.deleteGysByGysbh(Gysbh);
        }
        if(e.CommandName == "Ed"){
            Gys gys = new Gys();
            gys = GysManager.getGysByGysbh(Gysbh);
            txtbgysmcgx.Text = gys.Gysmc;
            txtbgyslxrgx.Text = gys.Lxr;
            txtbyzbmgx.Text = gys.Yzbm;
            txtblxdhgx.Text = gys.Lxdh;
            txtbgszygx.Text = gys.Gszy;
            txtbdzyjgx.Text = gys.Lxrdzyj;
            txtbdzgx.Text = gys.Dz;
            txtbbzgx.Text = gys.Gysbz;
        
        }
        gysDataBind();
    }
    
    protected void btnGysgx_Click(object sender, EventArgs e)
    {
        try
        {
            Gys gys = new Gys();
            gys.Gysbh = Gysbh;
            gys.Gysmc = txtbgysmcgx.Text;
            gys.Lxr = txtbgyslxrgx.Text;
            gys.Yzbm = txtbyzbmgx.Text;
            gys.Lxdh = txtblxdhgx.Text;
            gys.Gszy = txtbgszygx.Text;
            gys.Lxrdzyj = txtbdzyjgx.Text;
            gys.Dz = txtbdzgx.Text;
            gys.Gysbz = txtbbzgx.Text;
            lblmassagegx.Text = GysManager.modifyGys(gys);
            gysDataBind();
            cleanGX();
        }
        catch(Exception ex){
            lblmassagegx.Text = "请点击编辑项！";
        }
    }
    protected void btnGystj_Click(object sender, EventArgs e)
    {
        Gys gys = new Gys();
        if(txtbgysmctj.Text == null || txtbgysmctj.Text == ""){
            lblmassagetj.Text = "请输入供应商名称！";
        }
        else{
            if(GysManager.existsGysByGysmc(txtbgysmctj.Text) == 1){
                lblmassagetj.Text = "供应商已存在！";
            }
            else{
                gys.Gysmc = txtbgysmctj.Text;
                gys.Lxr = txtbgyslxrtj.Text;
                gys.Yzbm = txtbyzbmtj.Text;
                gys.Lxdh = txtblxdhtj.Text;
                gys.Gszy = txtbgszytj.Text;
                gys.Lxrdzyj = txtbdzyjtj.Text;
                gys.Dz = txtbdztj.Text;
                gys.Gysbz = txtbbztj.Text;
                lblmassagetj.Text = GysManager.addGys(gys);
                gysDataBind();
                cleanTJ();
            }
        }
    }
    public void cleanGX() {
        txtbgysmcgx.Text = "";
        txtbgyslxrgx.Text = "";
        txtbyzbmgx.Text = "";
        txtblxdhgx.Text = "";
        txtbgszygx.Text = "";
        txtbdzyjgx.Text = "";
        txtbdzgx.Text = "";
        txtbbzgx.Text = "";
    }
    public void cleanTJ() {
        txtbgysmctj.Text = "";
        txtbgyslxrtj.Text = "";
        txtbyzbmtj.Text = "";
        txtblxdhtj.Text = "";
        txtbgszytj.Text = "";
        txtbdzyjtj.Text = "";
        txtbdztj.Text = "";
        txtbbztj.Text = "";
    }
}
