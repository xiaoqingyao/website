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

public partial class Car_CarBaoXianAdd : System.Web.UI.Page
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
		ZWL.BLL.ERPCarBaoXian Model = new ZWL.BLL.ERPCarBaoXian();
		
		Model.CarName=this.txtCarName.Text.ToString();
		Model.FeiYongName=this.txtFeiYongName.Text.ToString();
		Model.ProjectName=this.txtProjectName.Text.ToString();
		Model.BaoXianPrice=this.txtBaoXianPrice.Text.ToString();
		Model.BaoXianDate=this.txtBaoXianDate.Text.ToString();
		Model.TiXingDate=this.txtTiXingDate.Text.ToString();
        Model.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName"); ;
        Model.TimeStr = DateTime.Now;
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		
		Model.Add();
		
		//дϵͳ��־
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "�û���ӳ������շ�����Ϣ(" + this.txtCarName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		ZWL.Common.MessageBox.ShowAndRedirect(this, "�������շ�����Ϣ��ӳɹ���", "CarBaoXian.aspx");
	}
}
