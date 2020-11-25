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
 public partial class BuyChanPinAdd: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
            this.txtOrderName.Attributes.Add("readonly", "true");
            this.txtProductName.Attributes.Add("readonly", "true");
			FTD.Unit.PublicMethod.CheckSession();
            this.txtOrderName.Text = Request.QueryString["OrderName"].ToString();
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPBuyChanPin Model = new FTD.BLL.ERPBuyChanPin();
		
		Model.OrderName=this.txtOrderName.Text.ToString();
		Model.ProductName=this.txtProductName.Text.ToString();
		Model.ProductSerils=this.txtProductSerils.Text.ToString();
		Model.GongYingShang=this.txtGongYingShang.Text.ToString();
		Model.ProductType=this.txtProductType.Text.ToString();
		Model.XingHao=this.txtXingHao.Text.ToString();
		Model.DanWei=this.txtDanWei.Text.ToString();
		Model.DanJia=decimal.Parse(this.txtDanJia.Text);
		Model.ShuLiang=decimal.Parse(this.txtShuLiang.Text);
		Model.ZongJia=decimal.Parse(this.txtZongJia.Text);
		Model.YiFuKuan=decimal.Parse(this.txtYiFuKuan.Text);
		Model.QianKuanShu=decimal.Parse(this.txtQianKuanShu.Text);
        Model.IFJiaoFu = this.RadioButtonList1.SelectedItem.Text;
		Model.ChanPinMiaoShu=this.txtChanPinMiaoShu.Text.ToString();
        Model.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName"); ;
		Model.TimeStr=DateTime.Now;
		Model.BackInfo=this.txtBackInfo.Text.ToString();

        if (this.RadioButtonList1.SelectedItem.Text == "已交付")
        {
            //从产品库存中加上
            string TempSqlStr = "update ERPProduct set  RuKuSum=RuKuSum+" + this.txtShuLiang.Text + ",NowKuCun=NowKuCun+" + this.txtShuLiang.Text + " where ProductName='" + this.txtProductName.Text.ToString() + "'";
            FTD.DBUnit.DbHelperSQL.ExecuteSQL(TempSqlStr);
        }

		Model.Add();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户添加采购订单产品信息(" + this.txtOrderName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "采购订单产品信息添加成功！", "BuyLog.aspx?OrderName=" + Request.QueryString["OrderName"].ToString());
	}
    protected void txtProductName_TextChanged(object sender, EventArgs e)
    {
        FTD.BLL.ERPProduct Model = new FTD.BLL.ERPProduct();
        Model.GetModelByName(txtProductName.Text);
        this.txtProductSize.Text = Model.ProductSize;
        this.txtPerformance.Text = Model.Performance;
        this.txtCoating.Text = Model.Coating;
        this.txtSurfaceTreatment.Text = Model.SurfaceTreatment;
        this.txtMagnetizingDirection.Text = Model.MagnetizingDirection;
        this.txtTolerance.Text = Model.Tolerance;
        this.rdoIsContainingTax.SelectedValue = Model.IsContainingTax.ToString();
    }
    protected void txtDanJia_TextChanged(object sender, EventArgs e)
    {
        try
        {
            decimal dDanJia = decimal.Parse(this.txtDanJia.Text);
            decimal dShuLiang = decimal.Parse(this.txtShuLiang.Text);
            txtZongJia.Text = (dDanJia * dShuLiang).ToString();
        }
        catch
        {

        }
    }
    protected void txtShuLiang_TextChanged(object sender, EventArgs e)
    {
        try
        {
            decimal dDanJia = decimal.Parse(this.txtDanJia.Text);
            decimal dShuLiang = decimal.Parse(this.txtShuLiang.Text);
            txtZongJia.Text = (dDanJia * dShuLiang).ToString();
        }
        catch
        {

        }
    }
}
}