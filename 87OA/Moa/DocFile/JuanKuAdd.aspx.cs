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

public partial class DocFile_JuanKuAdd : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();			
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPJuanKu Model = new ZWL.BLL.ERPJuanKu();
		
		Model.JuanKuName=this.txtJuanKuName.Text.ToString();
		Model.JuanKuSerils=this.txtJuanKuSerils.Text.ToString();
		Model.SuoShuBuMen=this.txtSuoShuBuMen.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.UserName=ZWL.Common.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
        Model.CanViewUserList = this.TextBox1.Text;
		
		Model.Add();
		
		//дϵͳ��־
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "�û���Ӿ����Ϣ(" + this.txtJuanKuName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "�����Ϣ��ӳɹ���", "JuanKu.aspx");
	}
}
