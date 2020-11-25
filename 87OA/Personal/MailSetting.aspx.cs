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

public partial class Personal_MailSetting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPPOPAndSMTP MyModel = new ZWL.BLL.ERPPOPAndSMTP();
            MyModel.GetModel(int.Parse(ZWL.Common.PublicMethod.GetSessionValue("UserID")));
            this.TextBox1.Text = MyModel.POP3UserName;
            this.TextBox2.Text = MyModel.POP3UserPwd;
            this.TextBox3.Text = MyModel.POP3Server;
            this.TextBox4.Text = MyModel.POP3Port;
            this.TextBox5.Text = MyModel.SMTPUserName;
            this.TextBox6.Text = MyModel.SMTPUserPwd;
            this.TextBox7.Text = MyModel.SMTPServer;
            this.TextBox8.Text = MyModel.SMTPFromEmail;

            TextBox2.Attributes.Add("value", MyModel.POP3UserPwd);
            TextBox6.Attributes.Add("value", MyModel.SMTPUserPwd); 

            //设定按钮权限            
            ImageButton1.Visible = ZWL.Common.PublicMethod.StrIFIn("|096M|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPPOPAndSMTP MyModel = new ZWL.BLL.ERPPOPAndSMTP();
        MyModel.ID = int.Parse(ZWL.Common.PublicMethod.GetSessionValue("UserID"));
        MyModel.POP3UserName = this.TextBox1.Text;
        MyModel.POP3UserPwd = this.TextBox2.Text;
        MyModel.POP3Server = this.TextBox3.Text;
        MyModel.POP3Port = this.TextBox4.Text;
        MyModel.SMTPUserName = this.TextBox5.Text;
        MyModel.SMTPUserPwd = this.TextBox6.Text;
        MyModel.SMTPServer = this.TextBox7.Text;
        MyModel.SMTPFromEmail = this.TextBox8.Text;
        MyModel.Update();
        ZWL.Common.MessageBox.Show(this, "修改邮件参数成功！");

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户设置邮件参数";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
    }
}