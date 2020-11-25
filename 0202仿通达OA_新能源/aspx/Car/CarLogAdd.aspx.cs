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
 public partial class CarLogAdd: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			//设置上传的附件为空
			 FTD.Unit.PublicMethod.SetSessionValue("WenJianList", "");
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPCarLog Model = new FTD.BLL.ERPCarLog();
		
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
		Model.UserName=FTD.Unit.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		
		Model.Add();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户添加车辆日志记录信息(" + this.txtCarName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		FTD.Unit.MessageBox.ShowAndRedirect(this, "车辆日志记录信息添加成功！", "CarLog.aspx");
	}
}
}