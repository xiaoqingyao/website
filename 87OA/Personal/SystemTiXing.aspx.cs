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

public partial class Personal_SystemTiXing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPTiXing MyModel = new ZWL.BLL.ERPTiXing();
            MyModel.GetModel(int.Parse(ZWL.Common.PublicMethod.GetSessionValue("UserID")));
            this.DropDownList1.SelectedValue = MyModel.TiXingTime;
            this.DropDownList2.SelectedValue = MyModel.IfTiXing;

            //设定按钮权限            
            ImageButton1.Visible = ZWL.Common.PublicMethod.StrIFIn("|011M|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPTiXing MyModel = new ZWL.BLL.ERPTiXing();
        MyModel.ID = int.Parse(ZWL.Common.PublicMethod.GetSessionValue("UserID"));
        MyModel.TiXingTime = this.DropDownList1.SelectedItem.Value.ToString();
        MyModel.IfTiXing = this.DropDownList2.SelectedItem.Value.ToString();
        MyModel.Update();
        ZWL.Common.MessageBox.Show(this, "修改系统提醒参数成功！");

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户设置系统提醒参数";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
    }
}