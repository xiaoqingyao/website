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

namespace OA.aspx.HR{ 
 public partial class JiangChengAdd: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();			
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPJiangCheng Model = new FTD.BLL.ERPJiangCheng();
		
		Model.JCUser=this.txtJCUser.Text.ToString();
		Model.JiangChengQuFen=this.txtJiangChengQuFen.Text.ToString();
		Model.JiangChengType=this.txtJiangChengType.Text.ToString();
		Model.ShouYuDanWei=this.txtShouYuDanWei.Text.ToString();
		Model.JiangChengDate=this.txtJiangChengDate.Text.ToString();
		Model.JiangChengMingMu=this.txtJiangChengMingMu.Text.ToString();
		Model.JiangChengYuanYin=this.txtJiangChengYuanYin.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.UserName=FTD.Unit.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		
		Model.Add();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加奖惩记录信息(" + this.txtJCUser.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "奖惩记录信息添加成功！", "JiangCheng.aspx");
	}
}
}