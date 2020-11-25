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

public partial class admin_login : System.Web.UI.Page
{
    DxxBlog.BLL.B_Admin dal = new DxxBlog.BLL.B_Admin();
    DxxBlog.Model.B_Admin model = new DxxBlog.Model.B_Admin();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void loginsubmit_Click(object sender, ImageClickEventArgs e)
    {
        string UserName = txtUserName.Text.Trim();
        string UserPwd = txtUserPwd.Text.Trim();
        if (UserName.Equals("") || UserPwd.Equals(""))
        {
            lbMsg.Text = "请输入您要登录用户名或密码";
        }
        else
        {
            if (Session["AdminLoginSun"] == null)
            {
                Session["AdminLoginSun"] = 1;
            }
            else
            {
                Session["AdminLoginSun"] = Convert.ToInt32(Session["AdminLoginSun"]) + 1;
            }
            //判断登录
            if (Session["AdminLoginSun"] != null && Convert.ToInt32(Session["AdminLoginSun"]) > 3)
            {
                lbMsg.Text = "登录错误超过3次，请关闭浏览器重新登录。";
            }
            else if (dal.chkAdminLogin(UserName, UserPwd))
            {
                model = dal.GetModel(UserName);
                Session["AdminNo"] = model.Id;
                Session["AdminName"] = model.UserName;
                Session["AdminLogName"] = model.LogName;
                //设置超时时间
                Session.Timeout = 45;
                Session["AdminLoginSun"] = null;
                Response.Redirect("main.aspx");
            }
            else
            {
                lbMsg.Text = "您输入的用户名或密码不正确";
            }
        }
    }
}
