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

public partial class DocFile_JuanKuModify : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPJuanKu Model = new ZWL.BLL.ERPJuanKu();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtJuanKuName.Text=Model.JuanKuName.ToString();
			this.txtJuanKuSerils.Text=Model.JuanKuSerils.ToString();
			this.txtSuoShuBuMen.Text=Model.SuoShuBuMen.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
            this.TextBox1.Text = Model.CanViewUserList;
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPJuanKu Model = new ZWL.BLL.ERPJuanKu();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.JuanKuName=this.txtJuanKuName.Text.ToString();
		Model.JuanKuSerils=this.txtJuanKuSerils.Text.ToString();
		Model.SuoShuBuMen=this.txtSuoShuBuMen.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
        Model.CanViewUserList = this.TextBox1.Text;
		
		Model.Update();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改卷库信息(" + this.txtJuanKuName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "卷库信息修改成功！", "JuanKu.aspx");
	}
}
