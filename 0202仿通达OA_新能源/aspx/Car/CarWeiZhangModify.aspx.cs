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
 public partial class CarWeiZhangModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPCarWeiZhang Model = new FTD.BLL.ERPCarWeiZhang();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtCarName.Text=Model.CarName.ToString();
			this.txtWZDate.Text=Model.WZDate.ToString();
			this.txtDriverUser.Text=Model.DriverUser.ToString();
			this.txtWZAddress.Text=Model.WZAddress.ToString();
			this.txtKouFenNum.Text=Model.KouFenNum.ToString();
			this.txtFKJinE.Text=Model.FKJinE.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPCarWeiZhang Model = new FTD.BLL.ERPCarWeiZhang();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.CarName=this.txtCarName.Text.ToString();
		Model.WZDate=this.txtWZDate.Text.ToString();
		Model.DriverUser=this.txtDriverUser.Text.ToString();
		Model.WZAddress=this.txtWZAddress.Text.ToString();
		Model.KouFenNum=this.txtKouFenNum.Text.ToString();
		Model.FKJinE=this.txtFKJinE.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		
		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户修改车辆违章记录信息(" + this.txtCarName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		FTD.Unit.MessageBox.ShowAndRedirect(this, "车辆违章记录信息修改成功！", "CarWeiZhang.aspx");
	}
}
}