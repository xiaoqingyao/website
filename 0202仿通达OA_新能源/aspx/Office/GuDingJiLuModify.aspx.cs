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

namespace OA.aspx.Office{ 
 public partial class GuDingJiLuModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPGuDingJiLu Model = new FTD.BLL.ERPGuDingJiLu();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtGDName.Text=Model.GDName.ToString();
			this.txtZJType.Text=Model.ZJType.ToString();
			this.txtZJDate.Text=Model.ZJDate.ToString();
			this.txtZJJinE.Text=Model.ZJJinE.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPGuDingJiLu Model = new FTD.BLL.ERPGuDingJiLu();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.GDName=this.txtGDName.Text.ToString();
		Model.ZJType=this.txtZJType.Text.ToString();
		Model.ZJDate=this.txtZJDate.Text.ToString();
		Model.ZJJinE=this.txtZJJinE.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		
		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改折旧记录信息(" + this.txtGDName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "折旧记录信息修改成功！", "GuDingJiLu.aspx?GDName=" + Request.QueryString["GDName"].ToString());
	}
}
}