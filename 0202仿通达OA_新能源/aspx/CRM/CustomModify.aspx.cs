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
 public partial class CustomModify: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPCustomInfo model = new FTD.BLL.ERPCustomInfo();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.txtCustomName.Text = model.CustomName;
            this.txtCustomSerils.Text = model.CustomSerils;
            this.txtChargeMan.Text = model.ChargeMan;
            this.txtAddress.Text = model.Address;
            this.txtUrlLink.Text = model.UrlLink;
            this.txtYouBian.Text = model.YouBian;
            this.txtTelStr.Text = model.TelStr;
            this.txtXingZhi.Text = model.XingZhi;
            this.txtLaiYuan.Text = model.LaiYuan;
            this.txtQuYu.Text = model.QuYu;
            this.txtZhuangTai.Text = model.ZhuangTai;
            this.txtRenShu.Text = model.RenShu;
            this.txtBanGongMianJi.Text = model.BanGongMianJi;
            this.txtLeiBie.Text = model.LeiBie;
            this.txtJiBie.Text = model.JiBie;
            this.txtYeWuFanWei.Text = model.YeWuFanWei;
            this.txtHangYe.Text = model.HangYe;
            this.txtMuQianWenTi.Text = model.MuQianWenTi;
            this.txtYuJiDingDanDate.Text = model.YuJiDingDanDate;
            this.txtBackInfoA.Text = model.BackInfoA;
            this.txtBackInfoB.Text = model.BackInfoB;
            this.txtBackInfoC.Text = model.BackInfoC;
            this.txtBackInfoD.Text = model.BackInfoD;
            this.Label1.Text = model.UserName;
            this.Label2.Text = model.TimeStr.ToString();
            this.txtDingDanCount.Text = model.DingDanCount;
            this.txtYuJiTiXing.Text = model.YuJiTiXing;
            this.txtIFShare.Text = model.IFShare;
            this.txtCusBakA.Text = model.CusBakA;
            this.txtCusBakB.Text = model.CusBakB;
            this.txtCusBakC.Text = model.CusBakC;
            this.txtCusBakD.Text = model.CusBakD;
            this.txtCusBakE.Text = model.CusBakE;

            this.txtNameEng.Text = model.NameEng.ToString();
            this.txtFaRenDaiMa.Text = model.FaRenDaiMa.ToString();
            this.txtYingYeZhiZhao.Text = model.YingYeZhiZhao.ToString();
            this.txtZiBenE.Text = model.ZiBenE.ToString();
            this.txtZuZhiXingZhi.Text = model.ZuZhiXingZhi.ToString();
            this.txtYingYeChangSuo.Text = model.YingYeChangSuo.ToString();
            this.txtJingJi.Text = model.JingJi.ToString();
            this.txtSheHuiGuanXi.Text = model.SheHuiGuanXi.ToString();
            this.txtBenGongSiGuanXi.Text = model.BenGongSiGuanXi.ToString();
            this.txtJieShaoRen.Text = model.JieShaoRen.ToString();
            this.txtBaoZhengRen.Text = model.BaoZhengRen.ToString();
            this.txtShuiPiaoName.Text = model.ShuiPiaoName.ToString();
            this.txtDiZhiDianHua.Text = model.DiZhiDianHua.ToString();
            this.txtNaShuiDengJiHao.Text = model.NaShuiDengJiHao.ToString();
            this.txtKaiHuHangZhangHao.Text = model.KaiHuHangZhangHao.ToString();
            this.txtJiaoYiFangShi.Text = model.JiaoYiFangShi.ToString();
            this.txtZhangQi.Text = model.ZhangQi.ToString();
            this.txtFuKuanFangShi.Text = model.FuKuanFangShi.ToString();
            this.txtYunFeiChengDan.Text = model.YunFeiChengDan.ToString();
            this.txtCuXiaoFei.Text = model.CuXiaoFei.ToString();
            this.txtGuangGaoFei.Text = model.GuangGaoFei.ToString();
            this.txtYouDaiZheKou.Text = model.YouDaiZheKou.ToString();
            this.txtFuKuanTaiDu.Text = model.FuKuanTaiDu.ToString();
            this.txtShiFouDuiZhang.Text = model.ShiFouDuiZhang.ToString();
            this.txtDuiZhangShiJian.Text = model.DuiZhangShiJian.ToString();
            this.txtZuiJiaPaiFangShiJian.Text = model.ZuiJiaPaiFangShiJian.ToString();
            this.txtZuiJiaShouKuanShiJian.Text = model.ZuiJiaShouKuanShiJian.ToString();
            this.txtQiTaGongYing.Text = model.QiTaGongYing.ToString();
            this.txtChangYongNaJia.Text = model.ChangYongNaJia.ToString();
            this.txtGongSiYiJian.Text = model.GongSiYiJian.ToString();
            this.txtZiXin.Text = model.ZiXin.ToString();
            this.txtZongJieLun.Text = model.ZongJieLun.ToString();
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        if (FTD.Unit.PublicMethod.IFExists("CustomName", "ERPCustomInfo", int.Parse(Request.QueryString["ID"].ToString()), this.txtCustomName.Text) == true)
        {
            FTD.BLL.ERPCustomInfo model = new FTD.BLL.ERPCustomInfo();
            model.ID = int.Parse(Request.QueryString["ID"].ToString());
            model.CustomName = this.txtCustomName.Text;
            model.CustomSerils = this.txtCustomSerils.Text;
            model.ChargeMan = this.txtChargeMan.Text;
            model.Address = this.txtAddress.Text;
            model.UrlLink = this.txtUrlLink.Text;
            model.YouBian = this.txtYouBian.Text;
            model.TelStr = this.txtTelStr.Text;
            model.XingZhi = this.txtXingZhi.Text;
            model.LaiYuan = this.txtLaiYuan.Text;
            model.QuYu = this.txtQuYu.Text;
            model.ZhuangTai = this.txtZhuangTai.Text;
            model.RenShu = this.txtRenShu.Text;
            model.BanGongMianJi = this.txtBanGongMianJi.Text;
            model.LeiBie = this.txtLeiBie.Text;
            model.JiBie = this.txtJiBie.Text;
            model.YeWuFanWei = this.txtYeWuFanWei.Text;
            model.HangYe = this.txtHangYe.Text;
            model.MuQianWenTi = this.txtMuQianWenTi.Text;
            model.YuJiDingDanDate = this.txtYuJiDingDanDate.Text;
            model.BackInfoA = this.txtBackInfoA.Text;
            model.BackInfoB = this.txtBackInfoB.Text;
            model.BackInfoC = this.txtBackInfoC.Text;
            model.BackInfoD = this.txtBackInfoD.Text;
            model.TimeStr =DateTime.Parse(this.Label2.Text);
            model.UserName = this.Label1.Text;

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

            model.Update();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户修改客户信息(" + this.txtCustomName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            FTD.Unit.MessageBox.ShowAndRedirect(this, "客户信息修改成功！", "MyCustom.aspx");
        }
        else
        {
            FTD.Unit.MessageBox.Show(this, "该客户名称已经存在，请查证后再输入！");
        }
    }
}}