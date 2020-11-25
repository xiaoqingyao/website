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

namespace OA.aspx.Supply{ 
 public partial class SupplysView: System.Web.UI.Page
{
    public string GongYingShang="";

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPSupplys Model = new FTD.BLL.ERPSupplys();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblSupplysName.Text=Model.SupplysName.ToString();
            GongYingShang = Model.SupplysName.ToString();
			this.lblSerils.Text=Model.Serils.ToString();
			this.lblJianCheng.Text=Model.JianCheng.ToString();
			this.lblDianHua.Text=Model.DianHua.ToString();
			this.lblMobTel.Text=Model.MobTel.ToString();
			this.lblChuanZhen.Text=Model.ChuanZhen.ToString();
			this.lblURLStr.Text=Model.URLStr.ToString();
			this.lblEmailStr.Text=Model.EmailStr.ToString();
			this.lblDiQu.Text=Model.DiQu.ToString();
			this.lblYouBian.Text=Model.YouBian.ToString();
			this.lblAddress.Text=Model.Address.ToString();
			this.lblKaiHuHang.Text=Model.KaiHuHang.ToString();
			this.lblZhangHao.Text=Model.ZhangHao.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			
			//写系统日志
			FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
			MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看供应商信息(" + this.lblSupplysName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
}