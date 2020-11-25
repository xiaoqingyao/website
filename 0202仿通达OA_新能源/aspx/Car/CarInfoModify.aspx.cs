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
 public partial class CarInfoModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPCarInfo Model = new FTD.BLL.ERPCarInfo();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtCarName.Text=Model.CarName.ToString();
			this.txtCarPaiHao.Text=Model.CarPaiHao.ToString();
			this.txtCarXingHao.Text=Model.CarXingHao.ToString();
			this.txtLeiXing.Text=Model.LeiXing.ToString();
			this.txtDriverUser.Text=Model.DriverUser.ToString();
			this.txtNowState.Text=Model.NowState.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
            this.TextBox1.Text = Model.SuoShuDep.ToString();
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPCarInfo Model = new FTD.BLL.ERPCarInfo();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.CarName=this.txtCarName.Text.ToString();
		Model.CarPaiHao=this.txtCarPaiHao.Text.ToString();
		Model.CarXingHao=this.txtCarXingHao.Text.ToString();
		Model.LeiXing=this.txtLeiXing.Text.ToString();
		Model.DriverUser=this.txtDriverUser.Text.ToString();
		Model.NowState=this.txtNowState.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		Model.BackInfo=this.txtBackInfo.Text.ToString();
        Model.SuoShuDep = this.TextBox1.Text.ToString();
		
		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改车辆管理信息(" + this.txtCarName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "车辆管理信息修改成功！", "CarInfo.aspx");
	}
}
}