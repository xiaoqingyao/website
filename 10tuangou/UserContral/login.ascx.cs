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

public partial class UserContral_login : System.Web.UI.UserControl
{
    Common com = new Common();
    EntPersonal obj = new EntPersonal();
    CtlPersonal ctl = new CtlPersonal();
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookies = Request.Cookies.Get("www.aa.com.cn");
        if (cookies == null)
        {

        }
        else
        {
            string userName = cookies.Values["userName"];
            Session["perName"] = userName;
            Response.Redirect("~/UpdatePassword.aspx?userName=" + userName + "");
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string userName = this.txtUserName.Text;
        DataTable dt = new DataTable();
        dt = ctl.selectPersonal(userName);
        if (dt.Rows.Count == 0)
        {
            com.Alert("用户名不正确");
            return;
        }
        if ((dt.Rows[0][1].ToString()) == this.txtPassword.Text)
        {
            Session["perName"] = userName;
            if (this.ckRemPassword.Checked.Equals(true))
            {
                HttpCookie cookie = new HttpCookie("www.aa.com.cn");
                cookie.Values.Add("userName", this.txtUserName.Text);
                cookie.Values.Add("password", this.txtPassword.Text);
                cookie.Expires = DateTime.Now.AddDays(30d);
                Response.Cookies.Add(cookie);
            }
            Response.Redirect("~/PersonalManager.aspx?userName=" + userName + "");
        }
        else
        {
            com.Alert("密码不正确");
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}
