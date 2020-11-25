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
 public partial class ReportTypeModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPReportType Model = new FTD.BLL.ERPReportType();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtTypeName.Text=Model.TypeName.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
			this.txtPaiXuStr.Text=Model.PaiXuStr.ToString();
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPReportType Model = new FTD.BLL.ERPReportType();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.TypeName=this.txtTypeName.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.PaiXuStr=this.txtPaiXuStr.Text.ToString();
		
		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户修改报表分类信息(" + this.txtTypeName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		FTD.Unit.MessageBox.ShowAndRedirect(this, "报表分类信息修改成功！", "ReportType.aspx");
	}
}
}