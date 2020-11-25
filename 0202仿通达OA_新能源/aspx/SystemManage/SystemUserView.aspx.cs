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

namespace OA.aspx.SystemManage{ 
 public partial class SystemUserView: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //RenShiInfo.aspx   TypeStr=RS
            FTD.Unit.PublicMethod.CheckSession();
            //绑定页面数据
            FTD.BLL.ERPUser MyBuMen = new FTD.BLL.ERPUser();
            MyBuMen.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label1.Text = MyBuMen.UserName;

            this.HyperLink1.NavigateUrl = "../LanEmail/LanEmailAdd.aspx?UserName=" + MyBuMen.UserName;
            //this.Label2.Text = FTD.Unit.DEncrypt.DESEncrypt.Decrypt(MyBuMen.UserPwd);
            this.Label2.Text = "******";
            this.Label3.Text = MyBuMen.TrueName;
            this.Label4.Text = MyBuMen.Serils;
            this.Label5.Text = MyBuMen.Department;
            this.Label6.Text = MyBuMen.JiaoSe;
            this.Label7.Text = MyBuMen.ZhiWei;
            this.Label8.Text = MyBuMen.ZaiGang;
            this.Label9.Text = MyBuMen.EmailStr;
            this.Label10.Text = MyBuMen.IfLogin;
            this.Label11.Text = MyBuMen.Sex;
            this.Label12.Text = MyBuMen.BackInfo;
            this.Label13.Text = MyBuMen.BirthDay;
            this.Label14.Text = MyBuMen.MingZu;
            this.Label15.Text = MyBuMen.SFZSerils;
            this.Label16.Text = MyBuMen.HunYing;
            this.Label17.Text = MyBuMen.ZhengZhiMianMao;
            this.Label18.Text = MyBuMen.JiGuan;
            this.Label19.Text = MyBuMen.HuKou;
            this.Label20.Text = MyBuMen.XueLi;
            this.Label21.Text = MyBuMen.ZhiCheng;
            this.Label22.Text = MyBuMen.BiYeYuanXiao;
            this.Label23.Text = MyBuMen.ZhuanYe;
            this.Label24.Text = MyBuMen.CanJiaGongZuoTime;
            this.Label25.Text = MyBuMen.JiaRuBenDanWeiTime;
            this.Label26.Text = MyBuMen.JiaTingDianHua;
            this.Label27.Text = MyBuMen.JiaTingAddress;
            this.Label28.Text = MyBuMen.GangWeiBianDong;
            this.Label29.Text = MyBuMen.JiaoYueBeiJing;
            this.Label30.Text = MyBuMen.GongZuoJianLi;
            this.Label31.Text = MyBuMen.SheHuiGuanXi;
            this.Label32.Text = MyBuMen.JiangChengJiLu;
            this.Label33.Text = MyBuMen.ZhiWuQingKuang;
            this.Label34.Text = MyBuMen.PeiXunJiLu;
            this.Label35.Text = MyBuMen.DanBaoJiLu;
            this.Label36.Text = MyBuMen.NaoDongHeTong;
            this.Label37.Text = MyBuMen.SheBaoJiaoNa;
            this.Label38.Text = MyBuMen.TiJianJiLu;
            this.Label39.Text = MyBuMen.BeiZhuStr;
            this.Label40.Text = FTD.Unit.PublicMethod.GetWenJian(MyBuMen.FuJian, "../../UploadFile/");

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "查看用户信息(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();
        }
    }

    public void btnDownloadFile_Click(object sender, EventArgs e)
    {
        try
        {
            FTD.Unit.PublicMethod.DownloadFile(Server.MapPath("~"), this.hdnFileURL.Value.Trim());
        }
        catch
        {
        }
    }
}}