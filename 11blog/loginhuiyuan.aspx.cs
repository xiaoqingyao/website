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

public partial class loginhuiyuan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DataSet ds = new Class1().hsggetdata("select * from  [huiyuan] where username='" + TxtUserName.Text.Trim() + "'and password='" + TxtPassword.Text.Trim() + "'");
        if (ds != null && ds.Tables[0].Rows.Count != 0)
        {
            Session["huiyuanname"] = ds.Tables[0].Rows[0]["username"].ToString();
            Session["huiyuanid"] = ds.Tables[0].Rows[0]["id"].ToString();
            Response.Redirect("gerenzhongxin.aspx");
        }
        else
        {
            string js = "";
            js = "<script language='javascript'>alert('{0}');window.location.replace('{1}')</script>";
            HttpContext.Current.Response.Write(string.Format(js, "账号或者密码不对请重新登陆！", "loginhuiyuan.aspx"));
        }

    }
}
