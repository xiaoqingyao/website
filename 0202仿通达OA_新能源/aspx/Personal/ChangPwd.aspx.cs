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

namespace OA.aspx.Personal{ 
 public partial class ChangPwd: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            this.Label1.Text = FTD.Unit.PublicMethod.GetSessionValue("UserName");

            //设定按钮权限
            iButton1.Visible = FTD.Unit.PublicMethod.StrIFIn("|012M|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPUser MyModel = new FTD.BLL.ERPUser();
        MyModel.ID = int.Parse(FTD.Unit.PublicMethod.GetSessionValue("UserID"));
        MyModel.UserPwd = FTD.Unit.DEncrypt.DESEncrypt.Encrypt(this.TextBox1.Text);
        MyModel.UpdatePwd();
        FTD.Unit.MessageBox.Show(this, "修改用户密码成功！");

        
        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改密码";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
    }
}}