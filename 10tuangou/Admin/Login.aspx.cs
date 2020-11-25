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

public partial class Admin_Login : System.Web.UI.Page
{
    Common com = new Common();
    EntUser obj = new EntUser();
    CtlUser ctl = new CtlUser();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        obj.userName = this.txtUserName.Text;
        obj.password = this.txtPassword.Text;

        try
        {
            DataTable dt = new DataTable();
            dt = ctl.Login(obj);
            if (dt.Rows.Count == 0)
            {
                com.Alert("用户名不存在");
                return;
            }
            if (dt.Rows[0][1].ToString() == obj.password.ToString())
            {
                com.Alert("登陆成功");
                Session["userName"] = obj.userName.ToString();
                Session["roleId"] = dt.Rows[0][2].ToString();
                string roleId = dt.Rows[0][2].ToString();
                Response.Redirect("manage.aspx");
            }
            else
            {
                com.Alert("密码错误");
            }
        }
        catch (Exception ex)
        {
            com.Alert("Error!!");
        }

    }
}
