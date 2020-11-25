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
 public partial class CarWeiHuModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPCarWeiHu Model = new FTD.BLL.ERPCarWeiHu();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtCarName.Text=Model.CarName.ToString();
			this.txtWeiHuRiQi.Text=Model.WeiHuRiQi.ToString();
			this.txtWeiHuLeiXing.Text=Model.WeiHuLeiXing.ToString();
			this.txtWeiHuYuanYin.Text=Model.WeiHuYuanYin.ToString();
			this.txtJingBanUser.Text=Model.JingBanUser.ToString();
			this.txtWeiHuFeiYong.Text=Model.WeiHuFeiYong.ToString();
			//this.txtNowState.Text=Model.NowState.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPCarWeiHu Model = new FTD.BLL.ERPCarWeiHu();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.CarName=this.txtCarName.Text.ToString();
		Model.WeiHuRiQi=this.txtWeiHuRiQi.Text.ToString();
		Model.WeiHuLeiXing=this.txtWeiHuLeiXing.Text.ToString();
		Model.WeiHuYuanYin=this.txtWeiHuYuanYin.Text.ToString();
		Model.JingBanUser=this.txtJingBanUser.Text.ToString();
		Model.WeiHuFeiYong=this.txtWeiHuFeiYong.Text.ToString();
		Model.NowState="";
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		
		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户修改车辆维护信息(" + this.txtCarName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "车辆维护信息修改成功！", "CarWeiHu.aspx");
	}
}
}