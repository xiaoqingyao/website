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
 public partial class CarLogView: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPCarLog Model = new FTD.BLL.ERPCarLog();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblCarName.Text=Model.CarName.ToString();
			this.lblLogDate.Text=Model.LogDate.ToString();
			this.lblJingBanUser.Text=Model.JingBanUser.ToString();
			this.lblDriverUser.Text=Model.DriverUser.ToString();
			this.lblChuCheDate.Text=Model.ChuCheDate.ToString();
			this.lblStartNum.Text=Model.StartNum.ToString();
			this.lblEndNum.Text=Model.EndNum.ToString();
			this.lblXingShiTime.Text=Model.XingShiTime.ToString();
			this.lblShiYou.Text=Model.ShiYou.ToString();
			this.lblXingShiLiCheng.Text=Model.XingShiLiCheng.ToString();
			this.lblYouHaoShu.Text=Model.YouHaoShu.ToString();
			this.lblDaoDaAddress.Text=Model.DaoDaAddress.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			
			//写系统日志
			FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
			MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看车辆日志记录信息(" + this.lblCarName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
}