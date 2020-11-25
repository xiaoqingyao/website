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

public partial class Office_GuDingView : System.Web.UI.Page
{
    public string GDName = "";

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPGuDing Model = new ZWL.BLL.ERPGuDing();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblGDName.Text=Model.GDName.ToString();
            GDName = Model.GDName.ToString();
			this.lblGDSerils.Text=Model.GDSerils.ToString();
			this.lblGDType.Text=Model.GDType.ToString();
			this.lblSuoShuBuMen.Text=Model.SuoShuBuMen.ToString();
			this.lblGDAllCount.Text=Model.GDAllCount.ToString();
			this.lblNowCount.Text=Model.NowCount.ToString();
			this.lblNianXian.Text=Model.NianXian.ToString();
			this.lblGDXingZhi.Text=Model.GDXingZhi.ToString();
			this.lblQiYongDate.Text=Model.QiYongDate.ToString();
			this.lblBaoGuanUser.Text=Model.BaoGuanUser.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			
			//写系统日志
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户查看资产信息(" + this.lblGDName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
