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

public partial class Car_CarBaoYangAdd : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			//�����ϴ��ĸ���Ϊ��
			 ZWL.Common.PublicMethod.SetSessionValue("WenJianList", "");
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPCarBaoYang Model = new ZWL.BLL.ERPCarBaoYang();
		
		Model.CarName=this.txtCarName.Text.ToString();
		Model.BYDate=this.txtBYDate.Text.ToString();
		Model.JingBanUser=this.txtJingBanUser.Text.ToString();
		Model.ZhuGuanUser=this.txtZhuGuanUser.Text.ToString();
		Model.BYQianLCBNum=this.txtBYQianLCBNum.Text.ToString();
		Model.QiYouJinE=this.txtQiYouJinE.Text.ToString();
		Model.BYJinE=this.txtBYJinE.Text.ToString();
		Model.WeiXiuJinE=this.txtWeiXiuJinE.Text.ToString();
		Model.OtherJinE=this.txtOtherJinE.Text.ToString();
		Model.UserName=ZWL.Common.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		
		Model.Add();
		
		//дϵͳ��־
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "�û���ӳ���������¼��Ϣ(" + this.txtCarName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		ZWL.Common.MessageBox.ShowAndRedirect(this, "����������¼��Ϣ��ӳɹ���", "CarBaoYang.aspx");
	}
}
