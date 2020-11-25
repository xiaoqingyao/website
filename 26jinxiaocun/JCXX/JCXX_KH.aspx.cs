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

public partial class JCXX_JCXX_KH : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            khDataBind();
            hylbDataBind();
        }
    }
    public void khDataBind() {
        gvKh.DataSource = KhManager.getAllKh();
        gvKh.DataBind();
    }
    public int Khbh
    {
        get
        {
            if (ViewState["Khbh"] != null)
                return (int)ViewState["Khbh"];
            else
                return -1;
        }
        set { ViewState["Khbh"] = value; }
    }
    protected void gvKh_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Khbh = Convert.ToInt32(e.CommandArgument);
        if(e.CommandName == "De"){
            KhManager.deleteKhByKhbh(Khbh);
        }
        if(e.CommandName == "Ed"){
            Kh kh = new Kh();
            kh = KhManager.getKhByKhbh(Khbh);//
            txtbKhkhmcgx.Text = kh.Khmc;
            txtbKhdzgx.Text = kh.Dz;
            txtbKhybgx.Text = kh.Yzbm;
            txtbKhdhgx.Text = kh.Lxdh;
            txtbKhzygx.Text = kh.Gszy;
            txtbKhljxfgx.Text = Convert.ToString(kh.Ljxfje);
            txtbKhlxrgx.Text = kh.Lxr;
            ddlKhhylbgx.SelectedItem.Selected = false;
            ddlKhhylbgx.Items.FindByValue(Convert.ToString(kh.Hylb)).Selected = true;
            txtbKhlxryjgx.Text = kh.Lxrdzyj;
            txtbKhbzgx.Text = kh.Khbz;
        }
        khDataBind();
    }
    protected void gvKh_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
            LinkButton lbtnDelete = (LinkButton)e.Row.FindControl("lbtnDelete");
            lbtnDelete.Attributes.Add("onclick", "return confirm('你确定删除吗？')");
        }
    }
    protected void gvKh_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvKh.PageIndex = e.NewPageIndex;
        khDataBind();
    }
    public static string getHylbmcByHylbbh(string hylbbh)
    {
        return HylbManager.getHylbmcByHylbbh(hylbbh);
    }
    public void hylbDataBind() {
        ddlKhhylbgx.DataSource = HylbManager.getAllHylb();
        ddlKhhylbgx.DataTextField = "hylbmc";
        ddlKhhylbgx.DataValueField = "hylbbh";
        ddlKhhylbgx.DataBind();

        ddlKhhylbtj.DataSource = HylbManager.getAllHylb();
        ddlKhhylbtj.DataTextField = "hylbmc";
        ddlKhhylbtj.DataValueField = "hylbbh";
        ddlKhhylbtj.DataBind();
        ListItem item = new ListItem("请选择","-1",true);
        ddlKhhylbtj.Items.Insert(0,item);
    }
    protected void btnKhgx_Click(object sender, EventArgs e)
    {
        Kh kh = new Kh();
        if (Khbh == -1)
        {
            lblKhmassagegx.Text = "请选择某编辑项！";
        }
        else
        {
            kh.Khbh = Khbh;
            kh.Khmc = txtbKhkhmcgx.Text;
            kh.Dz = txtbKhdzgx.Text;
            kh.Yzbm = txtbKhybgx.Text;
            kh.Lxdh = txtbKhdhgx.Text;
            kh.Gszy = txtbKhzygx.Text;
            if (txtbKhljxfgx.Text != null || txtbKhljxfgx.Text != "")
                kh.Ljxfje = Convert.ToDecimal(txtbKhljxfgx.Text);
            else
                lblKhmassagegx.Text = "累计金额不能为空！";
            kh.Lxr = txtbKhlxrgx.Text;
            kh.Hylb = Convert.ToInt32(ddlKhhylbgx.SelectedValue);
            kh.Lxrdzyj = txtbKhlxryjgx.Text;
            kh.Khbz = txtbKhbzgx.Text;
            lblKhmassagegx.Text = KhManager.modifyKh(kh);
            khDataBind();
            cleanGX();
        }
    }
    protected void btnKhtj_Click(object sender, EventArgs e)
    {
        Kh kh = new Kh();

        if (ddlKhhylbtj.SelectedValue == "-1")
        {
            lblKhmassagetj.Text = "请选会员类别！";
        }
        else
        {
            if (txtbKhkhmctj.Text == null && txtbKhkhmctj.Text == "")
            {
                lblKhmassagetj.Text = "请填写客户名！";
            }
            else if (KhManager.existsKhByKhmc(txtbKhkhmctj.Text.Trim()) == 1)
            {
                lblKhmassagetj.Text = "客户已存在！";
            }
            else
            {
                kh.Khmc = txtbKhkhmctj.Text;
                kh.Dz = txtbKhdztj.Text;
                kh.Yzbm = txtbKhybtj.Text;
                kh.Lxdh = txtbKhdhtj.Text;
                kh.Gszy = txtbKhzytj.Text;
                if (txtbKhljxftj.Text != null && txtbKhljxftj.Text != "")
                    kh.Ljxfje = Convert.ToDecimal(txtbKhljxftj.Text);
                else
                    lblKhmassagetj.Text = "请输入累计金额！";
                kh.Lxr = txtbKhlxrtj.Text;
                kh.Hylb = Convert.ToInt32(ddlKhhylbtj.SelectedValue);
                kh.Lxrdzyj = txtbKhlxryjtj.Text;
                kh.Khbz = txtbKhbztj.Text;
                lblKhmassagetj.Text = KhManager.addKh(kh);
                khDataBind();
                cleanTJ();
            }

        }
    }
    public void cleanGX() { 
        txtbKhkhmcgx.Text = "";
        txtbKhybgx.Text = "";
        txtbKhdhgx.Text = "";
        txtbKhdzgx.Text = "";
        txtbKhljxfgx.Text = "";
        txtbKhzygx.Text = "";
        txtbKhlxrgx.Text = "";
        txtbKhlxryjgx.Text = "";
        txtbKhbzgx.Text = "";
    }
    public void cleanTJ() {
        txtbKhkhmctj.Text = "";
        txtbKhybtj.Text = "";
        txtbKhdhtj.Text = "";
        txtbKhdztj.Text = "";
        txtbKhljxftj.Text = "";
        txtbKhzytj.Text = "";
        txtbKhlxrtj.Text = "";
        txtbKhlxryjtj.Text = "";
        txtbKhbztj.Text = "";
    }
}
