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

namespace OA.aspx.Mobile{ 
 public partial class MobileSmsAdd: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            try
            {
                this.TextBox1.Text = Request.QueryString["ShouJilist"].ToString();
            }
            catch
            { }
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPMobile MyModel = new FTD.BLL.ERPMobile();

        MyModel.ToUserList = this.TextBox1.Text.Trim();
        MyModel.ContentStr = this.TextBox2.Text.Trim();        
        MyModel.FaSongUser = FTD.Unit.PublicMethod.GetSessionValue("UserName");        
        //Mobile.SendSMS(MyModel.FaSongUser, MyModel.ToUserList, MyModel.ContentStr);
        string WrongUser = OA.App_Code.Mobile.UserToTel(MyModel.ToUserList, MyModel.ContentStr);    //发送人名,发送内容
        MyModel.ToUserList ="内部人员："+ this.TextBox1.Text;
        MyModel.Add();

        if (WrongUser.Trim() == "0")
        {
        }
        else if (WrongUser.Trim() == "1")
        {
            FTD.Unit.MessageBox.ShowAndRedirect(this, "手机短信发送成功！", "MobileSms.aspx");
        }
        else
        {
            FTD.Unit.MessageBox.ShowAndRedirect(this, "手机短信发送成功,其中" + WrongUser.Trim() + "手机号码有误！", "MobileSms.aspx");
        }


        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加新内部手机短信(" + this.TextBox2.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        //FTD.Unit.MessageBox.ShowAndRedirect(this, "手机短信发送成功！", "MobileSms.aspx");
    }
    protected void iButton2_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPMobile MyModel = new FTD.BLL.ERPMobile();

        MyModel.ToUserList = this.TextBox3.Text;
        MyModel.ContentStr = this.TextBox4.Text;
        MyModel.FaSongUser = FTD.Unit.PublicMethod.GetSessionValue("UserName");        
        //Mobile.SendSMS2(MyModel.FaSongUser, MyModel.ToUserList, MyModel.ContentStr);
        string WrongUser = OA.App_Code.Mobile.send(TextBox3.Text.Trim(), MyModel.ContentStr); //发送人和发送内容
        MyModel.ToUserList = "外部人员：" + this.TextBox3.Text;
        MyModel.Add();

        if (WrongUser.Trim() == "发送成功")
        {
            FTD.Unit.MessageBox.ShowAndRedirect(this, "手机短信发送成功！", "MobileSms.aspx");
        }
        else if (WrongUser.Trim() == "号码过多")
        {
            FTD.Unit.MessageBox.ShowAndRedirect(this, "手机短信发送失败！失败原因：号码过多。", "MobileSms.aspx");
        }
        else if (WrongUser.Trim() == "号码不正确")
        {
            FTD.Unit.MessageBox.ShowAndRedirect(this, "手机短信发送失败！失败原因：号码不正确。", "MobileSms.aspx");
        }
        else
        {
            FTD.Unit.MessageBox.ShowAndRedirect(this, "手机短信发送失败！失败原因：" + WrongUser + "。", "MobileSms.aspx");
        }

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加新外部手机短信(" + this.TextBox4.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        //FTD.Unit.MessageBox.ShowAndRedirect(this, "手机短信发送成功！", "MobileSms.aspx");
    }
}}