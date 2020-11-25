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

public partial class Supply_SupplyLinkModify : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPSupplyLink Model = new ZWL.BLL.ERPSupplyLink();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtSupplysName.Text=Model.SupplysName.ToString();
			this.txtLinkManName.Text=Model.LinkManName.ToString();
			this.txtZhiWei.Text=Model.ZhiWei.ToString();
			this.txtSex.Text=Model.Sex.ToString();
            this.txtShengRi.Text = Model.ShengRi.ToString().Replace(" 0:00:00", "");
			this.txtAiHao.Text=Model.AiHao.ToString();
			this.txtIFFirstLink.Text=Model.IFFirstLink.ToString();
			this.txtYouBian.Text=Model.YouBian.ToString();
			this.txtDiZhi.Text=Model.DiZhi.ToString();
			this.txtJobTel.Text=Model.JobTel.ToString();
			this.txtJiaTingTel.Text=Model.JiaTingTel.ToString();
			this.txtMobTel.Text=Model.MobTel.ToString();
			this.txtEmailStr.Text=Model.EmailStr.ToString();
			this.txtQQorMsn.Text=Model.QQorMsn.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPSupplyLink Model = new ZWL.BLL.ERPSupplyLink();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.SupplysName=this.txtSupplysName.Text.ToString();
		Model.LinkManName=this.txtLinkManName.Text.ToString();
		Model.ZhiWei=this.txtZhiWei.Text.ToString();
		Model.Sex=this.txtSex.Text.ToString();
		Model.ShengRi=DateTime.Parse(this.txtShengRi.Text);
		Model.AiHao=this.txtAiHao.Text.ToString();
		Model.IFFirstLink=this.txtIFFirstLink.Text.ToString();
		Model.YouBian=this.txtYouBian.Text.ToString();
		Model.DiZhi=this.txtDiZhi.Text.ToString();
		Model.JobTel=this.txtJobTel.Text.ToString();
		Model.JiaTingTel=this.txtJiaTingTel.Text.ToString();
		Model.MobTel=this.txtMobTel.Text.ToString();
		Model.EmailStr=this.txtEmailStr.Text.ToString();
		Model.QQorMsn=this.txtQQorMsn.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		
		Model.Update();
		
		//дϵͳ��־
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "�û��޸Ĺ�Ӧ����ϵ����Ϣ(" + this.txtSupplysName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "��Ӧ����ϵ����Ϣ�޸ĳɹ���", "SupplysLink.aspx?GongYingShang=" + Request.QueryString["GongYingShang"].ToString());
	}
}
