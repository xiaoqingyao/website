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

public partial class DocFile_PeiXunXiaoGuoModify : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPPeiXunXiaoGuo Model = new ZWL.BLL.ERPPeiXunXiaoGuo();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtPeiXunName.Text=Model.PeiXunName.ToString();
			this.txtFanKuiZhuTi.Text=Model.FanKuiZhuTi.ToString();
			this.txtXiaoGuoFanKui.Text=Model.XiaoGuoFanKui.ToString();
			this.txtZongTiJieLun.Text=Model.ZongTiJieLun.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPPeiXunXiaoGuo Model = new ZWL.BLL.ERPPeiXunXiaoGuo();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.PeiXunName=this.txtPeiXunName.Text.ToString();
		Model.FanKuiZhuTi=this.txtFanKuiZhuTi.Text.ToString();
		Model.XiaoGuoFanKui=this.txtXiaoGuoFanKui.Text.ToString();
		Model.ZongTiJieLun=this.txtZongTiJieLun.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		
		Model.Update();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改培训效果信息(" + this.txtPeiXunName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "培训效果信息修改成功！", "PeiXunXiaoGuo.aspx?PeiXunName="+Request.QueryString["PeiXunName"].ToString());
	}
}
