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

public partial class Admin_GatherManager : System.Web.UI.Page
{
    CtlGather cc = new CtlGather();
    EntGather eg = new EntGather();
    THClaass th = new THClaass();
    DataBase db = new DataBase();
    public static string sql;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            sql = "select gatherId,gatherTitle,gPrice,gatherNum,number,productName from g_gather g join g_product p on g.productId=p.productId";
            gvBingding(sql);
            ddlBinding();
            if (Session["productname"] != null)
            {
                this.txtProduct.Text = System.Convert.ToString(Session["productname"]);
            }
        }
    }
    protected void ibtnOk_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["productid"] == null)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('请选择一个产品！');</script>");
            this.txtProduct.Text = "";
            return;
        }
        else
        {
            eg.ProductId = System.Convert.ToString(Session["productid"]);
        }
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
        eg.GatherId = cc.CreateGatherId();
        eg.Heat = 0;
        eg.Number = 0;
        eg.Price = System.Convert.ToInt32(this.txtprice.Text);
        eg.TypeId = this.ddlgathertype.SelectedValue;
        eg.GatherNum = System.Convert.ToInt32(this.txtgahternum.Text);
        eg.Contant = th.HtmlEncode(this.txtShow.Text);
        eg.Titel = this.txtGatherTitle.Text.Trim();
        if (cc.InsertGather(eg))//调用写入的方法
        {
            gvBingding(sql);
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('添加团购成功！');</script>");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('添加团购失败！');</script>");
        }
    }
    protected void ibtnCancel_Click(object sender, ImageClickEventArgs e)
    {

    }
    private void ddlBinding()
    {
        DataTable dt = new DataTable();
        dt = cc.SelectGatherType();
        this.ddlgathertype.DataSource = dt;
        this.ddlgathertype.DataTextField = "gTypeName";
        this.ddlgathertype.DataValueField = "gTypeId";
        this.ddlgathertype.DataBind();
    }
    protected void ibtnAdd_Click(object sender, ImageClickEventArgs e)//添加团购类别
    {
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>var bRef=window.showModalDialog('./addGatherType.aspx','','dialogHeight:350px;dialogWidth :480px;help:no;toolbar:no;status:no;');if(bRef==true){window.location=window.location;}</script>");
    }
    protected void btnbrowse_Click(object sender, EventArgs e)//选择产品
    {
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>var bRef=window.showModalDialog('./ChooseProduct.aspx','','dialogHeight:350px;dialogWidth :480px;help:no;toolbar:no;status:no;');if(bRef==true){window.location=window.location;}</script>");
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
    protected void gvGather_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex < 0) return;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //当鼠标放上去的时候 先保存当前行的背景颜色 并给附一颜色 
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='yellow',this.style.fontWeight='';");
            //当鼠标离开的时候 将背景颜色还原的以前的颜色 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor,this.style.fontWeight='';");
            //单击样式
            e.Row.Attributes.Add("onclick", "if(window.oldtr!=null){window.oldtr.runtimeStyle.cssText='';}this.runtimeStyle.cssText='background-color:#99cc00';window.oldtr=this;");
            ImageButton ib = (ImageButton)e.Row.FindControl("ibtnDelete");
            ib.Attributes.Add("onclick", "return confirm('此操作不可逆，您确定要删除所选的数据吗？');");
        }
    }
    private void gvBingding(string sql)
    {
        DataTable dt = new DataTable();
        dt = db.RunDataSet(sql).Tables[0];
        this.gvGather.DataSource = dt;
        this.gvGather.DataBind();
    }
    protected void gvGather_RowDeleting(object sender, GridViewDeleteEventArgs e)//删除团购信息
    {
        int i = e.RowIndex;
        string gid = this.gvGather.Rows[i].Cells[0].Text;
        //调用删除方法
        if (cc.DeleteGather(gid))
        {
            gvBingding(sql);
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('删除成功！');</script>");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('删除失败！');</script>");
        }

    }
    protected void gvGather_RowEditing(object sender, GridViewEditEventArgs e)//修改团购信息
    {
        int i = e.NewEditIndex;
        string gid = this.gvGather.Rows[i].Cells[0].Text;
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>var bRef=window.showModalDialog('./ChangGather.aspx?gatherId=" + gid + "','','dialogHeight:500px;dialogWidth :600px;help:no;toolbar:no;status:no;');if(bRef==true){window.location=window.location;}</script>");
    }
    protected void ibtnSreach_Click(object sender, ImageClickEventArgs e)
    {
        if (this.txtSechCompanyName.Text == "")
        {
            sql = "select gatherId,gatherTitle,gPrice,gatherNum,number,productName from g_gather g join g_product p on g.productId=p.productId";
        }
        else
        {
            sql = "select gatherId,gatherTitle,gPrice,gatherNum,number,productName from g_gather g join g_product p on g.productId=p.productId where gatherTitle like '%" + this.txtSechCompanyName.Text + "%'";
        }
        gvBingding(sql);
    }
}
