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

public partial class NWorkFlow_NWorkFlowView : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPNWorkFlow Model = new ZWL.BLL.ERPNWorkFlow();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblWorkFlowName.Text=Model.WorkFlowName.ToString();
            this.lblFormID.Text = ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 FormName from ERPNForm where ID=" + Model.FormID.ToString());
			this.lblUserListOK.Text=Model.UserListOK.ToString();
			this.lblDepListOK.Text=Model.DepListOK.ToString();
			this.lblJiaoSeListOK.Text=Model.JiaoSeListOK.ToString();
			this.lblPaiXuStr.Text=Model.PaiXuStr.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			this.lblIFOK.Text=Model.IFOK.ToString();
			
			//写系统日志
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看流程定义信息(" + this.lblWorkFlowName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
