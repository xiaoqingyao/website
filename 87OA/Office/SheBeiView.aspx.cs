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

public partial class Office_SheBeiView : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPSheBei Model = new ZWL.BLL.ERPSheBei();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblSheBeiName.Text=Model.SheBeiName.ToString();
			this.lblYuanBianHao.Text=Model.YuanBianHao.ToString();
			this.lblCaiWuBianHao.Text=Model.CaiWuBianHao.ToString();
			this.lblJiBuBianHao.Text=Model.JiBuBianHao.ToString();
			this.lblSheBeiLeiBie.Text=Model.SheBeiLeiBie.ToString();
			this.lblXingHao.Text=Model.XingHao.ToString();
			this.lblXiangMu.Text=Model.XiangMu.ToString();
			this.lblChuChangBianHao.Text=Model.ChuChangBianHao.ToString();
			this.lblShiYongBuMen.Text=Model.ShiYongBuMen.ToString();
			this.lblShengChanChangJia.Text=Model.ShengChanChangJia.ToString();
			this.lblDanWei.Text=Model.DanWei.ToString();
			this.lblDanJia.Text=Model.DanJia.ToString();
			this.lblSuYuanFangShi.Text=Model.SuYuanFangShi.ToString();
			this.lblSuYaunDanWei.Text=Model.SuYaunDanWei.ToString();
			this.lblSuYuanZhouQi.Text=Model.SuYuanZhouQi.ToString();
			this.lblShangCiSuYuanDate.Text=Model.ShangCiSuYuanDate.ToString();
			this.lblJiHuaSuYaunDate.Text=Model.JiHuaSuYaunDate.ToString();
			this.lblZhengShuBianHao.Text=Model.ZhengShuBianHao.ToString();
			this.lblCeLiangFanWei.Text=Model.CeLiangFanWei.ToString();
			this.lblBuQueDingDu.Text=Model.BuQueDingDu.ToString();
			this.lblShiYongCeLiangFanWei.Text=Model.ShiYongCeLiangFanWei.ToString();
			this.lblJingDu.Text=Model.JingDu.ToString();
			this.lblJieGuoPingJia.Text=Model.JieGuoPingJia.ToString();
			this.lblPingJiaUser.Text=Model.PingJiaUser.ToString();
			this.lblQianZiDate.Text=Model.QianZiDate.ToString();
			this.lblZhengGai.Text=Model.ZhengGai.ToString();
			this.lblChuCiSuYuanDate.Text=Model.ChuCiSuYuanDate.ToString();
			this.lblQiYongDate.Text=Model.QiYongDate.ToString();
			this.lblCunFangAddr.Text=Model.CunFangAddr.ToString();
			this.lblGuanLiUser.Text=Model.GuanLiUser.ToString();
			this.lblJiFei.Text=Model.JiFei.ToString();
			this.lblZhuangTai.Text=Model.ZhuangTai.ToString();
			this.lblBeiZhu.Text=Model.BeiZhu.ToString();
			this.lblHeDuiUser.Text=Model.HeDuiUser.ToString();
			this.lblTiXingDate.Text=Model.TiXingDate.ToString();
			this.lblTiXingUser.Text=Model.TiXingUser.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			
			//写系统日志
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看仪器设备信息(" + this.lblSheBeiName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
