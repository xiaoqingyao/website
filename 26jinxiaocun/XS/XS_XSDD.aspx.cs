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

public partial class XS_XS_XSDD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            xsddDataBind();
            gxDataBind();
            tjDataBind();
            txtbddhtj.Text = PublicManager.getDateTimeAsId();
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
        if (zt == "3")
            str = "确定并出库";
        return str;
    }
    
    public string Xsddbh
    {
        get
        {
            if (ViewState["Xsddbh"] != null)
                return (string)ViewState["Xsddbh"];
            else
                return "-1";
        }
        set { ViewState["Xsddbh"] = value; }
    }
    public void xsddDataBind()
    {
        gvXsdd.DataSource = XsddManager.getAllXsdd("","");
        gvXsdd.DataBind();
    }
    protected void gvXsdd_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Xsddbh = Convert.ToString(e.CommandArgument);
        int flag = XsddManager.getZtByXsddbh(Xsddbh);
        if (flag == 3)
        {
            lblmassagegx.Text = "确认并出库项不能操作！";
        }
        else
        {
            if (e.CommandName == "De")
            {
                XsddManager.deleteXsddByXsddbh(Xsddbh);
            }
            if (e.CommandName == "Ed")
            {
                Xsdd xsdd = XsddManager.getXsddByXsddbh(Xsddbh);
                txtbxsrqgx.Text = xsdd.Xsrq;
                txtbddhgx.Text = xsdd.Xsddbh;
                ddlywygx.SelectedItem.Selected = false;
                ddlywygx.Items.FindByValue(Convert.ToString(xsdd.Ywy)).Selected = true;
                ddlkhgx.SelectedItem.Selected = false;
                ddlkhgx.Items.FindByValue(Convert.ToString(xsdd.Khbh)).Selected = true;
                ddlspgx.SelectedItem.Selected = false;
                ddlspgx.Items.FindByValue(Convert.ToString(xsdd.Spbh)).Selected = true;
                ddlztgx.SelectedItem.Selected = false;
                ddlztgx.Items.FindByValue(Convert.ToString(xsdd.Zt)).Selected = true;
                txtbslgx.Text = Convert.ToString(xsdd.Sl);
                txtbdjgx.Text = Convert.ToString(xsdd.Dj);
                txtbzkgx.Text = Convert.ToString(xsdd.Zk);
                txtbzjegx.Text = Convert.ToString(xsdd.Zje);
                txtbbzgx.Text = xsdd.Xsddbz;
                lblmassagegx.Text = "";
            }
            xsddDataBind();
        }

    }
    protected void gvXsdd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvXsdd.PageIndex = e.NewPageIndex;
        xsddDataBind();
    }
    
    protected void gvXsdd_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
            LinkButton lbtnDelete = (LinkButton)e.Row.FindControl("lbtnDelete");
            lbtnDelete.Attributes.Add("onclick", "return confirm('你确定删除吗？')");
        }
    }
    public void gxDataBind()
    {
        ddlywygx.DataSource = YwyManager.getAllYwy();
        ddlywygx.DataValueField = "ywybh";
        ddlywygx.DataTextField = "ywymc";
        ddlywygx.DataBind();
        ddlkhgx.DataSource = KhManager.getAllKh();
        ddlkhgx.DataValueField = "khbh";
        ddlkhgx.DataTextField = "khmc";
        ddlkhgx.DataBind();
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
        ddlkhtj.DataSource = KhManager.getAllKh();
        ddlkhtj.DataValueField = "khbh";
        ddlkhtj.DataTextField = "khmc";
        ddlkhtj.DataBind();
        ddlsptj.DataSource = SpManager.getAllSp();
        ddlsptj.DataValueField = "spbh";
        ddlsptj.DataTextField = "spmc";
        ddlsptj.DataBind();
        ListItem itemtj = new ListItem("请选择…", "-1");
        ddlywytj.Items.Insert(0, itemtj);
        ddlkhtj.Items.Insert(0, itemtj);
        ddlsptj.Items.Insert(0, itemtj);
    }
    protected void btngx_Click(object sender, EventArgs e)
    {
        Xsdd xsdd = new Xsdd();
        xsdd.Xsrq = txtbxsrqgx.Text;
        xsdd.Xsddbh = txtbddhgx.Text;
        xsdd.Ywy = Convert.ToInt32(ddlywygx.SelectedValue);
        xsdd.Khbh = Convert.ToInt32(ddlkhgx.SelectedValue);
        xsdd.Spbh = Convert.ToInt32(ddlspgx.SelectedValue);
        xsdd.Zt = Convert.ToInt32(ddlztgx.SelectedValue);
        xsdd.Sl = Convert.ToDecimal(txtbslgx.Text);
        xsdd.Dj = Convert.ToDecimal(txtbdjgx.Text);
        xsdd.Zk = Convert.ToDecimal(txtbzkgx.Text);
        xsdd.Zje = Convert.ToDecimal(txtbzjegx.Text);
        xsdd.Xsddbz = txtbbzgx.Text;
        lblmassagegx.Text = XsddManager.modifyXsdd(xsdd);
        xsddDataBind();
        cleanGX();

    }
    protected void btntj_Click(object sender, EventArgs e)
    {
        txtbddhtj.Text = PublicManager.getDateTimeAsId();
        if (txtbxsrqtj.Text == null || txtbxsrqtj.Text == "")
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
        else if (ddlkhtj.SelectedValue == "-1")
        {
            lblmassagetj.Text = "请选择客户！";
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
            Xsdd xsdd = new Xsdd();
            xsdd.Xsrq = txtbxsrqtj.Text;
            xsdd.Xsddbh = txtbddhtj.Text;
            xsdd.Ywy = Convert.ToInt32(ddlywytj.SelectedValue);
            xsdd.Khbh = Convert.ToInt32(ddlkhtj.SelectedValue);
            xsdd.Spbh = Convert.ToInt32(ddlsptj.SelectedValue);
            xsdd.Zt = Convert.ToInt32(ddlzttj.SelectedValue);
            xsdd.Sl = Convert.ToDecimal(txtbsltj.Text);
            xsdd.Dj = Convert.ToDecimal(txtbdjtj.Text);
            xsdd.Zk = Convert.ToDecimal(txtbzktj.Text);
            xsdd.Zje = Convert.ToDecimal(txtbzjetj.Text);
            xsdd.Xsddbz = txtbbztj.Text;
            lblmassagetj.Text = XsddManager.addXsdd(xsdd);
            xsddDataBind();
            cleanTJ();

        }
    }
    public void cleanGX()
    {
        txtbxsrqgx.Text = "";
        txtbddhgx.Text = "";
        txtbslgx.Text = "";
        txtbdjgx.Text = "";
        txtbzkgx.Text = "";
        txtbzjegx.Text = "";
        txtbbzgx.Text = "";
    }
    public void cleanTJ()
    {
        txtbxsrqtj.Text = "";
        txtbddhtj.Text = "";
        txtbsltj.Text = "";
        txtbdjtj.Text = "";
        txtbzktj.Text = "";
        txtbzjetj.Text = "";
        txtbbztj.Text = "";
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
    public string getKhmcByKhbh(string khbh)
    {
        return KhManager.getKhByKhbh(Convert.ToInt32(khbh)).Khmc;
    }
    public string getSpmcBySpbh(string spbh)
    {
        return SpManager.getSpBySpbh(Convert.ToInt32(spbh)).Spmc;
    }
}
