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

public partial class Car_CarJiaYouAdd : System.Web.UI.Page
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
		ZWL.BLL.ERPCarJiaYou Model = new ZWL.BLL.ERPCarJiaYou();
		
		Model.CarName=this.txtCarName.Text.ToString();
		Model.JYDate=this.txtJYDate.Text.ToString();
		Model.JingBanUser=this.txtJingBanUser.Text.ToString();
		Model.DriverUser=this.txtDriverUser.Text.ToString();
		Model.JiaYouAddress=this.txtJiaYouAddress.Text.ToString();
		Model.StartNum=this.txtStartNum.Text.ToString();
		Model.JiaYouNum=this.txtJiaYouNum.Text.ToString();
		Model.YouFeiJinE=this.txtYouFeiJinE.Text.ToString();
		Model.UserName=ZWL.Common.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		
		Model.Add();
		
		//дϵͳ��־
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "�û���ӳ������ͼ�¼��Ϣ(" + this.txtCarName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		ZWL.Common.MessageBox.ShowAndRedirect(this, "�������ͼ�¼��Ϣ��ӳɹ���", "CarJiaYou.aspx");
	}
}
