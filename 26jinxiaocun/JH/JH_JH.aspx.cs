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

public partial class JH_JH_JH : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            jhdDataBind();
            jhddDataBind();
            gxDataBind();
            tjDataBind();
            txtbjhrqgx.Text = PublicManager.getDateTime();
            txtbjhrqtj.Text = PublicManager.getDateTime();
            txtbbhtj.Text = PublicManager.getDateTimeAsId();
        }
    }
    public string Jhdbh
    {
        get
        {
            if (ViewState["Jhdbh"] != null)
                return (string)ViewState["Jhdbh"];
            else
                return "-1";
        }
        set { ViewState["Jhdbh"] = value; }
    }
    protected void gvRkd_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#ccff99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
            LinkButton lbtnDelete = (LinkButton)e.Row.FindControl("lbtnDelete");
            lbtnDelete.Attributes.Add("onclick", "return confirm('你确定要删除吗？')");
        }
    }
    public void jhdDataBind() {
        gvJhd.DataSource = JhdManager.getAllJhd();
        gvJhd.DataBind();
    }
    public void jhddDataBind() {
        gvJhdd.DataSource = JhddManager.getAllJhdd("1","");
        gvJhdd.DataBind();
    }
    public void gxDataBind() {
        ddlgysgx.DataSource = GysManager.getAllGys();
        ddlgysgx.DataValueField = "gysbh";
        ddlgysgx.DataTextField = "gysmc";
        ddlgysgx.DataBind();
        ddlckgx.DataSource = CkManager.getAllCk();
        ddlckgx.DataValueField = "ckbh";
        ddlckgx.DataTextField = "ckmc";
        ddlckgx.DataBind();
        ddlspgx.DataSource = SpManager.getAllSp();
        ddlspgx.DataValueField = "spbh";
        ddlspgx.DataTextField = "spmc";
        ddlspgx.DataBind();
    }
    public void tjDataBind()
    {
        ddlgystj.DataSource = GysManager.getAllGys();
        ddlgystj.DataValueField = "gysbh";
        ddlgystj.DataTextField = "gysmc";
        ddlgystj.DataBind();
        ddlcktj.DataSource = CkManager.getAllCk();
        ddlcktj.DataValueField = "ckbh";
        ddlcktj.DataTextField = "ckmc";
        ddlcktj.DataBind();
        ddlsptj.DataSource = SpManager.getAllSp();
        ddlsptj.DataValueField = "spbh";
        ddlsptj.DataTextField = "spmc";
        ddlsptj.DataBind();
        ListItem itemtj = new ListItem("请选择", "-1", true);
        ddlgystj.Items.Insert(0, itemtj);
        ddlcktj.Items.Insert(0, itemtj);
        ddlsptj.Items.Insert(0, itemtj);
    }
    protected void gvJhdd_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#ccff99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
        }
    }
    public string setZt(string zt)
    {
        string str = "错误";
        if (zt == "0")
            str = "未确定";
        if (zt == "1")
            str = "确定";
        if (zt == "2")
            str = "退货";
        return str;
    }
    protected void ddljzgx_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddljzgx.SelectedValue == "是")
            ddljsfkgx.SelectedValue = "否";
        else
            ddljsfkgx.SelectedValue = "是";
    }
    protected void ddljsfkgx_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddljsfkgx.SelectedValue == "是")
            ddljzgx.SelectedValue = "否";
        else
            ddljzgx.SelectedValue = "是";
    }
    protected void ddljztj_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddljztj.SelectedValue == "是")
            ddljsfktj.SelectedValue = "否";
        else
            ddljsfktj.SelectedValue = "是";
    }
    protected void ddljsfktj_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddljsfktj.SelectedValue == "是")
            ddljztj.SelectedValue = "否";
        else
            ddljztj.SelectedValue = "是";
    }
    protected void gvJhd_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Jhdbh = Convert.ToString(e.CommandArgument);
        if (e.CommandName == "De")
        {
            JhdManager.deleteJhdByJhdbh(Jhdbh);
        }
        if (e.CommandName == "Ed")
        {
            Jhd jhd = JhdManager.getJhdByJhdbh(Jhdbh);
            if(jhd != null){
                txtbjhrqgx.Text = jhd.Jhrq;
                txtbywygx.Text = jhd.Ywy;
                txtbbhgx.Text = jhd.Jhdbh;
                txtbddhgx.Text = jhd.Jhddbh;
                ddlgysgx.SelectedItem.Selected = false;
                ddlgysgx.Items.FindByValue(Convert.ToString(jhd.Gysbh)).Selected = true;
                if (jhd.Ckbh != null && jhd.Ckbh!="")
                {
                    ddlckgx.SelectedItem.Selected = false;
                    ddlckgx.Items.FindByValue(jhd.Ckbh).Selected = true;
                }
                ddlspgx.SelectedItem.Selected = false;
                ddlspgx.Items.FindByValue(Convert.ToString(jhd.Spbh)).Selected = true;
                txtbslgx.Text = Convert.ToString(jhd.Sl);
                txtbdjgx.Text = Convert.ToString(jhd.Dj);
                txtbzkgx.Text = Convert.ToString(jhd.Zk);
                txtbzjegx.Text = Convert.ToString(jhd.Zje);
                ddljsfkgx.SelectedItem.Selected = false;
                ddljsfkgx.Items.FindByValue(jhd.Sfjsfk).Selected = true;
                ddljzgx.SelectedItem.Selected = false;
                ddljzgx.Items.FindByValue(jhd.Sfjz).Selected = true;
                txtbyfjegx.Text = Convert.ToString(jhd.Yfje);
                txtbbzgx.Text = jhd.Jhdbz;
            }
            else{
                lblmassagegx.Text = "请点击编辑！";
            }
        }
        jhdDataBind(); 
    }
    protected void btngx_Click(object sender, EventArgs e)
    {
        Jhd jhd = new Jhd();
        jhd.Jhrq = txtbjhrqgx.Text;
        jhd.Ywy = txtbywygx.Text;
        jhd.Jhdbh = txtbbhgx.Text;
        jhd.Jhddbh = txtbddhgx.Text;
        jhd.Gysbh = Convert.ToInt32(ddlgysgx.SelectedValue);
        jhd.Ckbh = ddlckgx.SelectedValue;
        jhd.Spbh = Convert.ToInt32(ddlspgx.SelectedValue);
        jhd.Sl = Convert.ToDecimal(txtbslgx.Text);
        jhd.Dj = Convert.ToDecimal(txtbdjgx.Text);
        jhd.Zk = Convert.ToDecimal(txtbzkgx.Text);
        jhd.Zje = Convert.ToDecimal(txtbzjegx.Text);
        jhd.Sfjsfk = ddljsfkgx.SelectedValue;
        jhd.Sfjz = ddljzgx.SelectedValue;
        jhd.Yfje = Convert.ToDecimal(txtbyfjegx.Text);
        jhd.Jhdbz = txtbbzgx.Text;
        lblmassagegx.Text = JhdManager.modifyJhd(jhd);
        jhdDataBind();
        cleanGX();

    }
    public void cleanGX() {
        txtbjhrqgx.Text = "";
        txtbywygx.Text = "";
        txtbbhgx.Text = "";
        txtbddhgx.Text = "";
        txtbslgx.Text = "";
        txtbdjgx.Text = "";
        txtbzkgx.Text = "";
        txtbzjegx.Text = "";
        txtbyfjegx.Text = "";
        txtbbzgx.Text = "";
    }
    public void cleanTJ()
    {
        txtbjhrqtj.Text = "";
        txtbywytj.Text = "";
        txtbbhtj.Text = "";
        txtbddhtj.Text = "";
        txtbsltj.Text = "";
        txtbdjtj.Text = "";
        txtbzktj.Text = "";
        txtbzjetj.Text = "";
        txtbyfjetj.Text = "";
        txtbbztj.Text = "";
    }
    protected void btntj_Click(object sender, EventArgs e)
    {
        if(txtbjhrqtj.Text == null || txtbjhrqtj.Text == ""){
            lblmassagetj.Text = "请填写日期！";
        }
        else if(txtbbhtj.Text == null || txtbbhtj.Text == ""){
            lblmassagetj.Text = "请填写编号！";
        }
        else if(txtbddhtj.Text == null || txtbddhtj.Text == ""){
            lblmassagetj.Text = "请填写订单编号！";
        }
        else if(ddlgystj.SelectedValue == "-1"){
            lblmassagetj.Text = "请选择供应商！";
        }
        else if(ddlcktj.SelectedValue == "-1"){
            lblmassagetj.Text = "请选择仓库！";
        }
        else if(ddlsptj.SelectedValue == "-1"){
            lblmassagetj.Text = "请选择商品！";
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
        else if (txtbyfjetj.Text == null || txtbyfjetj.Text == "")
        {
            lblmassagetj.Text = "请填写预付金额！";
        }
        else
        {
            Jhd jhd = new Jhd();
            jhd.Jhrq = txtbjhrqtj.Text;
            jhd.Ywy = txtbywytj.Text;
            jhd.Jhdbh = txtbbhtj.Text;
            jhd.Jhddbh = txtbddhtj.Text;
            jhd.Gysbh = Convert.ToInt32(ddlgystj.SelectedValue);
            jhd.Ckbh = ddlcktj.SelectedValue;
            jhd.Spbh = Convert.ToInt32(ddlsptj.SelectedValue);
            jhd.Sl = Convert.ToDecimal(txtbsltj.Text);
            jhd.Dj = Convert.ToDecimal(txtbdjtj.Text);
            jhd.Zk = Convert.ToDecimal(txtbzktj.Text);
            jhd.Zje = Convert.ToDecimal(txtbzjetj.Text);
            jhd.Sfjsfk = ddljsfktj.SelectedValue;
            jhd.Sfjz = ddljztj.SelectedValue;
            jhd.Yfje = Convert.ToDecimal(txtbyfjetj.Text);
            jhd.Jhdbz = txtbbztj.Text;
            lblmassagetj.Text = JhdManager.addJhd(jhd);
            jhdDataBind();
            cleanTJ();

        }
        

    }
    
    protected void btnzjetj_Click(object sender, EventArgs e)
    {
        try { 
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
            else {
                txtbzjetj.Text = (Convert.ToDecimal(txtbsltj.Text) * Convert.ToDecimal(txtbdjtj.Text) - Convert.ToDecimal(txtbzktj.Text)).ToString();
                lblmassagetj.Text = "总金额=数量*单价-折扣 = " + txtbzjetj.Text;
            }
        }
        catch(Exception ex){
            lblmassagetj.Text = "数量，单价，折扣都应该是数据！";
        }
    }
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
    protected void gvJhdd_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string jhddbh = Convert.ToString(e.CommandArgument);
        if (jhddbh != null && jhddbh != "")
        {
            Jhdd jhdd = new Jhdd();
            jhdd = JhddManager.getJhddByJhddbh(jhddbh);

            if (jhdd != null)
            {
                txtbddhtj.Text = jhdd.Jhddbh;
                ddlgystj.SelectedItem.Selected = false;
                ddlgystj.Items.FindByValue(Convert.ToString(jhdd.Gysbh)).Selected = true;
                ddlsptj.SelectedItem.Selected = false;
                ddlsptj.Items.FindByValue(Convert.ToString(jhdd.Spbh)).Selected = true;
                txtbsltj.Text = Convert.ToString(jhdd.Sl);
                txtbdjtj.Text = Convert.ToString(jhdd.Dj);
                txtbzktj.Text = Convert.ToString(jhdd.Zk);
                txtbzjetj.Text = Convert.ToString(jhdd.Zje);
                jhdd.Zt = 3;
                JhddManager.modifyJhdd(jhdd);
                jhddDataBind();
                lblmassagetj.Text = "请点击添加！";
            }
            else
            {
                lblmassagetj.Text = "请点击生成进货单";
            }

        }
        else
        {
            lblmassagetj.Text = "请点击生成进货单";
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
