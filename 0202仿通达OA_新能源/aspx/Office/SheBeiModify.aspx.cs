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

namespace OA.aspx.Office{ 
 public partial class SheBeiModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPSheBei Model = new FTD.BLL.ERPSheBei();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtSheBeiName.Text=Model.SheBeiName.ToString();
			this.txtYuanBianHao.Text=Model.YuanBianHao.ToString();
			this.txtCaiWuBianHao.Text=Model.CaiWuBianHao.ToString();
			this.txtJiBuBianHao.Text=Model.JiBuBianHao.ToString();
			this.txtSheBeiLeiBie.Text=Model.SheBeiLeiBie.ToString();
			this.txtXingHao.Text=Model.XingHao.ToString();
			this.txtXiangMu.Text=Model.XiangMu.ToString();
			this.txtChuChangBianHao.Text=Model.ChuChangBianHao.ToString();
			this.txtShiYongBuMen.Text=Model.ShiYongBuMen.ToString();
			this.txtShengChanChangJia.Text=Model.ShengChanChangJia.ToString();
			this.txtDanWei.Text=Model.DanWei.ToString();
			this.txtDanJia.Text=Model.DanJia.ToString();
			this.txtSuYuanFangShi.Text=Model.SuYuanFangShi.ToString();
			this.txtSuYaunDanWei.Text=Model.SuYaunDanWei.ToString();
			this.txtSuYuanZhouQi.Text=Model.SuYuanZhouQi.ToString();
			this.txtShangCiSuYuanDate.Text=Model.ShangCiSuYuanDate.ToString();
			this.txtJiHuaSuYaunDate.Text=Model.JiHuaSuYaunDate.ToString();
			this.txtZhengShuBianHao.Text=Model.ZhengShuBianHao.ToString();
			this.txtCeLiangFanWei.Text=Model.CeLiangFanWei.ToString();
			this.txtBuQueDingDu.Text=Model.BuQueDingDu.ToString();
			this.txtShiYongCeLiangFanWei.Text=Model.ShiYongCeLiangFanWei.ToString();
			this.txtJingDu.Text=Model.JingDu.ToString();
			this.txtJieGuoPingJia.Text=Model.JieGuoPingJia.ToString();
			this.txtPingJiaUser.Text=Model.PingJiaUser.ToString();
			this.txtQianZiDate.Text=Model.QianZiDate.ToString();
			this.txtZhengGai.Text=Model.ZhengGai.ToString();
			this.txtChuCiSuYuanDate.Text=Model.ChuCiSuYuanDate.ToString();
			this.txtQiYongDate.Text=Model.QiYongDate.ToString();
			this.txtCunFangAddr.Text=Model.CunFangAddr.ToString();
			this.txtGuanLiUser.Text=Model.GuanLiUser.ToString();
			this.txtJiFei.Text=Model.JiFei.ToString();
			this.txtZhuangTai.Text=Model.ZhuangTai.ToString();
			this.txtBeiZhu.Text=Model.BeiZhu.ToString();
			this.txtHeDuiUser.Text=Model.HeDuiUser.ToString();
			this.txtTiXingDate.Text=Model.TiXingDate.ToString();
			this.txtTiXingUser.Text=Model.TiXingUser.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPSheBei Model = new FTD.BLL.ERPSheBei();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.SheBeiName=this.txtSheBeiName.Text.ToString();
		Model.YuanBianHao=this.txtYuanBianHao.Text.ToString();
		Model.CaiWuBianHao=this.txtCaiWuBianHao.Text.ToString();
		Model.JiBuBianHao=this.txtJiBuBianHao.Text.ToString();
		Model.SheBeiLeiBie=this.txtSheBeiLeiBie.Text.ToString();
		Model.XingHao=this.txtXingHao.Text.ToString();
		Model.XiangMu=this.txtXiangMu.Text.ToString();
		Model.ChuChangBianHao=this.txtChuChangBianHao.Text.ToString();
		Model.ShiYongBuMen=this.txtShiYongBuMen.Text.ToString();
		Model.ShengChanChangJia=this.txtShengChanChangJia.Text.ToString();
		Model.DanWei=this.txtDanWei.Text.ToString();
		Model.DanJia=this.txtDanJia.Text.ToString();
		Model.SuYuanFangShi=this.txtSuYuanFangShi.Text.ToString();
		Model.SuYaunDanWei=this.txtSuYaunDanWei.Text.ToString();
		Model.SuYuanZhouQi=this.txtSuYuanZhouQi.Text.ToString();
		Model.ShangCiSuYuanDate=this.txtShangCiSuYuanDate.Text.ToString();
		Model.JiHuaSuYaunDate=this.txtJiHuaSuYaunDate.Text.ToString();
		Model.ZhengShuBianHao=this.txtZhengShuBianHao.Text.ToString();
		Model.CeLiangFanWei=this.txtCeLiangFanWei.Text.ToString();
		Model.BuQueDingDu=this.txtBuQueDingDu.Text.ToString();
		Model.ShiYongCeLiangFanWei=this.txtShiYongCeLiangFanWei.Text.ToString();
		Model.JingDu=this.txtJingDu.Text.ToString();
		Model.JieGuoPingJia=this.txtJieGuoPingJia.Text.ToString();
		Model.PingJiaUser=this.txtPingJiaUser.Text.ToString();
		Model.QianZiDate=this.txtQianZiDate.Text.ToString();
		Model.ZhengGai=this.txtZhengGai.Text.ToString();
		Model.ChuCiSuYuanDate=this.txtChuCiSuYuanDate.Text.ToString();
		Model.QiYongDate=this.txtQiYongDate.Text.ToString();
		Model.CunFangAddr=this.txtCunFangAddr.Text.ToString();
		Model.GuanLiUser=this.txtGuanLiUser.Text.ToString();
		Model.JiFei=this.txtJiFei.Text.ToString();
		Model.ZhuangTai=this.txtZhuangTai.Text.ToString();
		Model.BeiZhu=this.txtBeiZhu.Text.ToString();
		Model.HeDuiUser=this.txtHeDuiUser.Text.ToString();
		Model.TiXingDate=this.txtTiXingDate.Text.ToString();
		Model.TiXingUser=this.txtTiXingUser.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		
		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户修改仪器设备信息(" + this.txtSheBeiName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		FTD.Unit.MessageBox.ShowAndRedirect(this, "仪器设备信息修改成功！", "SheBei.aspx");
	}
}
}