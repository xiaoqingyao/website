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
using System.Data.SqlClient;
public partial class Login : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    SqlDataReader dr;
    Alert js = new Alert();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ibtnLogin_ServerClick(object sender, ImageClickEventArgs e)
    {
        if (Request.Cookies["CheckCode"] == null)
        {
            Alert.AlertAndRedirect("您的浏览器不支持Cookie", "Login.aspx");
            return;
        }

        if (String.Compare(Request.Cookies["CheckCode"].Value, txtValidCode.Text, true) != 0)
        {
            Alert.AlertAndRedirect("验证码错误", "Login.aspx");
            return;
        }
        else
        {
            if (TxtUserName.Text == "" && TxtPassword.Text == "")
            {
                Alert.AlertAndRedirect("没有输入账号和密码！", "Login.aspx");


            }
            else
            {
                dr = data.GetDataReader("select * from  UsersInfo where name='" + TxtUserName.Text.Trim() + "'and Password='" + TxtPassword.Text.Trim() + "'");
                if (dr.Read())
                {
                    Session["admin"] = dr["name"].ToString();
                    Session["Roule"] = dr["Roule"].ToString();
                    Alert.AlertAndRedirect("登陆成功", "Admin/index.html");
                }
                else
                {
                    Alert.AlertAndRedirect("账号或者密码不对请重新登陆！", "Login.aspx");
                }
            }
        }
    }
}
