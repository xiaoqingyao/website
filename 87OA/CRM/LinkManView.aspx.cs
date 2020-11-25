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

public partial class CRM_LinkManView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPLinkMan model = new ZWL.BLL.ERPLinkMan();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.lblCustomName.Text = model.CustomName;
            this.lblNameStr.Text = model.NameStr;
            this.lblSex.Text = model.Sex;
            this.lblBirthDay.Text = model.BirthDay;
            this.lblSuoChuJiaoSe.Text = model.SuoChuJiaoSe;
            this.lblZhiWu.Text = model.ZhiWu;
            this.lblPeiOu.Text = model.PeiOu;
            this.lblZiNv.Text = model.ZiNv;
            this.lblDanWieDianHua.Text = model.DanWieDianHua;
            this.lblDanWeiChuanZhen.Text = model.DanWeiChuanZhen;
            this.lblJiaTingZhuZhi.Text = model.JiaTingZhuZhi;
            this.lblJiaTingYouBian.Text = model.JiaTingYouBian;
            this.lblJiaTingDianHua.Text = model.JiaTingDianHua;
            this.lblShouJi.Text = model.ShouJi;
            this.lblXiaoLingTong.Text = model.XiaoLingTong;
            this.lblEmail.Text = model.Email;
            this.lblQQ.Text = model.QQ;
            this.lblMsn.Text = model.Msn;
            this.lblBackInfo.Text = model.BackInfo;
            this.lblUserName.Text = model.UserName;
            this.lblTimeStr.Text = model.TimeStr.ToString();
            this.lblIFShare.Text = model.IFShare;
            this.lblCusBakA.Text = model.CusBakA;
            this.lblCusBakB.Text = model.CusBakB;
            this.lblCusBakC.Text = model.CusBakC;
            this.lblCusBakD.Text = model.CusBakD;
            this.lblCusBakE.Text = model.CusBakE;

            //写系统日志
            ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
            MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户查看联系人信息(" + this.lblCustomName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();
        }
    }
}