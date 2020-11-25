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

public partial class Supply_SupplyLinkView : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPSupplyLink Model = new ZWL.BLL.ERPSupplyLink();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblSupplysName.Text=Model.SupplysName.ToString();
			this.lblLinkManName.Text=Model.LinkManName.ToString();
			this.lblZhiWei.Text=Model.ZhiWei.ToString();
			this.lblSex.Text=Model.Sex.ToString();
			this.lblShengRi.Text=Model.ShengRi.ToString().Replace(" 0:00:00","");
			this.lblAiHao.Text=Model.AiHao.ToString();
			this.lblIFFirstLink.Text=Model.IFFirstLink.ToString();
			this.lblYouBian.Text=Model.YouBian.ToString();
			this.lblDiZhi.Text=Model.DiZhi.ToString();
			this.lblJobTel.Text=Model.JobTel.ToString();
			this.lblJiaTingTel.Text=Model.JiaTingTel.ToString();
			this.lblMobTel.Text=Model.MobTel.ToString();
			this.lblEmailStr.Text=Model.EmailStr.ToString();
			this.lblQQorMsn.Text=Model.QQorMsn.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			
			//写系统日志
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户查看供应商联系人信息(" + this.lblSupplysName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
