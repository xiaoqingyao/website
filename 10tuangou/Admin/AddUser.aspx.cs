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

public partial class Admin_AddUser : System.Web.UI.Page
{
    Common com = new Common();
    EntUser obj = new EntUser();
    CtlUser ctl = new CtlUser();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void bnOk_Click(object sender, EventArgs e)
    {
        if (this.txtUserName.Text == "")
        {
            com.Alert("用户名不能为空");
            return;
        }
        if (this.txtPassword.Text == this.txtSurePassword.Text)
        {

        }
        else
        {
            com.Alert("两次输入密码不一致");
            return;
        }
        if ((ctl.selectUser(this.txtUserName.Text)).Rows.Count == 1)
        {
            com.Alert("用户名已存在");
            return;
        }
        try
        {
            string roleId = "001";
            obj.userName = this.txtUserName.Text;
            obj.password = com.StringToMD5(this.txtPassword.Text);
            obj.roleId = "001";
            if (ctl.addUser(obj))
            {
                com.Alert("添加成功");
               
            }
            else
            {
                com.Alert("添加失败");
            }
        }
        catch (Exception ex)
        {
            com.Alert("Error" + ex.Message.ToString());
        }

    }
}
