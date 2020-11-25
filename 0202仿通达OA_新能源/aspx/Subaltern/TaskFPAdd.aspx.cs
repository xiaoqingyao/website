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

namespace OA.aspx.Subaltern{ 
 public partial class TaskFPAdd: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			//设置上传的附件为空
			 FTD.Unit.PublicMethod.SetSessionValue("WenJianList", "");
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPTaskFP Model = new FTD.BLL.ERPTaskFP();
		
		Model.TaskTitle=this.txtTaskTitle.Text.ToString();
		Model.TaskContent=this.txtTaskContent.Text.ToString();
		Model.FromUser=FTD.Unit.PublicMethod.GetSessionValue("UserName");
		Model.ToUserList=this.txtToUserList.Text.ToString();
		Model.XinXiGouTong="";
		Model.JinDu=decimal.Parse("0");
		Model.WanCheng="暂无";
		Model.NowState="任务添加";
        Model.KSSJ = DateTime.Parse(this.TextBox3.Text.Trim() + " " + this.DropDownList1.SelectedItem.Text + ":" + this.DropDownList2.SelectedItem.Text + ":00");
        Model.JSSJ = DateTime.Parse(this.TextBox2.Text.Trim() + " " + this.DropDownList3.SelectedItem.Text + ":" + this.DropDownList4.SelectedItem.Text + ":00");
        Model.FKSJ = DateTime.Parse(this.TextBox4.Text.Trim() + " " + this.DropDownList5.SelectedItem.Text + ":" + this.DropDownList6.SelectedItem.Text + ":00");
        Model.SFFK = this.TX.Value;
		Model.Add();

        //发送短信
        SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "您有新的任务需要执行！(" + this.txtTaskTitle.Text + ")", this.txtToUserList.Text.Trim());

		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户添加任务分配信息(" + this.txtTaskTitle.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		FTD.Unit.MessageBox.ShowAndRedirect(this, "任务分配信息添加成功！", "TaskFP.aspx");
	}
}
}