using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Admin_NewsList : System.Web.UI.Page
{
    CtlNews cn = new CtlNews();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvbinding();
        }
    }
    protected void gvNews_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int i = e.RowIndex;
        string newsid = System.Convert.ToString(this.gvNews.Rows[i].Cells[0].Text);
        if (cn.deletenews(newsid))
        {
            gvbinding();
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('删除成功！');</script>");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('删除失败！');</script>");
        }
    }
    private void gvbinding()
    {
        DataTable dt = new DataTable();
        dt = cn.selectnews();
        this.gvNews.DataSource = dt;
        this.gvNews.DataBind();
    }
    protected void gvNews_RowDataBound(object sender, GridViewRowEventArgs e)
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
}
