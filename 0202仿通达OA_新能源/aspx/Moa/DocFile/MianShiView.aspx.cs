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
 public partial class MianShiView: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPMianShi Model = new FTD.BLL.ERPMianShi();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblMSName.Text=Model.MSName.ToString();
			this.lblMSDate.Text=Model.MSDate.ToString();
			this.lblMSSex.Text=Model.MSSex.ToString();
			this.lblMSAge.Text=Model.MSAge.ToString();
			this.lblXueLi.Text=Model.XueLi.ToString();
			this.lblZhuanYe.Text=Model.ZhuanYe.ToString();
			this.lblMSZhiWei.Text=Model.MSZhiWei.ToString();
			this.lblMSJieGuo.Text=Model.MSJieGuo.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			this.lblFuJianStr.Text=FTD.Unit.PublicMethod.GetWenJian(Model.FuJianStr.ToString(),"../UpLoadFile/");
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			
			//写系统日志
			FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
			MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看面试数据信息(" + this.lblMSName.Text + ")";
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