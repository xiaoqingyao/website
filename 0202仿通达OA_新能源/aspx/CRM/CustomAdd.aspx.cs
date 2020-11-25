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
 public partial class CustomAdd: System.Web.UI.Page
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
        if (FTD.Unit.PublicMethod.IFExists("CustomName", "ERPCustomInfo", 0, this.txtCustomName.Text) == true)
        {
            string CustomName = this.txtCustomName.Text;
            string CustomSerils = this.txtCustomSerils.Text;
            string ChargeMan = this.txtChargeMan.Text;
            string Address = this.txtAddress.Text;
            string UrlLink = this.txtUrlLink.Text;
            string YouBian = this.txtYouBian.Text;
            string TelStr = this.txtTelStr.Text;
            string XingZhi = this.txtXingZhi.Text;
            string LaiYuan = this.txtLaiYuan.Text;
            string QuYu = this.txtQuYu.Text;
            string ZhuangTai = this.txtZhuangTai.Text;
            string RenShu = this.txtRenShu.Text;
            string BanGongMianJi = this.txtBanGongMianJi.Text;
            string LeiBie = this.txtLeiBie.Text;
            string JiBie = this.txtJiBie.Text;
            string YeWuFanWei = this.txtYeWuFanWei.Text;
            string HangYe = this.txtHangYe.Text;
            string MuQianWenTi = this.txtMuQianWenTi.Text;
            string YuJiDingDanDate = this.txtYuJiDingDanDate.Text;
            string BackInfoA = this.txtBackInfoA.Text;
            string BackInfoB = this.txtBackInfoB.Text;
            string BackInfoC = this.txtBackInfoC.Text;
            string BackInfoD = this.txtBackInfoD.Text;

            FTD.BLL.ERPCustomInfo model = new FTD.BLL.ERPCustomInfo();
            model.CustomName = CustomName;
            model.CustomSerils = CustomSerils;
            model.ChargeMan = ChargeMan;
            model.Address = Address;
            model.UrlLink = UrlLink;
            model.YouBian = YouBian;
            model.TelStr = TelStr;
            model.XingZhi = XingZhi;
            model.LaiYuan = LaiYuan;
            model.QuYu = QuYu;
            model.ZhuangTai = ZhuangTai;
            model.RenShu = RenShu;
            model.BanGongMianJi = BanGongMianJi;
            model.LeiBie = LeiBie;
            model.JiBie = JiBie;
            model.YeWuFanWei = YeWuFanWei;
            model.HangYe = HangYe;
            model.MuQianWenTi = MuQianWenTi;
            model.YuJiDingDanDate = YuJiDingDanDate;
            model.BackInfoA = BackInfoA;
            model.BackInfoB = BackInfoB;
            model.BackInfoC = BackInfoC;
            model.BackInfoD = BackInfoD;
            model.TimeStr = DateTime.Now;
            model.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            model.DingDanCount = this.txtDingDanCount.Text;
            model.YuJiTiXing = this.txtYuJiTiXing.Text;
            model.IFShare = this.txtIFShare.Text;
            model.CusBakA = this.txtCusBakA.Text;
            model.CusBakB = this.txtCusBakB.Text;
            model.CusBakC = this.txtCusBakC.Text;
            model.CusBakD = this.txtCusBakD.Text;
            model.CusBakE = this.txtCusBakE.Text;

            model.NameEng = this.txtNameEng.Text.ToString();
            model.FaRenDaiMa = this.txtFaRenDaiMa.Text.ToString();
            model.YingYeZhiZhao = this.txtYingYeZhiZhao.Text.ToString();
            model.ZiBenE = this.txtZiBenE.Text.ToString();
            model.ZuZhiXingZhi = this.txtZuZhiXingZhi.Text.ToString();
            model.YingYeChangSuo = this.txtYingYeChangSuo.Text.ToString();
            model.JingJi = this.txtJingJi.Text.ToString();
            model.SheHuiGuanXi = this.txtSheHuiGuanXi.Text.ToString();
            model.BenGongSiGuanXi = this.txtBenGongSiGuanXi.Text.ToString();
            model.JieShaoRen = this.txtJieShaoRen.Text.ToString();
            model.BaoZhengRen = this.txtBaoZhengRen.Text.ToString();
            model.ShuiPiaoName = this.txtShuiPiaoName.Text.ToString();
            model.DiZhiDianHua = this.txtDiZhiDianHua.Text.ToString();
            model.NaShuiDengJiHao = this.txtNaShuiDengJiHao.Text.ToString();
            model.KaiHuHangZhangHao = this.txtKaiHuHangZhangHao.Text.ToString();
            model.JiaoYiFangShi = this.txtJiaoYiFangShi.Text.ToString();
            model.ZhangQi = this.txtZhangQi.Text.ToString();
            model.FuKuanFangShi = this.txtFuKuanFangShi.Text.ToString();
            model.YunFeiChengDan = this.txtYunFeiChengDan.Text.ToString();
            model.CuXiaoFei = this.txtCuXiaoFei.Text.ToString();
            model.GuangGaoFei = this.txtGuangGaoFei.Text.ToString();
            model.YouDaiZheKou = this.txtYouDaiZheKou.Text.ToString();
            model.FuKuanTaiDu = this.txtFuKuanTaiDu.Text.ToString();
            model.ShiFouDuiZhang = this.txtShiFouDuiZhang.Text.ToString();
            model.DuiZhangShiJian = this.txtDuiZhangShiJian.Text.ToString();
            model.ZuiJiaPaiFangShiJian = this.txtZuiJiaPaiFangShiJian.Text.ToString();
            model.ZuiJiaShouKuanShiJian = this.txtZuiJiaShouKuanShiJian.Text.ToString();
            model.QiTaGongYing = this.txtQiTaGongYing.Text.ToString();
            model.ChangYongNaJia = this.txtChangYongNaJia.Text.ToString();
            model.GongSiYiJian = this.txtGongSiYiJian.Text.ToString();
            model.ZiXin = this.txtZiXin.Text.ToString();
            model.ZongJieLun = this.txtZongJieLun.Text.ToString();

            model.Add();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户添加客户信息(" + this.txtCustomName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            FTD.Unit.MessageBox.ShowAndRedirect(this, "客户信息添加成功！", "MyCustom.aspx");
        }
        else
        {
            FTD.Unit.MessageBox.Show(this, "该客户名称已经存在，请查证后再输入！");
        }
    }
}}