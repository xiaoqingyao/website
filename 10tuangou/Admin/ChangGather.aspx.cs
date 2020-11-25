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

public partial class Admin_ChangGather : System.Web.UI.Page
{
    CtlGather cg = new CtlGather();
    EntGather eg = new EntGather();
    THClaass th = new THClaass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string gid = Request["gatherId"];
            dispalygather(gid);
            ddlBinding();
            ddlProductBinding();
            this.ibtnOk.Attributes.Add("onclick", "return confirm('确定要修改吗？');");
        }
    }
    protected void ibtnOk_Click(object sender, ImageClickEventArgs e)
    {
        if (validate(this.txtprice.Text.Trim()) == false)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('团购价格不是数字！');</script>");
            this.txtprice.Text = "";
            return;
        }
        if (validate(this.txtgahternum.Text.Trim()) == false)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('团购人数不是数字！');</script>");
            this.txtgahternum.Text = "";
            return;
        }
        eg.Time = System.DateTime.Now.ToString();
        eg.GatherId = Request["gatherId"];
        eg.Price = System.Convert.ToInt32(this.txtprice.Text);
        eg.TypeId = this.ddlgathertype.SelectedValue;
        eg.GatherNum = System.Convert.ToInt32(this.txtgahternum.Text);
        eg.Contant = th.HtmlEncode(this.txtShow.Text);
        eg.Titel = this.txtGatherTitle.Text.Trim();
        eg.ProductId = this.ddlProduct.SelectedValue;
        if (cg.Updategather(eg))//调用写入的方法
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('修改团购成功！');window.returnValue=true;window.close();</script>");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('修改团购失败！');window.returnValue=false;window.close();</script>");
        }
    }
    private void ddlBinding()//绑定团购类别名
    {
        DataTable dt = new DataTable();
        dt = cg.SelectGatherType();
        this.ddlgathertype.DataSource = dt;
        this.ddlgathertype.DataTextField = "gTypeName";
        this.ddlgathertype.DataValueField = "gTypeId";
        this.ddlgathertype.DataBind();
    }
    private void ddlProductBinding()//绑定产品名
    {
        DataTable dt = new DataTable();
        dt = cg.sProduct();
        this.ddlProduct.DataSource = dt;
        this.ddlProduct.DataTextField = "productName";
        this.ddlProduct.DataValueField = "productId";
        this.ddlProduct.DataBind();
    }
    private void dispalygather(string gid)//显示页面团购信息
    {
        DataTable dt = new DataTable();
        dt = cg.dispalygather(gid);
        this.txtGatherTitle.Text = System.Convert.ToString(dt.Rows[0][2]);
        this.txtgahternum.Text = System.Convert.ToString(dt.Rows[0][6]);
        this.txtShow.Text = th.HtmlToStringEncode(System.Convert.ToString(dt.Rows[0][3]));
        this.txtprice.Text = System.Convert.ToString(dt.Rows[0][5]);
    }
    private Boolean validate(String id)//验证字符是否为数字
    {
        try
        {
            System.Convert.ToInt32(id.Trim());
            return true;
        }
        catch
        {
            return false;
        }
    }
    protected void ibtnCancel_Click(object sender, ImageClickEventArgs e)
    {
        this.Page.RegisterClientScriptBlock("关闭窗口", "<script>window.close()</script>");
    }
}
