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

namespace OA.aspx.Meeting{ 
 public partial class MeetingAdd: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           FTD.Unit.PublicMethod.CheckSession();
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPMeeting Model = new FTD.BLL.ERPMeeting();
        Model.ChuXiRen = this.TextBox4.Text;
        Model.CurentOnline = "";
        Model.HuiYiJiYao = this.TxtContent.Text;
        Model.HuiYiZhuChi = this.TextBox6.Text;
        Model.JieShuTime = DateTime.Parse(this.TextBox8.Text.Trim() + " " + this.DropDownList3.SelectedItem.Text + ":" + this.DropDownList4.SelectedItem.Text + ":00");
        Model.KaiShiTime = DateTime.Parse(this.TextBox7.Text.Trim() + " " + this.DropDownList1.SelectedItem.Text + ":" + this.DropDownList2.SelectedItem.Text + ":00");
        Model.MeetingTitle = this.TextBox1.Text;
        Model.MeetingZhuTi = this.TextBox2.Text;
        Model.MiaoShu = this.TextBox3.Text;
        Model.TimeStr = DateTime.Now;
        Model.WangLuoHuiYiShiIP = this.TextBox5.Text;
        Model.ZhuanXieRen = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        Model.Add();

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加会议信息(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        //发送短信
        SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "您有新的会议需要参加！(" + this.TextBox1.Text + ")", this.TextBox4.Text.Trim());

        FTD.Unit.MessageBox.ShowAndRedirect(this, "会议添加成功！", "MeetingDengJi.aspx");
    }
}}