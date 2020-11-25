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

namespace OA.aspx.TalkRoom{ 
 public partial class SettingConfig: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.BLL.ERPTalkSetting MyModel = new FTD.BLL.ERPTalkSetting();
            MyModel.GetModel();
            TextBox1.Text = MyModel.TalkName;

            //设定按钮权限
            iButton1.Visible = FTD.Unit.PublicMethod.StrIFIn("|119M|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPTalkSetting MyModel = new FTD.BLL.ERPTalkSetting();
        MyModel.TalkName =TextBox1.Text.Trim();
        MyModel.Update();
        FTD.Unit.MessageBox.Show(this, "修改聊天室参数成功！");

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户设置聊天室参数";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
    }
}}