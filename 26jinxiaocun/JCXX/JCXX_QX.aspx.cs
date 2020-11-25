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

public partial class JCXX_JCXX_QX : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            qxDataBind();//
        }
    }
    //保存数据，确保刷新时数据存在
    public int Qxbh
    {
        get {
            if (ViewState["Qxbh"] != null)
                return (int)ViewState["Qxbh"];
            else
                return -1;
        }
        set { ViewState["Qxbh"] = value; }
    }
    //绑定业务员
    public void qxDataBind() {
        gvQx.DataSource = QxManager.getAllQx();
        gvQx.DataBind();
    }
    //行变色事件
    protected void gvQx_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)//判断事件行是不是数据行
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");//改变鼠标所在行的颜色，并存储当前颜色
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");//还原颜色
            LinkButton lbtnDelete = (LinkButton)e.Row.FindControl("lbtnDelete");//获得点击的按钮
            lbtnDelete.Attributes.Add("onclick", "return confirm('你确定删除吗？')");//弹出提示对话框
        }
    }
    //不显示密码
    public string getJiamiByQxmm(string qxmm) {
        string str = "";
        if(qxmm!= null && qxmm != ""){
            for (int i = 0; i < qxmm.Length;i++ )
            {
                str += "*";
            }
        }
        return str;
    }
    
    //实现分页
    protected void gvQx_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvQx.PageIndex = e.NewPageIndex;
        qxDataBind();
    }
    //编辑和删除事件
    protected void gvQx_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Qxbh = Convert.ToInt32(e.CommandArgument);
        if(e.CommandName == "De"){
            QxManager.deleteQxByQxbh(Qxbh);
        }
        if(e.CommandName == "Ed"){
            
            Qx qx = QxManager.getQxByQxbh(Qxbh);
            this.txtbqxmcgx.Text = qx.Qxmc;
            this.txtbqxurlgx.Text = qx.Qxurl;
            this.txtbbzgx.Text = qx.Qxbz;
            //lbltjmassage.Text = "eeee"+Qxbh;
        }
        qxDataBind(); 
    } 
    //更新修改项
    protected void btngx_Click(object sender, EventArgs e)
    {
        Qx qx = new Qx();
        if (this.Qxbh == -1)
        {
            lblgxmassage.Text = "请选择编辑项！";
        }
        else{
            qx.Qxbh = this.Qxbh;
            qx.Qxmc = txtbqxmcgx.Text;
            qx.Qxurl = txtbqxurlgx.Text;
            qx.Qxbz = txtbbzgx.Text;
            lblgxmassage.Text = QxManager.modifyQx(qx);
            qxDataBind();
            cleanGX();
        }
    }
    //添加新项
    protected void btntj_Click(object sender, EventArgs e)
    {
        Qx qx = new Qx();
        if (txtbqxmctj.Text == null || txtbqxmctj.Text == "")
        {
            lbltjmassage.Text = "请填写用户名！";
        }
        else
        {
            qx.Qxmc = txtbqxmctj.Text;
            qx.Qxurl = txtbqxurltj.Text;
            qx.Qxbz = txtbbztj.Text;
            lbltjmassage.Text = QxManager.addQx(qx);
            qxDataBind();
            cleanTJ();
        }
    }
    public void cleanGX() {
        txtbqxmcgx.Text = "";
        txtbqxurlgx.Text = "";
        txtbbzgx.Text = "";
    }
    public void cleanTJ()
    {
        txtbqxmctj.Text = "";
        txtbqxurltj.Text = "";
        txtbbztj.Text = "";
    }
    
}
