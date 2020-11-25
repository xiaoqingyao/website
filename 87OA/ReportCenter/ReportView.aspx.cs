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

public partial class ReportCenter_ReportView : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPReport Model = new ZWL.BLL.ERPReport();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblReportName.Text=Model.ReportName.ToString();
			this.lblReportSql.Text=Model.ReportSql.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			this.lblTypeID.Text=Model.TypeID.ToString();
			this.lblUserListOK.Text=Model.UserListOK.ToString();
			this.lblDepListOK.Text=Model.DepListOK.ToString();
			this.lblJiaoSeListOK.Text=Model.JiaoSeListOK.ToString();
			this.lblPaiXuStr.Text=Model.PaiXuStr.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			
			//写系统日志
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看报表管理信息(" + this.lblReportName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
