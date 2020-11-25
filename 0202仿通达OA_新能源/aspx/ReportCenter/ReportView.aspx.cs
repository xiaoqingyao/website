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

namespace OA.aspx.ReportCenter{ 
 public partial class ReportView: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPReport Model = new FTD.BLL.ERPReport();
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
			FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
			MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看报表管理信息(" + this.lblReportName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
}