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

namespace OA.aspx.Moa.DocFile{ 
 public partial class PeiXunView: System.Web.UI.Page
{
    public string PeiXunName = "";

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPPeiXun Model = new FTD.BLL.ERPPeiXun();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblPeiXunName.Text=Model.PeiXunName.ToString();
            PeiXunName = Model.PeiXunName.ToString();
			this.lblPeiXunUser.Text=Model.PeiXunUser.ToString();
			this.lblCanYuUser.Text=Model.CanYuUser.ToString();
			this.lblStartDate.Text=Model.StartDate.ToString();
			this.lblEndDate.Text=Model.EndDate.ToString();
			this.lblPeiXunMuDi.Text=Model.PeiXunMuDi.ToString();
			this.lblPeiXunNeiRong.Text=Model.PeiXunNeiRong.ToString();
			this.lblXiaoGuo.Text=Model.XiaoGuo.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			this.lblFuJianList.Text=FTD.Unit.PublicMethod.GetWenJian(Model.FuJianList.ToString(),"../../UploadFile/");
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			
			//写系统日志
			FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
			MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户查看培训信息(" + this.lblPeiXunName.Text + ")";
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