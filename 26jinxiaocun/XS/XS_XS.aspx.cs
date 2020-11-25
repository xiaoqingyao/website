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

public partial class XS_XS_XS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            xsdDataBind();
            xsddDataBind();
            gxDataBind();
            tjDataBind();
            txtbxsrqgx.Text = PublicManager.getDateTime();
            txtbxsrqtj.Text = PublicManager.getDateTime();
            txtbbhtj.Text = PublicManager.getDateTimeAsId();
        }
    }
    public string Xsdbh
    {
        get
        {
            if (ViewState["Xsdbh"] != null)
                return (string)ViewState["Xsdbh"];
            else
                return "-1";
        }
        set { ViewState["Xsdbh"] = value; }
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
    public void xsdDataBind()
    {
        gvXsd.DataSource = XsdManager.getAllXsd();
        gvXsd.DataBind();
    }
    public void xsddDataBind()
    {
        gvXsdd.DataSource = XsddManager.getAllXsdd("1","");
        gvXsdd.DataBind();
    }
    public void gxDataBind()
    {
        ddlkhgx.DataSource = KhManager.getAllKh();
        ddlkhgx.DataValueField = "khbh";
        ddlkhgx.DataTextField = "khmc";
        ddlkhgx.DataBind();
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
        ddlkhtj.DataSource = KhManager.getAllKh();
        ddlkhtj.DataValueField = "khbh";
        ddlkhtj.DataTextField = "khmc";
        ddlkhtj.DataBind();
        ddlcktj.DataSource = CkManager.getAllCk();
        ddlcktj.DataValueField = "ckbh";
        ddlcktj.DataTextField = "ckmc";
        ddlcktj.DataBind();
        ddlsptj.DataSource = SpManager.getAllSp();
        ddlsptj.DataValueField = "spbh";
        ddlsptj.DataTextField = "spmc";
        ddlsptj.DataBind();
        ListItem itemtj = new ListItem("请选择", "-1", true);
        ddlkhtj.Items.Insert(0, itemtj);
        ddlcktj.Items.Insert(0, itemtj);
        ddlsptj.Items.Insert(0, itemtj);
    }
    protected void gvXsdd_RowDataBound(object sender, GridViewRowEventArgs e)
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
    protected void gvXsd_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Xsdbh = Convert.ToString(e.CommandArgument);
        if (e.CommandName == "De")
        {
            XsdManager.deleteXsdByXsdbh(Xsdbh);
        }
        if (e.CommandName == "Ed")
        {
            Xsd xsd = XsdManager.getXsdByXsdbh(Xsdbh);
            if (xsd != null)
            {
                txtbxsrqgx.Text = xsd.Xsrq;
                txtbywygx.Text = xsd.Ywy;
                txtbbhgx.Text = xsd.Xsdbh;
                txtbddhgx.Text = xsd.Xsddbh;
                ddlkhgx.SelectedItem.Selected = false;
                ddlkhgx.Items.FindByValue(Convert.ToString(xsd.Khbh)).Selected = true;
                if (xsd.Ckbh != null && xsd.Ckbh != "")
                {
                    ddlckgx.SelectedItem.Selected = false;
                    ddlckgx.Items.FindByValue(xsd.Ckbh).Selected = true;
                }
                ddlspgx.SelectedItem.Selected = false;
                ddlspgx.Items.FindByValue(Convert.ToString(xsd.Spbh)).Selected = true;
                txtbslgx.Text = Convert.ToString(xsd.Sl);
                txtbdjgx.Text = Convert.ToString(xsd.Dj);
                txtbzkgx.Text = Convert.ToString(xsd.Zk);
                txtbzjegx.Text = Convert.ToString(xsd.Zje);
                ddljsfkgx.SelectedItem.Selected = false;
                ddljsfkgx.Items.FindByValue(xsd.Sfjsfk).Selected = true;
                ddljzgx.SelectedItem.Selected = false;
                ddljzgx.Items.FindByValue(xsd.Sfjz).Selected = true;
                txtbyfjegx.Text = Convert.ToString(xsd.Yfje);
                txtbbzgx.Text = xsd.Xsdbz;
            }
            else
            {
                lblmassagegx.Text = "请点击编辑！";
            }
        }
        xsdDataBind();
    }
    protected void btngx_Click(object sender, EventArgs e)
    {
        try
        {
            Xsd xsd = new Xsd();
            xsd.Xsrq = txtbxsrqgx.Text;
            xsd.Ywy = txtbywygx.Text;
            xsd.Xsdbh = txtbbhgx.Text;
            xsd.Xsddbh = txtbddhgx.Text;
            xsd.Khbh = Convert.ToInt32(ddlkhgx.SelectedValue);
            xsd.Ckbh = ddlckgx.SelectedValue;
            xsd.Spbh = Convert.ToInt32(ddlspgx.SelectedValue);
            xsd.Sl = Convert.ToDecimal(txtbslgx.Text);
            xsd.Dj = Convert.ToDecimal(txtbdjgx.Text);
            xsd.Zk = Convert.ToDecimal(txtbzkgx.Text);
            xsd.Zje = Convert.ToDecimal(txtbzjegx.Text);
            xsd.Sfjsfk = ddljsfkgx.SelectedValue;
            xsd.Sfjz = ddljzgx.SelectedValue;
            xsd.Yfje = Convert.ToDecimal(txtbyfjegx.Text);
            xsd.Xsdbz = txtbbzgx.Text;
            lblmassagegx.Text = XsdManager.modifyXsd(xsd);
            xsdDataBind();
            cleanGX();
        }
        catch(Exception ex){
            lblmassagegx.Text = "请填写各项参数！";
        }
    }
    public void cleanGX()
    {
        txtbxsrqgx.Text = "";
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
        txtbxsrqtj.Text = "";
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
        if (txtbxsrqtj.Text == null || txtbxsrqtj.Text == "")
        {
            lblmassagetj.Text = "请填写日期！";
        }
        else if (txtbbhtj.Text == null || txtbbhtj.Text == "")
        {
            lblmassagetj.Text = "请填写编号！";
        }
        else if (txtbddhtj.Text == null || txtbddhtj.Text == "")
        {
            lblmassagetj.Text = "请填写订单编号！";
        }
        else if (ddlkhtj.SelectedValue == "-1")
        {
            lblmassagetj.Text = "请选择供应商！";
        }
        else if (ddlcktj.SelectedValue == "-1")
        {
            lblmassagetj.Text = "请选择仓库！";
        }
        else if (ddlsptj.SelectedValue == "-1")
        {
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
            Xsd xsd = new Xsd();
            xsd.Xsrq = txtbxsrqtj.Text;
            xsd.Ywy = txtbywytj.Text;
            xsd.Xsdbh = txtbbhtj.Text;
            xsd.Xsddbh = txtbddhtj.Text;
            xsd.Khbh = Convert.ToInt32(ddlkhtj.SelectedValue);
            xsd.Ckbh = ddlcktj.SelectedValue;
            xsd.Spbh = Convert.ToInt32(ddlsptj.SelectedValue);
            xsd.Sl = Convert.ToDecimal(txtbsltj.Text);
            xsd.Dj = Convert.ToDecimal(txtbdjtj.Text);
            xsd.Zk = Convert.ToDecimal(txtbzktj.Text);
            xsd.Zje = Convert.ToDecimal(txtbzjetj.Text);
            xsd.Sfjsfk = ddljsfktj.SelectedValue;
            xsd.Sfjz = ddljztj.SelectedValue;
            xsd.Yfje = Convert.ToDecimal(txtbyfjetj.Text);
            xsd.Xsdbz = txtbbztj.Text;
            lblmassagetj.Text = XsdManager.addXsd(xsd);
            xsdDataBind();
            cleanTJ();

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
    protected void gvXsdd_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string xsddbh = Convert.ToString(e.CommandArgument);
        if (xsddbh != null && xsddbh != "")
        {
            Xsdd xsdd = new Xsdd();
            xsdd = XsddManager.getXsddByXsddbh(xsddbh);
            if (xsdd != null)
            {
                txtbddhtj.Text = xsdd.Xsddbh;
                ddlkhtj.SelectedItem.Selected = false;
                ddlkhtj.Items.FindByValue(Convert.ToString(xsdd.Khbh)).Selected = true;
                ddlsptj.SelectedItem.Selected = false;
                ddlsptj.Items.FindByValue(Convert.ToString(xsdd.Spbh)).Selected = true;
                txtbsltj.Text = Convert.ToString(xsdd.Sl);
                txtbdjtj.Text = Convert.ToString(xsdd.Dj);
                txtbzktj.Text = Convert.ToString(xsdd.Zk);
                txtbzjetj.Text = Convert.ToString(xsdd.Zje);
                Kc kc = KcManager.existsKcBySpbh(xsdd.Spbh);
                if (kc.Kcbh != null && kc.Kcbh != "")
                {
                    kc.Sl = kc.Sl - xsdd.Sl;
                    kc.Zje = kc.Zje - xsdd.Zje;
                    kc.Gxrq = PublicManager.getDateTime();
                    KcManager.modifyKc(kc);
                    xsdd.Zt = 3;
                    XsddManager.modifyXsdd(xsdd);
                    xsddDataBind();
                    lblmassagetj.Text = "请点击添加！";
                }
                else {
                    lblmassagetj.Text = "此商品不在库存中！";
                }
            }
            else
            {
                lblmassagetj.Text = "请点击生成销售单";
            }

        }
        else
        {
            lblmassagetj.Text = "请点击生成销售单";
        }
    }
    public string getYwymcByYwybh(string ywybh)
    {
        return YwyManager.getYwymcByYwybh(ywybh);
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
