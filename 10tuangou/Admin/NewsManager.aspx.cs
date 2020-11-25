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

public partial class Admin_NewsManager : System.Web.UI.Page
{
    EntNews en = new EntNews();
    CtlNews cn = new CtlNews();
    THClaass th = new THClaass();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void ibtnOk_Click(object sender, ImageClickEventArgs e)
    {
        //发布新闻
        if (txtNewsContent.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('新闻内容不能为空！');</script>");
            return;
        }
        en.NewsTitle = this.txtNewsTitle.Text.Trim();
        en.Content = th.HtmlEncode(this.txtNewsContent.Text);
        en.Time = System.Convert.ToString(System.DateTime.Now);
        en.Name = "管理员";
        if (cn.insertnews(en))
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('发布成功！');</script>");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('发布失败！');</script>");
        }
    }
   
   
}
