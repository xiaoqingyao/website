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

public partial class SystemManage_SystemSetting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //设定按钮权限
            ImageButton1.Visible = ZWL.Common.PublicMethod.StrIFIn("|089M|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));

            ZWL.BLL.ERPSystemSetting MyModel = new ZWL.BLL.ERPSystemSetting();
            MyModel.GetModel();
            TextBox1.Text = MyModel.FileType.Replace("||",",").Replace("|","");            
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPSystemSetting MyModel = new ZWL.BLL.ERPSystemSetting();
        MyModel.FileType = "|"+TextBox1.Text.Trim().Replace(",","||")+"|";
        MyModel.Update();
        ZWL.Common.MessageBox.Show(this, "修改系统参数成功！");

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户设置系统参数";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
    }
}