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

public partial class HRNew_JiangChengModify : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPJiangCheng Model = new ZWL.BLL.ERPJiangCheng();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtJCUser.Text=Model.JCUser.ToString();
			this.txtJiangChengQuFen.Text=Model.JiangChengQuFen.ToString();
			this.txtJiangChengType.Text=Model.JiangChengType.ToString();
			this.txtShouYuDanWei.Text=Model.ShouYuDanWei.ToString();
			this.txtJiangChengDate.Text=Model.JiangChengDate.ToString();
			this.txtJiangChengMingMu.Text=Model.JiangChengMingMu.ToString();
			this.txtJiangChengYuanYin.Text=Model.JiangChengYuanYin.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPJiangCheng Model = new ZWL.BLL.ERPJiangCheng();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.JCUser=this.txtJCUser.Text.ToString();
		Model.JiangChengQuFen=this.txtJiangChengQuFen.Text.ToString();
		Model.JiangChengType=this.txtJiangChengType.Text.ToString();
		Model.ShouYuDanWei=this.txtShouYuDanWei.Text.ToString();
		Model.JiangChengDate=this.txtJiangChengDate.Text.ToString();
		Model.JiangChengMingMu=this.txtJiangChengMingMu.Text.ToString();
		Model.JiangChengYuanYin=this.txtJiangChengYuanYin.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		
		Model.Update();
		
		//дϵͳ��־
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "�û��޸Ľ��ͼ�¼��Ϣ(" + this.txtJCUser.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "���ͼ�¼��Ϣ�޸ĳɹ���", "JiangCheng.aspx");
	}
}
