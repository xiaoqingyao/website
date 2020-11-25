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

namespace OA.aspx.TelFile{ 
 public partial class JSDICModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPJSDIC Model = new FTD.BLL.ERPJSDIC();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtDicName.Text=Model.DicName.ToString();
			this.txtBackinfo.Text=Model.Backinfo.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPJSDIC Model = new FTD.BLL.ERPJSDIC();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.DicName=this.txtDicName.Text.ToString();
		Model.Backinfo=this.txtBackinfo.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		
		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改签收文件夹信息(" + this.txtDicName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "签收文件夹信息修改成功！", "JSDIC.aspx");
	}
}
}