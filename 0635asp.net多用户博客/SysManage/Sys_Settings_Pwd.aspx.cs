using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class SysManage_Sys_Settings_Pwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["xzfgw"] != null)
        {
            if (Request.Cookies["xzfgw"]["Manager"] != null)
            {
                Label1.Text = HttpUtility.UrlDecode(Request.Cookies["xzfgw"]["Manager"].ToString());
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string pwd_old = txt_old_pwd.Text;
        string pwd_new = txt_new_pwd.Text;
        bool bl= DB.isExists("select * from Manager where ManagerUser='"+Label1.Text.Trim()+"' and ManagerPwd='" + pwd_old + "'");
        if (bl)
        {
            DB.ExecuteSql("update Manager set ManagerPwd='"+pwd_new+"' where ManagerUser='"+Label1.Text.Trim()+"'");
            Common.ShowMessage(Page, "更新成功！", "");
            
        }
        else
        {
            Common.ShowMessage(Page, "原密码错误！", "");
        }

    }


}
