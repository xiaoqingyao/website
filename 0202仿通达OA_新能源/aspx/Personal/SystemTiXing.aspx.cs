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
 public partial class SystemTiXing: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPTiXing MyModel = new FTD.BLL.ERPTiXing();
            MyModel.GetModel(int.Parse(FTD.Unit.PublicMethod.GetSessionValue("UserID")));
            this.DropDownList1.SelectedValue = MyModel.TiXingTime;
            this.DropDownList2.SelectedValue = MyModel.IfTiXing;

            //设定按钮权限            
            iButton1.Visible = FTD.Unit.PublicMethod.StrIFIn("|011M|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPTiXing MyModel = new FTD.BLL.ERPTiXing();
        MyModel.ID = int.Parse(FTD.Unit.PublicMethod.GetSessionValue("UserID"));
        MyModel.TiXingTime = this.DropDownList1.SelectedItem.Value.ToString();
        MyModel.IfTiXing = this.DropDownList2.SelectedItem.Value.ToString();
        MyModel.Update();
        FTD.Unit.MessageBox.Show(this, "修改系统提醒参数成功！");

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户设置系统提醒参数";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
    }
}}