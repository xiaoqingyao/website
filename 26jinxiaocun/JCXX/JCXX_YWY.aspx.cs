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

public partial class JCXX_JCXX_YWY : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            ywyDataBind();
            ywylbDataBind();
        }
    }
    //保存数据，防止更新页面丢失
    public int Ywybh {
        get { 
            if(ViewState["Ywybh"] != null)
                return (int)ViewState["Ywybh"];
            else
                return -1;
        }
        set { ViewState["Ywybh"] = value;}
    }
    //绑定业务员
    public void ywyDataBind() {
        gvYwy.DataSource = YwyManager.getAllYwy();
        gvYwy.DataBind();
    }
    //分页
    protected void gvYwy_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvYwy.PageIndex = e.NewPageIndex;
        ywyDataBind();
    }
    //业务员类别初始化
    public void ywylbDataBind() {
        ddljsbhgx.DataSource = JsManager.getAllJs();
        ddljsbhgx.DataTextField = "jsmc";
        ddljsbhgx.DataValueField = "jsbh";
        ddljsbhgx.DataBind();
        ddljsbhtj.DataSource = JsManager.getAllJs();
        ddljsbhtj.DataTextField = "jsmc";
        ddljsbhtj.DataValueField = "jsbh";
        ddljsbhtj.DataBind();
        ListItem item = new ListItem("请选择", "-1", true);
        ddljsbhtj.Items.Insert(0,item);
    }
    //获得业务员类别名称
    public static string getJsmcByJsbh(string jsbh)
    {
        Js js = new Js();
        js = JsManager.getJsByJsbh(jsbh);
        return js.Jsmc;
    }
    //改变鼠标所在行颜色
    protected void gvYwy_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)//判断事件行是不是数据行
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");//改变鼠标所在行的颜色，并存储当前颜色
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");//还原颜色
            LinkButton lbtnDelete = (LinkButton)e.Row.FindControl("lbtnDelete");//获得点击的按钮
            lbtnDelete.Attributes.Add("onclick", "return confirm('你确定删除吗？')");//弹出提示对话框
        }
    }
    //行事件
    protected void gvYwy_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        this.Ywybh = Convert.ToInt32(e.CommandArgument);
        if(e.CommandName == "De"){
            YwyManager.deleteYwyByYwybh(Ywybh);
        }
        if(e.CommandName == "Ed"){
            Ywy ywy = YwyManager.getYwyByYwybh(Ywybh);
            txtbywymcgx.Text = ywy.Ywymc;
            txtbdlmcgx.Text = ywy.Dlmc;
            txtbdlmmgx.Text = ywy.Dlmm;
            txtblxdhgx.Text = ywy.Lxdh;
            txtbjtzzgx.Text = ywy.Jtzz;
            txtbsfzhmgx.Text = ywy.Sfzhm;
            ddljsbhgx.SelectedItem.Selected = false;
            ddljsbhgx.Items.FindByValue(Convert.ToString(ywy.Jsbh)).Selected = true;
            txtbbzgx.Text = ywy.Ywybz;
        }
        ywyDataBind();
    }
    //更新事件
    protected void btngx_Click(object sender, EventArgs e)
    {
        try
        {
            Ywy ywy = new Ywy();
            ywy.Ywybh = this.Ywybh;
            ywy.Ywymc = txtbywymcgx.Text;
            ywy.Dlmc = txtbdlmcgx.Text;
            ywy.Dlmm = txtbdlmmgx.Text;
            ywy.Lxdh = txtblxdhgx.Text;
            ywy.Jtzz = txtbjtzzgx.Text;
            ywy.Sfzhm = txtbsfzhmgx.Text;
            ywy.Jsbh = Convert.ToInt32(ddljsbhgx.SelectedValue);
            ywy.Ywybz = txtbbzgx.Text;
            lblgxmassage.Text = YwyManager.modifyYwy(ywy);
            ywyDataBind();
            cleanGX();
        }
        catch(Exception ex){
            lblgxmassage.Text = "请点击编辑项！";
        }
    }
    //添加事件
    protected void btntj_Click(object sender, EventArgs e)
    {
        Ywy ywy = new Ywy();
        if (txtbywymctj.Text == null || txtbywymctj.Text == "")
        {
            lbltjmassage.Text = "请输入业务员名称！";
        }
        else if(txtbdlmctj.Text == null || txtbdlmctj.Text == ""){
            lbltjmassage.Text = "请输入登录名称！";
        }
        else if (txtbdlmmtj.Text == null || txtbdlmmtj.Text == "")
        {
            lbltjmassage.Text = "请输入登录密码！";
        }
        else if(ddljsbhtj.SelectedValue == "-1")
        {
                lbltjmassage.Text = "请选择业务员类别！"; 
        }
        else{
            ywy.Ywymc = txtbywymctj.Text;
            ywy.Dlmc = txtbdlmctj.Text;
            ywy.Dlmm = txtbdlmmtj.Text;
            ywy.Lxdh = txtblxdhtj.Text;
            ywy.Jtzz = txtbjtzztj.Text;
            ywy.Sfzhm = txtbsfzhmtj.Text;
            ywy.Jsbh = Convert.ToInt32(ddljsbhtj.SelectedValue);
            ywy.Ywybz = txtbbztj.Text;
            lbltjmassage.Text = YwyManager.addYwy(ywy);
            ywyDataBind();
            cleanTJ();
            
        }
        
    }
    //清空更新项
    public void cleanGX() {
        txtbywymcgx.Text = "";
        txtbdlmcgx.Text = "";
        txtbdlmmgx.Text = "";
        txtblxdhgx.Text = "";
        txtbjtzzgx.Text = "";
        txtbsfzhmgx.Text = "";
        txtbbzgx.Text = "";
    }
    //清空添加项
    public void cleanTJ()
    {
        txtbywymctj.Text = "";
        txtbdlmctj.Text = "";
        txtbdlmmtj.Text = "";
        txtblxdhtj.Text = "";
        txtbjtzztj.Text = "";
        txtbsfzhmtj.Text = "";
        txtbbztj.Text = "";
    }
}
