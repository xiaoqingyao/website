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


public partial class KC_KC_KC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            kcDataBind();
            spDataBind();
            ckDataBind();
            jhddDataBind();
            txtbkcbhtj.Text = PublicManager.getDateTimeAsId();//自动生成编号
        }
    }
    public void kcDataBind()
    {
        gvKc.DataSource = KcManager.getAllKc("");
        gvKc.DataBind();
    }
    public void jhddDataBind() {
        gvJhdd.DataSource = JhddManager.getAllJhdd("0","");
        gvJhdd.DataBind();
    }
    public string Kcbh
    {
        get
        {
            if (ViewState["Kcbh"] != null)
                return (string)ViewState["Kcbh"];
            else
                return "-1";
        }
        set { ViewState["Kcbh"] = value; }
    }
    protected void gvKc_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Kcbh = Convert.ToString(e.CommandArgument);
        if (e.CommandName == "De")
        {
            KcManager.deleteKcByKcbh(Kcbh);
        }
        if (e.CommandName == "Ed")
        {
            Kc kc = KcManager.getKcByKcbh(Kcbh);
            txtbgxrqgx.Text = kc.Gxrq;
            txtbkcbhgx.Text = Convert.ToString(kc.Kcbh);
            ddlckbhgx.SelectedItem.Selected = false;
            ddlckbhgx.Items.FindByValue(kc.Ckbh).Selected = true;
            ddlspbhgx.SelectedItem.Selected = false;
            ddlspbhgx.Items.FindByValue(Convert.ToString(kc.Spbh)).Selected = true;
            txtbslgx.Text = Convert.ToString(kc.Sl);
            txtbzjegx.Text = Convert.ToString(kc.Zje);
            ddlqhjggx.SelectedItem.Selected = false;
            ddlqhjggx.Items.FindByValue(Convert.ToString(kc.Qhjg)).Selected = true;
            txtbbzgx.Text = kc.Kcbz;
          
        }
        kcDataBind(); 
    }
    protected void gvKc_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
            LinkButton lbtnDelete = (LinkButton)e.Row.FindControl("lbtnDelete");
            lbtnDelete.Attributes.Add("onclick", "return confirm('你确定删除吗？')");
        }
    }
    protected void gvKc_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvKc.PageIndex = e.NewPageIndex;
        kcDataBind();
    }
    public string setQhjg(string qhjg) {
        if (qhjg == "0")
            return "正常";
        else
            return "缺货";
    }
    public string getSpmcBySpbh(string spbh)
    {
        return SpManager.getSpBySpbh(Convert.ToInt32(spbh)).Spmc;
    }
    public string getCkmcByCkbh(string ckbh)
    {
        return CkManager.getCkByCkbh(ckbh).Ckmc;
    }
    public void spDataBind() {
        ddlspbhgx.DataSource = SpManager.getAllSp();
        ddlspbhgx.DataValueField = "spbh";
        ddlspbhgx.DataTextField = "spmc";
        ddlspbhgx.DataBind();
        ddlspbhtj.DataSource = SpManager.getAllSp();
        ddlspbhtj.DataValueField = "spbh";
        ddlspbhtj.DataTextField = "spmc";
        ddlspbhtj.DataBind();
        ListItem itemtj = new ListItem("请选择", "-1", true);
        ddlspbhtj.Items.Insert(0, itemtj);
    }
    public void ckDataBind() {
        ddlckbhgx.DataSource = CkManager.getAllCk();
        ddlckbhgx.DataValueField = "ckbh";
        ddlckbhgx.DataTextField = "ckmc";
        ddlckbhgx.DataBind();
        ddlckbhtj.DataSource = CkManager.getAllCk();
        ddlckbhtj.DataValueField = "ckbh";
        ddlckbhtj.DataTextField = "ckmc";
        ddlckbhtj.DataBind();
        ListItem itemtj = new ListItem("请选择", "-1", true);
        ddlckbhtj.Items.Insert(0, itemtj);
    }
    
    protected void btngx_Click(object sender, EventArgs e)
    {
        try
        {
            Kc kc = new Kc();
            kc.Kcbh = Kcbh;
            kc.Kcbh = txtbkcbhgx.Text;
            kc.Gxrq = txtbgxrqgx.Text;
            kc.Ckbh = ddlckbhgx.SelectedValue;
            kc.Spbh = Convert.ToInt32(ddlspbhgx.SelectedValue);
            kc.Sl = Convert.ToDecimal(txtbslgx.Text);
            kc.Zje = Convert.ToDecimal(txtbzjegx.Text);
            kc.Qhjg = Convert.ToInt32(ddlqhjggx.SelectedValue);
            kc.Kcbz = txtbbzgx.Text;
            lblmassagegx.Text = KcManager.modifyKc(kc);
            kcDataBind();
            cleanGX();
        }
        catch(Exception ex){
            lblmassagegx.Text = "请点击编辑项！";
        }
    }
    protected void btntj_Click(object sender, EventArgs e)
    {
        if(txtbgxrqtj.Text == null || txtbgxrqtj.Text == ""){
            lblmassagetj.Text = "请填写更新日期！";
        }
        else if(txtbkcbhtj.Text == null || txtbkcbhtj.Text == ""){
            lblmassagetj.Text = "请填写库存编号！";
        }
        else if(ddlckbhtj.SelectedValue == "-1"){
            lblmassagetj.Text = "请选择仓库！";
        }
        else if(ddlspbhtj.SelectedValue == "-1"){
            lblmassagetj.Text = "请选择商品！";
        }
        else if(KcManager.existsKcBySpbh(Convert.ToInt32(ddlspbhtj.SelectedValue)).Kcbh !=null){
            lblmassagetj.Text = "此商品已经存在！";
        }
        else if(ddlqhjgtj.SelectedValue == "-1"){
            lblmassagetj.Text = "请选择货品状态！";
        }
        else if(txtbzjetj.Text == null || txtbzjetj.Text == ""){
            lblmassagetj.Text = "总价格不能为空！";
        }
        else{
            Kc kc = new Kc();
            kc.Kcbh = txtbkcbhtj.Text;
            kc.Gxrq = txtbgxrqtj.Text;
            kc.Ckbh = ddlckbhtj.SelectedValue;
            kc.Spbh = Convert.ToInt32(ddlspbhtj.SelectedValue);
            kc.Sl = Convert.ToDecimal(txtbsltj.Text);
            kc.Zje = Convert.ToDecimal(txtbzjetj.Text);
            kc.Qhjg = Convert.ToInt32(ddlqhjgtj.SelectedValue);
            kc.Kcbz = txtbbztj.Text;
            lblmassagetj.Text = KcManager.addKc(kc);
            kcDataBind();
            cleanTJ();
        }
    }
    public void cleanGX() {
        txtbgxrqgx.Text = "";
        txtbkcbhgx.Text = "";
        txtbslgx.Text = "";
        txtbzjegx.Text = "";
        txtbbzgx.Text = "";
    }
    public void cleanTJ() {
        txtbgxrqtj.Text = "";
        txtbkcbhtj.Text = "";
        txtbsltj.Text = "";
        txtbzjetj.Text = "";
        txtbbztj.Text = "";
    }
    protected void txtbkcbhtj_Load(object sender, EventArgs e)
    {
        txtbkcbhtj.Text = PublicManager.getDateTimeAsId();
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
    protected void gvJhdd_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string jhddbh = Convert.ToString(e.CommandArgument);
        if(jhddbh!=null && jhddbh!=""){
            Jhdd jhdd = new Jhdd();
            jhdd = JhddManager.getJhddByJhddbh(jhddbh);
            
            if(jhdd!=null){
                Kc kc = new Kc();
                kc = KcManager.existsKcBySpbh(jhdd.Spbh);
                if(kc.Kcbh!=null){
                    txtbgxrqgx.Text = kc.Gxrq;
                    txtbkcbhgx.Text = Convert.ToString(kc.Kcbh);
                    Kcbh = Convert.ToString(kc.Kcbh);
                    if(kc.Ckbh!=null && kc.Ckbh!=""){
                        ddlckbhgx.SelectedItem.Selected = false;
                        ddlckbhgx.Items.FindByValue(kc.Ckbh).Selected = true;
                    }
                    
                    if(kc.Spbh != 0){
                        ddlspbhgx.SelectedItem.Selected = false;
                        ddlspbhgx.Items.FindByValue(Convert.ToString(kc.Spbh)).Selected = true;
                    }
                    
                    txtbslgx.Text = Convert.ToString(kc.Sl+jhdd.Sl);
                    txtbzjegx.Text = Convert.ToString(kc.Zje+jhdd.Zje);
                    ddlqhjggx.SelectedItem.Selected = false;
                    ddlqhjggx.Items.FindByValue(Convert.ToString(kc.Qhjg)).Selected = true;
                    txtbbzgx.Text = kc.Kcbz;
                    jhdd.Zt = 1;
                    JhddManager.modifyJhdd(jhdd);
                    jhddDataBind();
                    lblmassagegx.Text = "请点击更新！";
                }
                else{
                    txtbsltj.Text = Convert.ToString(jhdd.Sl);
                    txtbzjetj.Text = Convert.ToString(jhdd.Zje);
                    ddlspbhtj.SelectedItem.Selected = false;
                    ddlspbhtj.Items.FindByValue(Convert.ToString(jhdd.Spbh)).Selected = true;
                    jhdd.Zt = 1;
                    JhddManager.modifyJhdd(jhdd);
                    jhddDataBind();
                    lblmassagetj.Text = "请点击添加！";
                }
            }
            else{
                lblmassagegx.Text = "请点击入库！";
            }
            
        }
        else{
            lblmassagegx.Text = "请点击入库！";
        }
    }
}
