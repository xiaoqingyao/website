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
 public partial class BuyChanPinModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
            this.txtOrderName.Attributes.Add("readonly", "true");
            this.txtProductName.Attributes.Add("readonly", "true");
			FTD.BLL.ERPBuyChanPin Model = new FTD.BLL.ERPBuyChanPin();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtOrderName.Text=Model.OrderName.ToString();
			this.txtProductName.Text=Model.ProductName.ToString();
			this.txtProductSerils.Text=Model.ProductSerils.ToString();
			this.txtGongYingShang.Text=Model.GongYingShang.ToString();
			this.txtProductType.Text=Model.ProductType.ToString();
			this.txtXingHao.Text=Model.XingHao.ToString();
			this.txtDanWei.Text=Model.DanWei.ToString();
			this.txtDanJia.Text=Model.DanJia.ToString();
			this.txtShuLiang.Text=Model.ShuLiang.ToString();
			this.txtZongJia.Text=Model.ZongJia.ToString();
			this.txtYiFuKuan.Text=Model.YiFuKuan.ToString();
			this.txtQianKuanShu.Text=Model.QianKuanShu.ToString();
            this.RadioButtonList1.SelectedValue = Model.IFJiaoFu.ToString();
			this.txtChanPinMiaoShu.Text=Model.ChanPinMiaoShu.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
            this.Label1.Text = Model.ShuLiang.ToString();
            this.Label4.Text = Model.IFJiaoFu.ToString();

            RefreshData();
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPBuyChanPin Model = new FTD.BLL.ERPBuyChanPin();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
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
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		Model.BackInfo=this.txtBackInfo.Text.ToString();


        if (this.RadioButtonList1.SelectedItem.Text == this.Label4.Text)
        {
            if (this.Label4.Text == "已交付")
            {
                //从产品库存中减去
                string TempSqlStr = "update ERPProduct set RuKuSum=RuKuSum-" + this.Label1.Text + "+" + this.txtShuLiang.Text + ",NowKuCun=NowKuCun-" + this.Label1.Text + "+" + this.txtShuLiang.Text + " where ProductName='" + this.txtProductName.Text.ToString() + "'";
                FTD.DBUnit.DbHelperSQL.ExecuteSQL(TempSqlStr);
            }
        }
        else
        {
            if (this.Label4.Text == "已交付")
            {
                //从产品库存中退回原始状态
                string TempSqlStr = "update ERPProduct set RuKuSum=RuKuSum-" + this.Label1.Text + ",NowKuCun=NowKuCun-" + this.Label1.Text + " where ProductName='" + this.txtProductName.Text.ToString() + "'";
                FTD.DBUnit.DbHelperSQL.ExecuteSQL(TempSqlStr);
            }
            else
            {
                //从产品库存中减去
                string TempSqlStr = "update ERPProduct set RuKuSum=RuKuSum+" + this.txtShuLiang.Text + ",NowKuCun=NowKuCun+" + this.txtShuLiang.Text + " where ProductName='" + this.txtProductName.Text.ToString() + "'";
                FTD.DBUnit.DbHelperSQL.ExecuteSQL(TempSqlStr);
            }
        }

		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改采购订单产品信息(" + this.txtOrderName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "采购订单产品信息修改成功！", "BuyLog.aspx?OrderName=" + Request.QueryString["OrderName"].ToString());
	}

    private void RefreshData()
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
    protected void txtProductName_TextChanged(object sender, EventArgs e)
    {
        RefreshData();
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