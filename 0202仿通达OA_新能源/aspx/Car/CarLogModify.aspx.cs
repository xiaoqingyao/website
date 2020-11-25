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
 public partial class CarLogModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPCarLog Model = new FTD.BLL.ERPCarLog();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtCarName.Text=Model.CarName.ToString();
			this.txtLogDate.Text=Model.LogDate.ToString();
			this.txtJingBanUser.Text=Model.JingBanUser.ToString();
			this.txtDriverUser.Text=Model.DriverUser.ToString();
			this.txtChuCheDate.Text=Model.ChuCheDate.ToString();
			this.txtStartNum.Text=Model.StartNum.ToString();
			this.txtEndNum.Text=Model.EndNum.ToString();
			this.txtXingShiTime.Text=Model.XingShiTime.ToString();
			this.txtShiYou.Text=Model.ShiYou.ToString();
			this.txtXingShiLiCheng.Text=Model.XingShiLiCheng.ToString();
			this.txtYouHaoShu.Text=Model.YouHaoShu.ToString();
			this.txtDaoDaAddress.Text=Model.DaoDaAddress.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPCarLog Model = new FTD.BLL.ERPCarLog();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.CarName=this.txtCarName.Text.ToString();
		Model.LogDate=this.txtLogDate.Text.ToString();
		Model.JingBanUser=this.txtJingBanUser.Text.ToString();
		Model.DriverUser=this.txtDriverUser.Text.ToString();
		Model.ChuCheDate=this.txtChuCheDate.Text.ToString();
		Model.StartNum=this.txtStartNum.Text.ToString();
		Model.EndNum=this.txtEndNum.Text.ToString();
		Model.XingShiTime=this.txtXingShiTime.Text.ToString();
		Model.ShiYou=this.txtShiYou.Text.ToString();
		Model.XingShiLiCheng=this.txtXingShiLiCheng.Text.ToString();
		Model.YouHaoShu=this.txtYouHaoShu.Text.ToString();
		Model.DaoDaAddress=this.txtDaoDaAddress.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		
		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户修改车辆日志记录信息(" + this.txtCarName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		FTD.Unit.MessageBox.ShowAndRedirect(this, "车辆日志记录信息修改成功！", "CarLog.aspx");
	}
}
}