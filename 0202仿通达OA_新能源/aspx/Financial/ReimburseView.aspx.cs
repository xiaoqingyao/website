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

namespace OA.aspx.Financial{ 
 public partial class ReimburseView: System.Web.UI.Page
{
    public string HeTongName = "";

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPReimburse Model = new FTD.BLL.ERPReimburse();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblHeTongName.Text=Model.HeTongName.ToString();
            HeTongName = Model.HeTongName.ToString();
            this.lblUserName.Text = Model.UserName.ToString();
			this.lblQianYueKeHu.Text=Model.QianYueKeHu.ToString();
            this.lblReimburseContent.Text = Model.ReimburseContent.ToString();
            this.lblApplyTime.Text = Model.ApplyTime.ToString();
            this.lblMemo.Text = Model.Memo.ToString();
			
			//写系统日志
			FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
			MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看报销单信息(" + this.lblReimburseContent.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
}