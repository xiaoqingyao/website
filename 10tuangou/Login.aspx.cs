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

public partial class Login : System.Web.UI.Page
{
    Common com = new Common();
    EntPersonal obj = new EntPersonal();
    CtlPersonal ctl = new CtlPersonal();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = System.Convert.ToString(Session["url"]);
    }
    protected void btnReg_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Register.aspx");
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string userName = this.txtPerName.Text;
        DataTable dt = new DataTable();
        dt = ctl.selectPersonal(userName);
        if (dt.Rows.Count == 0)
        {
            com.Alert("用户名不正确");
            return;
        }
        if ((dt.Rows[0][1].ToString()) ==this.txtPassword.Text)
        {
            Session["perName"] = userName;
            
            string url = System.Convert.ToString(Session["url"]);
            Response.Redirect(url);
        }
        else
        {
            com.Alert("密码不正确");
        }
    }
}
