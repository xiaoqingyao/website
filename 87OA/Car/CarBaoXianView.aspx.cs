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

public partial class Car_CarBaoXianView : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPCarBaoXian Model = new ZWL.BLL.ERPCarBaoXian();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblCarName.Text=Model.CarName.ToString();
			this.lblFeiYongName.Text=Model.FeiYongName.ToString();
			this.lblProjectName.Text=Model.ProjectName.ToString();
			this.lblBaoXianPrice.Text=Model.BaoXianPrice.ToString();
			this.lblBaoXianDate.Text=Model.BaoXianDate.ToString();
			this.lblTiXingDate.Text=Model.TiXingDate.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			
			//дϵͳ��־
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "�û��鿴�������շ�����Ϣ(" + this.lblCarName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
