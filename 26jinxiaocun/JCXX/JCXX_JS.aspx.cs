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

public partial class JCXX_JCXX_JS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            jsDataBind();//
        }
    }
    //确保刷新页面数据不丢失
    public string Jsbh
    {
        get
        {
            if (ViewState["Jsbh"] != null)
                return (string)ViewState["Jsbh"];
            else
                return "-1";
        }
        set { ViewState["Jsbh"] = value; }
    }
    //绑定业务员类别
    public void jsDataBind()
    {
        gvJs.DataSource = JsManager.getAllJs();
        gvJs.DataBind();
    }
    //分页
    protected void gvJs_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvJs.PageIndex = e.NewPageIndex;
        jsDataBind();
    }
    //改变鼠标所在行的颜色
    protected void gvJs_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)//判断事件行是不是数据行
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");//改变鼠标所在行的颜色，并存储当前颜色
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");//还原颜色
            LinkButton lbtnDelete = (LinkButton)e.Row.FindControl("lbtnDelete");//获得点击的按钮
            lbtnDelete.Attributes.Add("onclick", "return confirm('你确定删除吗？')");//弹出提示对话框
        }
    }
    //行控件事件
    protected void gvJs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        this.Jsbh = Convert.ToString(e.CommandArgument);
        if (e.CommandName == "De")
        {
            JsManager.deleteJsByJsbh(Jsbh);
        }
        if (e.CommandName == "Ed")
        {
            Js js = JsManager.getJsByJsbh(Jsbh);
            Jsbh = Convert.ToString(js.Jsbh);
            txtbjsmcgx.Text = js.Jsmc;
            txtbjsbzgx.Text = js.Jsbz;
            
        }
        jsDataBind();
    }
    //清空更新文本框
    public void cleanGX()
    {
        txtbjsmcgx.Text = "";
        txtbjsbzgx.Text = "";
    }
    //清空添加文本框
    public void cleanTJ()
    {
        txtbjsmctj.Text = "";
        txtbjsbztj.Text = "";
    }
    //更新事件
    protected void btnjsgx_Click(object sender, EventArgs e)
    {
        Js js = new Js();

        if (Jsbh == "-1")
        {
            lbljsmassagegx.Text = "请点击编辑项！";
        }
        else
        {
            js.Jsbh = Convert.ToInt32(this.Jsbh);
            js.Jsmc = txtbjsmcgx.Text;
            js.Jsbz = txtbjsbzgx.Text;
            lbljsmassagegx.Text = JsManager.modifyJs(js);
            jsDataBind();
            cleanGX();
        }
    }
    //添加事件
    protected void btnjstj_Click(object sender, EventArgs e)
    {
        Js js = new Js();
        if (txtbjsmctj.Text == null || txtbjsmctj.Text == "")
        {
            lbljsmassagetj.Text = "请输入业务员类别名称！";
        }
        else
        {
            js.Jsmc = txtbjsmctj.Text;
            js.Jsbz = txtbjsbztj.Text;
            lbljsmassagetj.Text = JsManager.addJs(js);
            jsDataBind();
            cleanTJ();
        }
    }
}
