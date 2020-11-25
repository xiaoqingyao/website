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

namespace OA.aspx.Office{ 
 public partial class GuDingAdd: System.Web.UI.Page
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
		FTD.BLL.ERPGuDing Model = new FTD.BLL.ERPGuDing();
		
		Model.GDName=this.txtGDName.Text.ToString();
		Model.GDSerils=this.txtGDSerils.Text.ToString();
		Model.GDType=this.txtGDType.Text.ToString();
		Model.SuoShuBuMen=this.txtSuoShuBuMen.Text.ToString();
		Model.GDAllCount=this.txtGDAllCount.Text.ToString();
		Model.NowCount=this.txtNowCount.Text.ToString();
		Model.NianXian=this.txtNianXian.Text.ToString();
		Model.GDXingZhi=this.txtGDXingZhi.Text.ToString();
		Model.QiYongDate=this.txtQiYongDate.Text.ToString();
		Model.BaoGuanUser=this.txtBaoGuanUser.Text.ToString();
		Model.UserName=FTD.Unit.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		
		Model.Add();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户添加资产信息(" + this.txtGDName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "资产信息添加成功！", "GuDing.aspx");
	}
}
}