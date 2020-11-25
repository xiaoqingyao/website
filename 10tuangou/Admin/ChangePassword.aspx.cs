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

public partial class Admin_ChangePassword : System.Web.UI.Page
{
    Common com = new Common();
    EntUser obj = new EntUser();
    CtlUser ctl = new CtlUser();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"]==null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "window.parent.location.reload();", true);
            return;
        }
        string userName = Session["userName"].ToString();
        this.lblUserName.Text = userName;
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (this.txtPassword.Text == this.txtSurePassword.Text)
        {
        }
        else
        {
            com.Alert("两次输入密码不一致.");
        }
        DataTable dt = new DataTable();
        try
        {
            dt = ctl.selectUser(Session["userName"].ToString());
            if (com.StringToMD5(this.txtOldPassword.Text) == dt.Rows[0][1].ToString())
            {
                obj.userName = Session["userName"].ToString();
                obj.password = com.StringToMD5(this.txtPassword.Text);
                if (ctl.updatePassword(obj))
                {
                    //com.Alert("更新密码成功");
                    string roleId = dt.Rows[0][2].ToString();
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('更新密码成功！');window.loaction='../User/UserManager.aspx?id=" + roleId + "'</script>");
                    //Response.Redirect("../User/UserManager.aspx?id="+roleId+"");
                }
                else
                {
                    com.Alert("更新密码不成功");
                }
            }
            else
            {
                com.Alert("原密码不对.");
            }
        }
        catch (Exception ex)
        {
            com.Alert("Error!");
        }

    }
}
