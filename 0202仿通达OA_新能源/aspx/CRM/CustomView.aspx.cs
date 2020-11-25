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

namespace OA.aspx.CRM{ 
 public partial class CustomView: System.Web.UI.Page
{
    public string CustomNameStr = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPCustomInfo model = new FTD.BLL.ERPCustomInfo();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.lblCustomName.Text = model.CustomName;
            CustomNameStr = model.CustomName;
            this.lblCustomSerils.Text = model.CustomSerils;
            this.lblChargeMan.Text = model.ChargeMan;
            this.lblAddress.Text = model.Address;
            this.lblUrlLink.Text = model.UrlLink;
            this.lblYouBian.Text = model.YouBian;
            this.lblTelStr.Text = model.TelStr;
            this.lblXingZhi.Text = model.XingZhi;
            this.lblLaiYuan.Text = model.LaiYuan;
            this.lblQuYu.Text = model.QuYu;
            this.lblZhuangTai.Text = model.ZhuangTai;
            this.lblRenShu.Text = model.RenShu;
            this.lblBanGongMianJi.Text = model.BanGongMianJi;
            this.lblLeiBie.Text = model.LeiBie;
            this.lblJiBie.Text = model.JiBie;
            this.lblYeWuFanWei.Text = model.YeWuFanWei;
            this.lblHangYe.Text = model.HangYe;
            this.lblMuQianWenTi.Text = model.MuQianWenTi;
            this.lblYuJiDingDanDate.Text = model.YuJiDingDanDate;
            this.lblBackInfoA.Text = model.BackInfoA;
            this.lblBackInfoB.Text = model.BackInfoB;
            this.lblBackInfoC.Text = model.BackInfoC;
            this.lblBackInfoD.Text = model.BackInfoD;
            this.lblTimeStr.Text = model.TimeStr.ToString();
            this.lblUserName.Text = model.UserName;

            this.Label2.Text = model.DingDanCount;
            this.Label1.Text = model.YuJiTiXing;
            this.Label3.Text = model.IFShare;
            this.Label4.Text = model.CusBakA;
            this.Label5.Text = model.CusBakB;
            this.Label6.Text = model.CusBakC;
            this.Label7.Text = model.CusBakD;
            this.Label8.Text = model.CusBakE;

            this.lblNameEng.Text = model.NameEng.ToString();
            this.lblFaRenDaiMa.Text = model.FaRenDaiMa.ToString();
            this.lblYingYeZhiZhao.Text = model.YingYeZhiZhao.ToString();
            this.lblZiBenE.Text = model.ZiBenE.ToString();
            this.lblZuZhiXingZhi.Text = model.ZuZhiXingZhi.ToString();
            this.lblYingYeChangSuo.Text = model.YingYeChangSuo.ToString();
            this.lblJingJi.Text = model.JingJi.ToString();
            this.lblSheHuiGuanXi.Text = model.SheHuiGuanXi.ToString();
            this.lblBenGongSiGuanXi.Text = model.BenGongSiGuanXi.ToString();
            this.lblJieShaoRen.Text = model.JieShaoRen.ToString();
            this.lblBaoZhengRen.Text = model.BaoZhengRen.ToString();
            this.lblShuiPiaoName.Text = model.ShuiPiaoName.ToString();
            this.lblDiZhiDianHua.Text = model.DiZhiDianHua.ToString();
            this.lblNaShuiDengJiHao.Text = model.NaShuiDengJiHao.ToString();
            this.lblKaiHuHangZhangHao.Text = model.KaiHuHangZhangHao.ToString();
            this.lblJiaoYiFangShi.Text = model.JiaoYiFangShi.ToString();
            this.lblZhangQi.Text = model.ZhangQi.ToString();
            this.lblFuKuanFangShi.Text = model.FuKuanFangShi.ToString();
            this.lblYunFeiChengDan.Text = model.YunFeiChengDan.ToString();
            this.lblCuXiaoFei.Text = model.CuXiaoFei.ToString();
            this.lblGuangGaoFei.Text = model.GuangGaoFei.ToString();
            this.lblYouDaiZheKou.Text = model.YouDaiZheKou.ToString();
            this.lblFuKuanTaiDu.Text = model.FuKuanTaiDu.ToString();
            this.lblShiFouDuiZhang.Text = model.ShiFouDuiZhang.ToString();
            this.lblDuiZhangShiJian.Text = model.DuiZhangShiJian.ToString();
            this.lblZuiJiaPaiFangShiJian.Text = model.ZuiJiaPaiFangShiJian.ToString();
            this.lblZuiJiaShouKuanShiJian.Text = model.ZuiJiaShouKuanShiJian.ToString();
            this.lblQiTaGongYing.Text = model.QiTaGongYing.ToString();
            this.lblChangYongNaJia.Text = model.ChangYongNaJia.ToString();
            this.lblGongSiYiJian.Text = model.GongSiYiJian.ToString();
            this.lblZiXin.Text = model.ZiXin.ToString();
            this.lblZongJieLun.Text = model.ZongJieLun.ToString();


            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户查看客户信息(" + this.lblCustomName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();
        }
    }
}
}