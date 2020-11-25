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
 public partial class ProductAdd: System.Web.UI.Page
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
		FTD.BLL.ERPProduct Model = new FTD.BLL.ERPProduct();
		
		Model.ProductName=this.txtProductName.Text.ToString();
		Model.ProductSerils=this.txtProductSerils.Text.ToString();
		Model.GongYingShang=this.txtGongYingShang.Text.ToString();
		Model.ProductType=this.txtProductType.Text.ToString();
		Model.XingHao=this.txtXingHao.Text.ToString();
		Model.DanWei=this.txtDanWei.Text.ToString();
		Model.ChengBen=this.txtChengBen.Text.ToString();
		Model.ChuShou=this.txtChuShou.Text.ToString();
		Model.RuKuSum=decimal.Parse(this.txtRuKuSum.Text);
		Model.ChuKuSum=decimal.Parse(this.txtChuKuSum.Text);
		Model.NowKuCun=decimal.Parse(this.txtNowKuCun.Text);
		Model.KuCunBaoJing=decimal.Parse(this.txtKuCunBaoJing.Text);
		Model.CunChuWeiZhi=this.txtCunChuWeiZhi.Text.ToString();
		Model.ChanPinMiaoShu=this.txtChanPinMiaoShu.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
        Model.ProductSize = this.txtProductSize.Text;
        Model.Performance = this.txtPerformance.Text;
        Model.Coating = this.txtCoating.Text;
        Model.SurfaceTreatment = this.txtSurfaceTreatment.Text;
        Model.MagnetizingDirection = this.txtMagnetizingDirection.Text;
        Model.Tolerance = this.txtTolerance.Text;
        Model.IsContainingTax = Int32.Parse(rdoIsContainingTax.SelectedValue);
		Model.Add();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户添加产品信息(" + this.txtProductName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		FTD.Unit.MessageBox.ShowAndRedirect(this, "产品信息添加成功！", "Product.aspx");
	}
}
}