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

public partial class DocFile_PeiXunXiaoGuoAdd : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
            this.txtPeiXunName.Text = Request.QueryString["PeiXunName"].ToString();
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPPeiXunXiaoGuo Model = new ZWL.BLL.ERPPeiXunXiaoGuo();
		
		Model.PeiXunName=this.txtPeiXunName.Text.ToString();
		Model.FanKuiZhuTi=this.txtFanKuiZhuTi.Text.ToString();
		Model.XiaoGuoFanKui=this.txtXiaoGuoFanKui.Text.ToString();
		Model.ZongTiJieLun=this.txtZongTiJieLun.Text.ToString();
		Model.UserName=ZWL.Common.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		
		Model.Add();
		
		//дϵͳ��־
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "�û������ѵЧ����Ϣ(" + this.txtPeiXunName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "��ѵЧ����Ϣ��ӳɹ���", "PeiXunXiaoGuo.aspx?PeiXunName="+Request.QueryString["PeiXunName"].ToString());
	}
}
