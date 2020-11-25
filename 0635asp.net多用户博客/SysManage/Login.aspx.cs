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
        string user = txt_user.Value.Trim();
        string pwd = txt_pwd.Value;

        string sql = "select * from Manager where ManagerUser='" + user + "' and ManagerPwd='" + pwd + "'";
        SqlDataReader dr = DB.getDataReader(sql);


        if (dr.Read())
        {
            //更新登录次数
            string sqlupdate = "update Manager set LoginCount=LoginCount+1 where ManagerUser='" + user + "' and ManagerPwd='" + pwd + "'";
            SqlConnection cnupdate = DB.OpenConnection();
            SqlCommand cmdupdate = new SqlCommand(sqlupdate, cnupdate);
            cmdupdate.ExecuteNonQuery();
            cnupdate.Close();
            cnupdate.Dispose();

            //Cookie记录用户登录信息
            HttpCookie cookies;
            cookies = new HttpCookie("xzfgw");
            cookies.Values.Add("Manager", HttpUtility.UrlEncode(this.txt_user.Value.Trim()));
            //cookies.Expires = DateTime.Now.AddHours(24);
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
