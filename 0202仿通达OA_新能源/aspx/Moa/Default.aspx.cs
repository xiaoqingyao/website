using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management;
using System.Configuration;

namespace OA.aspx.Moa{ 
 public partial class Default: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            TxtUserName.Text = FTD.Unit.PublicMethod.GetCookie("DTRememberName");
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPUser MyUser = new FTD.BLL.ERPUser();
        MyUser.UserLogin(TxtUserName.Text.Trim(), FTD.Unit.DEncrypt.DESEncrypt.Encrypt(TxtUserPwd.Text), "否", ConfigurationManager.AppSettings["OALogin"].ToString().Trim(), "Main.aspx",cbRememberId.Checked);
    }
}}