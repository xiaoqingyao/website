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

public partial class Office_OfficeView : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPOffice Model = new ZWL.BLL.ERPOffice();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblOfficeName.Text=Model.OfficeName.ToString();
			this.lblMiaoShu.Text=Model.MiaoShu.ToString();
			this.lblFuJianStr.Text=ZWL.Common.PublicMethod.GetWenJian(Model.FuJianStr.ToString(),"../UpLoadFile/");
			this.lblTypeStr.Text=Model.TypeStr.ToString();
			this.lblSerils.Text=Model.Serils.ToString();
			this.lblDanWei.Text=Model.DanWei.ToString();
			this.lblDanJia.Text=Model.DanJia.ToString();
			this.lblGongYingShang.Text=Model.GongYingShang.ToString();
			this.lblMinNum.Text=Model.MinNum.ToString();
			this.lblMaxNum.Text=Model.MaxNum.ToString();
			this.lblNowNum.Text=Model.NowNum.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			
			//写系统日志
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看办公用品信息(" + this.lblOfficeName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
    public void btnDownloadFile_Click(object sender, EventArgs e)
    {
        try
        {
            ZWL.Common.PublicMethod.DownloadFile(Server.MapPath("~"), this.hdnFileURL.Value.Trim());
        }
        catch
        {
        }
    }
}
