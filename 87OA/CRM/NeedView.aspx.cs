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

public partial class CRM_NeedView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPCustomNeed model = new ZWL.BLL.ERPCustomNeed();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));            
            this.lblCustomName.Text = model.CustomName;
            this.lblNeedContent.Text = model.NeedContent;
            this.lblNeedNow.Text = model.NeedNow;
            this.lblNeedProduct.Text = model.NeedProduct;
            this.lblNeedTime.Text = model.NeedTime;
            this.lblNeedLike.Text = model.NeedLike;
            this.lblJingZhengDuiShou.Text = model.JingZhengDuiShou;
            this.lblHeZuoYiYuan.Text = model.HeZuoYiYuan;
            this.lblHeZuoJiLv.Text = model.HeZuoJiLv;
            this.lblNeedZhangAi.Text = model.NeedZhangAi;
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
            MyRiZhi.DoSomething = "用户查看客户需求信息(" + this.lblCustomName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();
        }
    }
}
