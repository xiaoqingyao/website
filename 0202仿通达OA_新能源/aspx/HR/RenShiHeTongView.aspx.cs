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
 public partial class RenShiHeTongView: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPRenShiHeTong Model = new FTD.BLL.ERPRenShiHeTong();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblHeTongUser.Text=Model.HeTongUser.ToString();
			this.lblNowState.Text=Model.NowState.ToString();
			this.lblSerils.Text=Model.Serils.ToString();
			this.lblTypeStr.Text=Model.TypeStr.ToString();
			this.lblJingYe.Text=Model.JingYe.ToString();
			this.lblBaoMiXieYi.Text=Model.BaoMiXieYi.ToString();
			this.lblQianYueDate.Text=Model.QianYueDate.ToString();
			this.lblManYueDate.Text=Model.ManYueDate.ToString();
			this.lblJianZhengJiGuan.Text=Model.JianZhengJiGuan.ToString();
			this.lblJianZhengDate.Text=Model.JianZhengDate.ToString();
			this.lblWeiYueZeRen.Text=Model.WeiYueZeRen.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			this.lblFuJianList.Text=FTD.Unit.PublicMethod.GetWenJian(Model.FuJianList.ToString(),"../../UploadFile/");
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			
			//写系统日志
			FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
			MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户查看人事合同信息(" + this.lblHeTongUser.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
    public void btnDownloadFile_Click(object sender, EventArgs e)
    {
        try
        {
            FTD.Unit.PublicMethod.DownloadFile(Server.MapPath("~"), this.hdnFileURL.Value.Trim());
        }
        catch
        {
        }
    }
}
}