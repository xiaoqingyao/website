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

public partial class DocFile_PeiXunRiJiAdd : System.Web.UI.Page
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
		ZWL.BLL.ERPPeiXunRiJi Model = new ZWL.BLL.ERPPeiXunRiJi();
		
		Model.PeiXunName=this.txtPeiXunName.Text.ToString();
		Model.RiJiTitle=this.txtRiJiTitle.Text.ToString();
		Model.RiJiDate=this.txtRiJiDate.Text.ToString();
		Model.RiJiContent=this.txtRiJiContent.Text.ToString();
		Model.UserName=ZWL.Common.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		
		Model.Add();
		
		//дϵͳ��־
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "�û������ѵ��־��Ϣ(" + this.txtPeiXunName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "��ѵ��־��Ϣ��ӳɹ���", "PeiXunRiJi.aspx?PeiXunName="+Request.QueryString["PeiXunName"].ToString());
	}
}
