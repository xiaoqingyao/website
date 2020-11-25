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

public partial class ReportCenter_ReportModify : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPReport Model = new ZWL.BLL.ERPReport();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtReportName.Text=Model.ReportName.ToString();
			this.txtReportSql.Text=Model.ReportSql.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
			//this.txtTypeID.Text=Model.TypeID.ToString();
			this.txtUserListOK.Text=Model.UserListOK.ToString();
			this.txtDepListOK.Text=Model.DepListOK.ToString();
			this.txtJiaoSeListOK.Text=Model.JiaoSeListOK.ToString();
			this.txtPaiXuStr.Text=Model.PaiXuStr.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPReport Model = new ZWL.BLL.ERPReport();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.ReportName=this.txtReportName.Text.ToString();
		Model.ReportSql=this.txtReportSql.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
        Model.TypeID = int.Parse(Request.QueryString["TypeID"].ToString());
		Model.UserListOK=this.txtUserListOK.Text.ToString();
		Model.DepListOK=this.txtDepListOK.Text.ToString();
		Model.JiaoSeListOK=this.txtJiaoSeListOK.Text.ToString();
		Model.PaiXuStr=this.txtPaiXuStr.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		
		Model.Update();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户修改报表管理信息(" + this.txtReportName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "报表管理信息修改成功！", "Report.aspx?TypeID=" + Request.QueryString["TypeID"].ToString());
	}
}
