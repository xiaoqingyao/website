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
 public partial class GuDingModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPGuDing Model = new FTD.BLL.ERPGuDing();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtGDName.Text=Model.GDName.ToString();
			this.txtGDSerils.Text=Model.GDSerils.ToString();
			this.txtGDType.Text=Model.GDType.ToString();
			this.txtSuoShuBuMen.Text=Model.SuoShuBuMen.ToString();
			this.txtGDAllCount.Text=Model.GDAllCount.ToString();
			this.txtNowCount.Text=Model.NowCount.ToString();
			this.txtNianXian.Text=Model.NianXian.ToString();
			this.txtGDXingZhi.Text=Model.GDXingZhi.ToString();
			this.txtQiYongDate.Text=Model.QiYongDate.ToString();
			this.txtBaoGuanUser.Text=Model.BaoGuanUser.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPGuDing Model = new FTD.BLL.ERPGuDing();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
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
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		
		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改资产信息(" + this.txtGDName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "资产信息修改成功！", "GuDing.aspx");
	}
}
}