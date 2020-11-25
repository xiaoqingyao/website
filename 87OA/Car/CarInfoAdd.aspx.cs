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

public partial class Car_CarInfoAdd : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPCarInfo Model = new ZWL.BLL.ERPCarInfo();
		
		Model.CarName=this.txtCarName.Text.ToString();
		Model.CarPaiHao=this.txtCarPaiHao.Text.ToString();
		Model.CarXingHao=this.txtCarXingHao.Text.ToString();
		Model.LeiXing=this.txtLeiXing.Text.ToString();
		Model.DriverUser=this.txtDriverUser.Text.ToString();
		Model.NowState=this.txtNowState.Text.ToString();
		Model.UserName=ZWL.Common.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		Model.BackInfo=this.txtBackInfo.Text.ToString();
        Model.SuoShuDep = this.TextBox1.Text.ToString();
		
		Model.Add();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加车辆管理信息(" + this.txtCarName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "车辆管理信息添加成功！", "CarInfo.aspx");
	}
}
