using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management;
using System.Configuration;

public partial class Moa_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            TxtUserName.Text = ZWL.Common.PublicMethod.GetCookie("DTRememberName");
        }
    }
    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        ZWL.BLL.ERPUser MyUser = new ZWL.BLL.ERPUser();
        MyUser.UserLogin(TxtUserName.Text.Trim(), ZWL.Common.DEncrypt.DESEncrypt.Encrypt(TxtUserPwd.Text), "否", ConfigurationManager.AppSettings["OALogin"].ToString().Trim(), "Main.aspx",cbRememberId.Checked);
    }
}