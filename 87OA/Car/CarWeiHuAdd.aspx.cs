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

public partial class Car_CarWeiHuAdd : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			//设置上传的附件为空
			 ZWL.Common.PublicMethod.SetSessionValue("WenJianList", "");
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPCarWeiHu Model = new ZWL.BLL.ERPCarWeiHu();
		
		Model.CarName=this.txtCarName.Text.ToString();
		Model.WeiHuRiQi=this.txtWeiHuRiQi.Text.ToString();
		Model.WeiHuLeiXing=this.txtWeiHuLeiXing.Text.ToString();
		Model.WeiHuYuanYin=this.txtWeiHuYuanYin.Text.ToString();
		Model.JingBanUser=this.txtJingBanUser.Text.ToString();
		Model.WeiHuFeiYong=this.txtWeiHuFeiYong.Text.ToString();
		Model.NowState="";
		Model.UserName=ZWL.Common.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		
		Model.Add();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户添加车辆维护信息(" + this.txtCarName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		ZWL.Common.MessageBox.ShowAndRedirect(this, "车辆维护信息添加成功！", "CarWeiHu.aspx");
	}
}
