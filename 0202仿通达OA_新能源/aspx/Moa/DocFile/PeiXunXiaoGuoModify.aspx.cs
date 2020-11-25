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

namespace OA.aspx.Moa.DocFile{ 
 public partial class PeiXunXiaoGuoModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPPeiXunXiaoGuo Model = new FTD.BLL.ERPPeiXunXiaoGuo();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtPeiXunName.Text=Model.PeiXunName.ToString();
			this.txtFanKuiZhuTi.Text=Model.FanKuiZhuTi.ToString();
			this.txtXiaoGuoFanKui.Text=Model.XiaoGuoFanKui.ToString();
			this.txtZongTiJieLun.Text=Model.ZongTiJieLun.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPPeiXunXiaoGuo Model = new FTD.BLL.ERPPeiXunXiaoGuo();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.PeiXunName=this.txtPeiXunName.Text.ToString();
		Model.FanKuiZhuTi=this.txtFanKuiZhuTi.Text.ToString();
		Model.XiaoGuoFanKui=this.txtXiaoGuoFanKui.Text.ToString();
		Model.ZongTiJieLun=this.txtZongTiJieLun.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		
		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改培训效果信息(" + this.txtPeiXunName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "培训效果信息修改成功！", "PeiXunXiaoGuo.aspx?PeiXunName="+Request.QueryString["PeiXunName"].ToString());
	}
}
}