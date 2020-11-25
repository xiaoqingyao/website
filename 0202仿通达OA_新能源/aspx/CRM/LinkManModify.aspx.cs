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
 public partial class LinkManModify: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPLinkMan model = new FTD.BLL.ERPLinkMan();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));            
            this.txtCustomName.Text = model.CustomName;
            this.txtNameStr.Text = model.NameStr;
            this.txtSex.Text = model.Sex;
            this.txtBirthDay.Text = model.BirthDay;
            this.txtSuoChuJiaoSe.Text = model.SuoChuJiaoSe;
            this.txtZhiWu.Text = model.ZhiWu;
            this.txtPeiOu.Text = model.PeiOu;
            this.txtZiNv.Text = model.ZiNv;
            this.txtDanWieDianHua.Text = model.DanWieDianHua;
            this.txtDanWeiChuanZhen.Text = model.DanWeiChuanZhen;
            this.txtJiaTingZhuZhi.Text = model.JiaTingZhuZhi;
            this.txtJiaTingYouBian.Text = model.JiaTingYouBian;
            this.txtJiaTingDianHua.Text = model.JiaTingDianHua;
            this.txtShouJi.Text = model.ShouJi;
            this.txtXiaoLingTong.Text = model.XiaoLingTong;
            this.txtEmail.Text = model.Email;
            this.txtQQ.Text = model.QQ;
            this.txtMsn.Text = model.Msn;
            this.txtBackInfo.Text = model.BackInfo;
            this.Label1.Text = model.UserName;
            this.Label2.Text = model.TimeStr.ToString();
            this.txtIFShare.Text = model.IFShare;
            this.txtCusBakA.Text = model.CusBakA;
            this.txtCusBakB.Text = model.CusBakB;
            this.txtCusBakC.Text = model.CusBakC;
            this.txtCusBakD.Text = model.CusBakD;
            this.txtCusBakE.Text = model.CusBakE;
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPLinkMan model = new FTD.BLL.ERPLinkMan();
        model.ID=int.Parse(Request.QueryString["ID"].ToString());
        model.CustomName = this.txtCustomName.Text;
        model.NameStr = this.txtNameStr.Text;
        model.Sex = this.txtSex.Text;
        model.BirthDay = this.txtBirthDay.Text;
        model.SuoChuJiaoSe = this.txtSuoChuJiaoSe.Text;
        model.ZhiWu = this.txtZhiWu.Text;
        model.PeiOu = this.txtPeiOu.Text;
        model.ZiNv = this.txtZiNv.Text;
        model.DanWieDianHua = this.txtDanWieDianHua.Text;
        model.DanWeiChuanZhen = this.txtDanWeiChuanZhen.Text;
        model.JiaTingZhuZhi = this.txtJiaTingZhuZhi.Text;
        model.JiaTingYouBian = this.txtJiaTingYouBian.Text;
        model.JiaTingDianHua = this.txtJiaTingDianHua.Text;
        model.ShouJi = this.txtShouJi.Text;
        model.XiaoLingTong = this.txtXiaoLingTong.Text;
        model.Email = this.txtEmail.Text;
        model.QQ = this.txtQQ.Text;
        model.Msn = this.txtMsn.Text;
        model.BackInfo = this.txtBackInfo.Text;
        model.UserName = this.Label1.Text;
        model.TimeStr =DateTime.Parse(this.Label2.Text);
        model.IFShare = this.txtIFShare.Text;
        model.CusBakA = this.txtCusBakA.Text;
        model.CusBakB = this.txtCusBakB.Text;
        model.CusBakC = this.txtCusBakC.Text;
        model.CusBakD = this.txtCusBakD.Text;
        model.CusBakE = this.txtCusBakE.Text;
        model.Update();

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改联系人信息(" + this.txtCustomName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "联系人信息修改成功！", "MyCustomLinkMan.aspx?CustomName=" + Request.QueryString["CustomName"].ToString());
    }
}}