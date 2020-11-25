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

namespace OA.aspx.Car{ 
 public partial class CarInfoAdd: System.Web.UI.Page
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
		FTD.BLL.ERPCarInfo Model = new FTD.BLL.ERPCarInfo();
		
		Model.CarName=this.txtCarName.Text.ToString();
		Model.CarPaiHao=this.txtCarPaiHao.Text.ToString();
		Model.CarXingHao=this.txtCarXingHao.Text.ToString();
		Model.LeiXing=this.txtLeiXing.Text.ToString();
		Model.DriverUser=this.txtDriverUser.Text.ToString();
		Model.NowState=this.txtNowState.Text.ToString();
		Model.UserName=FTD.Unit.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		Model.BackInfo=this.txtBackInfo.Text.ToString();
        Model.SuoShuDep = this.TextBox1.Text.ToString();
		
		Model.Add();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加车辆管理信息(" + this.txtCarName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "车辆管理信息添加成功！", "CarInfo.aspx");
	}
}
}