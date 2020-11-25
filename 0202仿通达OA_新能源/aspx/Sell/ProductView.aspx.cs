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

namespace OA.aspx.Sell{ 
 public partial class ProductView: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPProduct Model = new FTD.BLL.ERPProduct();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblProductName.Text=Model.ProductName.ToString();
			this.lblProductSerils.Text=Model.ProductSerils.ToString();
			this.lblGongYingShang.Text=Model.GongYingShang.ToString();
			this.lblProductType.Text=Model.ProductType.ToString();
			this.lblXingHao.Text=Model.XingHao.ToString();
			this.lblDanWei.Text=Model.DanWei.ToString();
			this.lblChengBen.Text=Model.ChengBen.ToString();
			this.lblChuShou.Text=Model.ChuShou.ToString();
			this.lblRuKuSum.Text=Model.RuKuSum.ToString();
			this.lblChuKuSum.Text=Model.ChuKuSum.ToString();
			this.lblNowKuCun.Text=Model.NowKuCun.ToString();
			this.lblKuCunBaoJing.Text=Model.KuCunBaoJing.ToString();
			this.lblCunChuWeiZhi.Text=Model.CunChuWeiZhi.ToString();
			this.lblChanPinMiaoShu.Text=Model.ChanPinMiaoShu.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
            this.lblProductSize.Text = Model.ProductSize;
            this.lblPerformance.Text = Model.Performance;
            this.lblCoating.Text = Model.Coating;
            this.lblSurfaceTreatment.Text = Model.SurfaceTreatment;
            this.lblMagnetizingDirection.Text = Model.MagnetizingDirection;
            this.lblTolerance.Text = Model.Tolerance;
            this.lblIsContainingTax.Text = Model.IsContainingTax == 1 ? "是" : "否";

			//写系统日志
			FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
			MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看产品信息(" + this.lblProductName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
}