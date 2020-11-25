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
using ThesisManage.BLL;
using ThesisManage.Model;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Admin admin = (Admin)Session["admin"];
        if (admin == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    public string panduan(object s)
    {
        int state = Convert.ToInt32(s);
        string sta = null;
        if (state == 0)
            sta = "未审核";
        else if (state == 1)
            sta = "通过";
        else if (state == 2)
            sta = "审核未通过";
        return sta;
    }
    public string cutContents(object c)
    {
        string contents = c.ToString();
        string content = null;
        if (contents.Length > 10)
        {
            content = contents.Substring(0, 10);
            content = content + "...";
        }
        else
            content = contents;
        return content;
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //设置行颜色   
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#ff9900'");
            //添加自定义属性，当鼠标移走时还原该行的背景色   
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
        }
    }
}
