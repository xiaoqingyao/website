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

public partial class Office_BookJieHuanModify : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPBookJieHuan Model = new ZWL.BLL.ERPBookJieHuan();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtBookName.Text=Model.BookName.ToString();
			this.txtJieShuDate.Text=Model.JieShuDate.ToString();
			this.txtGuiHuanDate.Text=Model.GuiHuanDate.ToString();
			this.txtJieHuanState.Text=Model.JieHuanState.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPBookJieHuan Model = new ZWL.BLL.ERPBookJieHuan();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.BookName=this.txtBookName.Text.ToString();
		Model.JieShuDate=this.txtJieShuDate.Text.ToString();
		Model.GuiHuanDate=this.txtGuiHuanDate.Text.ToString();
		Model.JieHuanState=this.txtJieHuanState.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		
		Model.Update();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改图书借还记录信息(" + this.txtBookName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "图书借还记录信息修改成功！", "BookJieHuan.aspx");
	}
}
