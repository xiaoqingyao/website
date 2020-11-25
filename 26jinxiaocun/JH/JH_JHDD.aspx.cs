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

public partial class JH_JH_JHDD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            jhddDataBind();
            kcDataBind();
            gxDataBind();
            tjDataBind();
            txtbddhtj.Text = PublicManager.getDateTimeAsId();
        }
    }
    public string setZt(string zt) {
        string str = "错误";
        if (zt == "0")
            str = "未确定";
        if (zt == "1")
            str = "确定";
        if (zt == "2")
            str = "退货";
        if (zt == "3")
            str = "确定并入库";
        return str;
    }
    public string setQhjg(string qhjg)
    {
        string str = "错误";
        if (qhjg == "0")
            str = "正常";
        if (qhjg == "1")
            str = "警告";
        return str;
    }
    
    public string Jhddbh
    {
        get
        {
            if (ViewState["Jhddbh"] != null)
                return (string)ViewState["Jhddbh"];
            else
                return "-1";
        }
        set { ViewState["Jhddbh"] = value; }
    }
    public void jhddDataBind() {
        gvJhdd.DataSource = JhddManager.getAllJhdd("","");
        gvJhdd.DataBind();
    }
    public void kcDataBind()
    {
        gvKc.DataSource = KcManager.getAllKc("1");
        gvKc.DataBind();
    }
    protected void gvKc_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
        }
    }
    protected void gvJhdd_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Jhddbh = Convert.ToString(e.CommandArgument);
        int flag = JhddManager.getZtByJhddbh(Jhddbh);
        if(flag == 3){
            lblmassagegx.Text = "确认并入库项不能操作！";
        }
        else{
            if (e.CommandName == "De")
            {
                JhddManager.deleteJhddByJhddbh(Jhddbh);
            }
            if (e.CommandName == "Ed")
            {
                Jhdd jhdd = JhddManager.getJhddByJhddbh(Jhddbh);
                txtbdhrqgx.Text = jhdd.Dhrq;
                txtbddhgx.Text = jhdd.Jhddbh;
                ddlywygx.SelectedItem.Selected = false;
                ddlywygx.Items.FindByValue(Convert.ToString(jhdd.Ywy)).Selected = true;
                ddlgysgx.SelectedItem.Selected = false;
                ddlgysgx.Items.FindByValue(Convert.ToString(jhdd.Gysbh)).Selected = true;
                ddlspgx.SelectedItem.Selected = false;
                ddlspgx.Items.FindByValue(Convert.ToString(jhdd.Spbh)).Selected = true;
                ddlztgx.SelectedItem.Selected = false;
                ddlztgx.Items.FindByValue(Convert.ToString(jhdd.Zt)).Selected = true;
                txtbslgx.Text = Convert.ToString(jhdd.Sl);
                txtbdjgx.Text = Convert.ToString(jhdd.Dj);
                txtbzkgx.Text = Convert.ToString(jhdd.Zk);
                txtbzjegx.Text = Convert.ToString(jhdd.Zje);
                txtbbzgx.Text = jhdd.Jhddbz;
                lblmassagegx.Text = "";
            }
            jhddDataBind(); 
        }
        
    }
    protected void gvJhdd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvJhdd.PageIndex = e.NewPageIndex;
        jhddDataBind();
    }
    protected void gvKc_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Kc kc = KcManager.getKcByKcbh(Convert.ToString(e.CommandArgument));
        ddlsptj.SelectedItem.Selected = false;
        ddlsptj.Items.FindByValue(Convert.ToString(kc.Spbh)).Selected = true;
        lblmassagetj.Text = "请点击添加！";
    }
    protected void gvKc_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvKc.PageIndex = e.NewPageIndex;
        kcDataBind();
    }
    protected void gvJhdd_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
            LinkButton lbtnDelete = (LinkButton)e.Row.FindControl("lbtnDelete");
            lbtnDelete.Attributes.Add("onclick", "return confirm('你确定删除吗？')");
        }
    }
    public void gxDataBind() {
        ddlywygx.DataSource = YwyManager.getAllYwy();
        ddlywygx.DataValueField = "ywybh";
        ddlywygx.DataTextField = "ywymc";
        ddlywygx.DataBind();
        ddlgysgx.DataSource = GysManager.getAllGys();
        ddlgysgx.DataValueField = "gysbh";
        ddlgysgx.DataTextField = "gysmc";
        ddlgysgx.DataBind();
        ddlspgx.DataSource = SpManager.getAllSp();
        ddlspgx.DataValueField = "spbh";
        ddlspgx.DataTextField = "spmc";
        ddlspgx.DataBind();
    }
    public void tjDataBind()
    {
        ddlywytj.DataSource = YwyManager.getAllYwy();
        ddlywytj.DataValueField = "ywybh";
        ddlywytj.DataTextField = "ywymc";
        ddlywytj.DataBind();
        ddlgystj.DataSource = GysManager.getAllGys();
        ddlgystj.DataValueField = "gysbh";
        ddlgystj.DataTextField = "gysmc";
        ddlgystj.DataBind();
        ddlsptj.DataSource = SpManager.getAllSp();
        ddlsptj.DataValueField = "spbh";
        ddlsptj.DataTextField = "spmc";
        ddlsptj.DataBind();
        ListItem itemtj = new ListItem("请选择…", "-1");
        ddlywytj.Items.Insert(0, itemtj);
        ddlgystj.Items.Insert(0, itemtj);
        ddlsptj.Items.Insert(0, itemtj);
    }
    protected void btngx_Click(object sender, EventArgs e)
    {
        try
        {
            Jhdd jhdd = new Jhdd();
            jhdd.Dhrq = txtbdhrqgx.Text;
            jhdd.Jhddbh = txtbddhgx.Text;
            jhdd.Ywy = Convert.ToInt32(ddlywygx.SelectedValue);
            jhdd.Gysbh = Convert.ToInt32(ddlgysgx.SelectedValue);
            jhdd.Spbh = Convert.ToInt32(ddlspgx.SelectedValue);
            jhdd.Zt = Convert.ToInt32(ddlztgx.SelectedValue);
            jhdd.Sl = Convert.ToDecimal(txtbslgx.Text);
            jhdd.Dj = Convert.ToDecimal(txtbdjgx.Text);
            jhdd.Zk = Convert.ToDecimal(txtbzkgx.Text);
            jhdd.Zje = Convert.ToDecimal(txtbzjegx.Text);
            jhdd.Jhddbz = txtbbzgx.Text;
            lblmassagegx.Text = JhddManager.modifyJhdd(jhdd);
            jhddDataBind();
            cleanGX();
        }
        catch(Exception ex){
            lblmassagegx.Text = "请点击编辑项！";
        }
    }
    protected void btntj_Click(object sender, EventArgs e)
    {
        txtbddhtj.Text = PublicManager.getDateTimeAsId();
        if (txtbdhrqtj.Text == null || txtbdhrqtj.Text == "")
        {
            lblmassagetj.Text = "请填写日期！";
        }
        else if (txtbddhtj.Text == null || txtbddhtj.Text == "")
        {
            lblmassagetj.Text = "请填写编号！";
        }
        else if (ddlywytj.SelectedValue == "-1")
        {
            lblmassagetj.Text = "请选择业务员！";
        }
        else if (ddlgystj.SelectedValue == "-1")
        {
            lblmassagetj.Text = "请选择供应商！";
        }
        else if (ddlsptj.SelectedValue == "-1")
        {
            lblmassagetj.Text = "请选择商品！";
        }
        else if (ddlzttj.SelectedValue == "-1")
        {
            lblmassagetj.Text = "请选择状态！";
        }
        else if (txtbsltj.Text == null || txtbsltj.Text == "")
        {
            lblmassagetj.Text = "请填写数量！";
        }
        else if (txtbdjtj.Text == null || txtbdjtj.Text == "")
        {
            lblmassagetj.Text = "请填写单价！";
        }
        else if (txtbzktj.Text == null || txtbzktj.Text == "")
        {
            lblmassagetj.Text = "请填写折扣！";
        }
        else if (txtbzjetj.Text == null || txtbzjetj.Text == "")
        {
            lblmassagetj.Text = "请计算总金额！";
        }
        else
        {
            Jhdd jhdd = new Jhdd();
            jhdd.Dhrq = txtbdhrqtj.Text;
            jhdd.Jhddbh = txtbddhtj.Text;
            jhdd.Ywy = Convert.ToInt32(ddlywytj.SelectedValue);
            jhdd.Gysbh = Convert.ToInt32(ddlgystj.SelectedValue);
            jhdd.Spbh = Convert.ToInt32(ddlsptj.SelectedValue);
            jhdd.Zt = Convert.ToInt32(ddlzttj.SelectedValue);
            jhdd.Sl = Convert.ToDecimal(txtbsltj.Text);
            jhdd.Dj = Convert.ToDecimal(txtbdjtj.Text);
            jhdd.Zk = Convert.ToDecimal(txtbzktj.Text);
            jhdd.Zje = Convert.ToDecimal(txtbzjetj.Text);
            jhdd.Jhddbz = txtbbztj.Text;
            lblmassagetj.Text = JhddManager.addJhdd(jhdd);
            jhddDataBind();
            cleanTJ();

        }
    }
    public void cleanGX() {
        txtbdhrqgx.Text = "";
        txtbddhgx.Text = "";
        txtbslgx.Text = "";
        txtbdjgx.Text = "";
        txtbzkgx.Text = "";
        txtbzjegx.Text = "";
        txtbbzgx.Text = "";
    }
    public void cleanTJ()
    {
        txtbdhrqtj.Text = "";
        txtbddhtj.Text = "";
        txtbsltj.Text = "";
        txtbdjtj.Text = "";
        txtbzktj.Text = "";
        txtbzjetj.Text = "";
        txtbbztj.Text = "";
    }
    //计算总金额
    protected void btnzjegx_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtbslgx.Text == null || txtbslgx.Text == "")
            {
                lblmassagegx.Text = "请填写数量！";
            }
            else if (txtbdjgx.Text == null || txtbdjgx.Text == "")
            {
                lblmassagegx.Text = "请填写单价！";
            }
            else if (txtbzkgx.Text == null || txtbzkgx.Text == "")
            {
                lblmassagegx.Text = "请填写折扣！";
            }
            else
            {
                txtbzjegx.Text = (Convert.ToDecimal(txtbslgx.Text) * Convert.ToDecimal(txtbdjgx.Text) - Convert.ToDecimal(txtbzkgx.Text)).ToString();
                lblmassagegx.Text = "总金额=数量*单价-折扣 = " + txtbzjegx.Text;
            }
        }
        catch (Exception ex)
        {
            lblmassagegx.Text = "数量，单价，折扣都应该是数据！";
        }
    }
    protected void btnzjetj_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtbsltj.Text == null || txtbsltj.Text == "")
            {
                lblmassagetj.Text = "请填写数量！";
            }
            else if (txtbdjtj.Text == null || txtbdjtj.Text == "")
            {
                lblmassagetj.Text = "请填写单价！";
            }
            else if (txtbzktj.Text == null || txtbzktj.Text == "")
            {
                lblmassagetj.Text = "请填写折扣！";
            }
            else
            {
                txtbzjetj.Text = (Convert.ToDecimal(txtbsltj.Text) * Convert.ToDecimal(txtbdjtj.Text) - Convert.ToDecimal(txtbzktj.Text)).ToString();
                lblmassagetj.Text = "总金额=数量*单价-折扣 = " + txtbzjetj.Text;
            }
        }
        catch (Exception ex)
        {
            lblmassagetj.Text = "数量，单价，折扣都应该是数据！";
        }
    }
    public string getYwymcByYwybh(string ywybh)
    {
        return YwyManager.getYwymcByYwybh(ywybh);
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
