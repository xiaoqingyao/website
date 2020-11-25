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

public partial class SysManage_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
        
        }
    }
    protected void imbtnSubmit_Click(object sender, EventArgs e)
    {
        ltlMess.Text = "";
        string user = Common.UrnHtml(Txtuid.Text.Trim());
        string pwd = Txtpwd.Text;

        string sql = string.Empty;
        sql = "select * from Manager where ManagerUser='" + user + "' and ManagerPwd='" + pwd + "' and grade='" + grade.SelectedValue + "'";
         
        SqlDataReader dr = DB.getDataReader(sql);
        if (dr.Read())
        {

            //Cookie记录用户登录信息
            HttpCookie cookies;
            cookies = new HttpCookie("loginuser");
            cookies.Values.Add("Manager", Server.UrlEncode(Txtuid.Text.Trim()));
            cookies.Values.Add("ManagerId", dr[0].ToString());
            cookies.Values.Add("Grade", grade.SelectedValue);
            cookies.Values.Add("gradename", Server.UrlEncode(grade.SelectedItem.Text));
            
            Response.Cookies.Set(cookies);

            dr.Close();
            dr.Dispose();

            Response.Redirect("MainFrame.aspx");
        }
        else
        {
            dr.Close();
            dr.Dispose();
            ltlMess.Text = "登录帐号或密码错误.";
        }


        
    }

}
