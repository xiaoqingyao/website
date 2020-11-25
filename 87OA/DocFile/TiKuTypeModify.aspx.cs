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

public partial class DocFile_TiKuTypeModify : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPTiKuType Model = new ZWL.BLL.ERPTiKuType();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtTiKuName.Text=Model.TiKuName.ToString();
			this.txtPaiXu.Text=Model.PaiXu.ToString();
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPTiKuType Model = new ZWL.BLL.ERPTiKuType();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.TiKuName=this.txtTiKuName.Text.ToString();
		Model.PaiXu=this.txtPaiXu.Text.ToString();
		
		Model.Update();
		
		//дϵͳ��־
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "�û��޸���������Ϣ(" + this.txtTiKuName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		ZWL.Common.MessageBox.ShowAndRedirect(this, "��������Ϣ�޸ĳɹ���", "TiKuType.aspx");
	}
}
