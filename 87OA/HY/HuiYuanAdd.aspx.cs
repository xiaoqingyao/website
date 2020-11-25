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

public partial class HY_HuiYuanAdd : System.Web.UI.Page
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
		ZWL.BLL.ERPHuiYuan Model = new ZWL.BLL.ERPHuiYuan();
		
		Model.NameStr=this.txtNameStr.Text.ToString();
		Model.RuHuiDate=this.txtRuHuiDate.Text.ToString();
		Model.JieShaoRen=this.txtJieShaoRen.Text.ToString();
		Model.SexStr=this.txtSexStr.Text.ToString();
		Model.JiGuan=this.txtJiGuan.Text.ToString();
		Model.JingJi=this.txtJingJi.Text.ToString();
		Model.ChuShengDate=this.txtChuShengDate.Text.ToString();
		Model.XueLi=this.txtXueLi.Text.ToString();
		Model.ZiLi=this.txtZiLi.Text.ToString();
		Model.GeXing=this.txtGeXing.Text.ToString();
		Model.AiHao=this.txtAiHao.Text.ToString();
		Model.Address=this.txtAddress.Text.ToString();
		Model.Tel=this.txtTel.Text.ToString();
		Model.MobTel=this.txtMobTel.Text.ToString();
		Model.ZuiJiaTime=this.txtZuiJiaTime.Text.ToString();
		Model.ChangYong=this.txtChangYong.Text.ToString();
		Model.ZiXin=this.txtZiXin.Text.ToString();
		Model.JieLun=this.txtJieLun.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.UserName=ZWL.Common.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		
		Model.Add();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户添加会员信息(" + this.txtNameStr.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		ZWL.Common.MessageBox.ShowAndRedirect(this, "会员信息添加成功！", "HuiYuan.aspx");
	}
}
