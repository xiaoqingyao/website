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

namespace OA.aspx.SystemManage{ 
 public partial class SystemSetting: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //设定按钮权限
            iButton1.Visible = FTD.Unit.PublicMethod.StrIFIn("|089M|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));

            FTD.BLL.ERPSystemSetting MyModel = new FTD.BLL.ERPSystemSetting();
            MyModel.GetModel();
            TextBox1.Text = MyModel.FileType.Replace("||",",").Replace("|","");            
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPSystemSetting MyModel = new FTD.BLL.ERPSystemSetting();
        MyModel.FileType = "|"+TextBox1.Text.Trim().Replace(",","||")+"|";
        MyModel.Update();
        FTD.Unit.MessageBox.Show(this, "修改系统参数成功！");

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户设置系统参数";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
    }
}}