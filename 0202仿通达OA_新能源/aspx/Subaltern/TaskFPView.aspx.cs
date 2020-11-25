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
 public partial class TaskFPView: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPTaskFP Model = new FTD.BLL.ERPTaskFP();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblTaskTitle.Text=Model.TaskTitle.ToString();
			this.lblTaskContent.Text=Model.TaskContent.ToString();
			this.lblFromUser.Text=Model.FromUser.ToString();
			this.lblToUserList.Text=Model.ToUserList.ToString();
			this.lblXinXiGouTong.Text=Model.XinXiGouTong.ToString();
			this.lblJinDu.Text=Model.JinDu.ToString()+"%";
			this.lblWanCheng.Text=Model.WanCheng.ToString();
			this.lblNowState.Text=Model.NowState.ToString();
            this.Label1.Text = Model.KSSJ.ToString();
            this.Label2.Text = Model.JSSJ.ToString();
            this.Label3.Text = Model.SFFK.ToString();
            this.Label4.Text = Model.FKSJ.ToString();
			//写系统日志
			FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
			MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看任务分配信息(" + this.lblTaskTitle.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
}