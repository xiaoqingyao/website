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

public partial class NWorkFlow_NFormModify : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPNForm Model = new ZWL.BLL.ERPNForm();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtFormName.Text=Model.FormName.ToString();			
			this.txtUserListOK.Text=Model.UserListOK.ToString();
			this.txtDepListOK.Text=Model.DepListOK.ToString();
			this.txtJiaoSeListOK.Text=Model.JiaoSeListOK.ToString();
			this.txtPaiXuStr.Text=Model.PaiXuStr.ToString();			
			this.DropDownList1.SelectedValue=Model.IFOK.ToString();
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPNForm Model = new ZWL.BLL.ERPNForm();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.FormName=this.txtFormName.Text.ToString();
		Model.UserListOK=this.txtUserListOK.Text.ToString();
		Model.DepListOK=this.txtDepListOK.Text.ToString();
		Model.JiaoSeListOK=this.txtJiaoSeListOK.Text.ToString();
		Model.PaiXuStr=this.txtPaiXuStr.Text.ToString();
		Model.IFOK=this.DropDownList1.SelectedValue.ToString();
		
		Model.Update();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户修改流程表单信息(" + this.txtFormName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		ZWL.Common.MessageBox.ShowAndRedirect(this, "流程表单信息修改成功！", "NForm.aspx?TypeID="+Request.QueryString["TypeID"].ToString());
	}
}
