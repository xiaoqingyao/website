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
 public partial class NeedModify: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPCustomNeed model = new FTD.BLL.ERPCustomNeed();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));            
            this.txtCustomName.Text = model.CustomName;
            this.txtNeedContent.Text = model.NeedContent;
            this.txtNeedNow.Text = model.NeedNow;
            this.txtNeedProduct.Text = model.NeedProduct;
            this.txtNeedTime.Text = model.NeedTime;
            this.txtNeedLike.Text = model.NeedLike;
            this.txtJingZhengDuiShou.Text = model.JingZhengDuiShou;
            this.txtHeZuoYiYuan.Text = model.HeZuoYiYuan;
            this.txtHeZuoJiLv.Text = model.HeZuoJiLv;
            this.txtNeedZhangAi.Text = model.NeedZhangAi;
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
        FTD.BLL.ERPCustomNeed model = new FTD.BLL.ERPCustomNeed();
        model.ID = int.Parse(Request.QueryString["ID"].ToString());
        model.CustomName = this.txtCustomName.Text;
        model.NeedContent = this.txtNeedContent.Text;
        model.NeedNow = this.txtNeedNow.Text;
        model.NeedProduct = this.txtNeedProduct.Text;
        model.NeedTime = this.txtNeedTime.Text;
        model.NeedLike = this.txtNeedLike.Text;
        model.JingZhengDuiShou = this.txtJingZhengDuiShou.Text;
        model.HeZuoYiYuan = this.txtHeZuoYiYuan.Text;
        model.HeZuoJiLv = this.txtHeZuoJiLv.Text;
        model.NeedZhangAi = this.txtNeedZhangAi.Text;
        model.BackInfo = this.txtBackInfo.Text;
        model.UserName = this.Label1.Text;
        model.TimeStr = DateTime.Parse(this.Label2.Text);
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
        MyRiZhi.DoSomething = "用户修改需求信息(" + this.txtCustomName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "需求信息修改成功！", "MyCustomNeed.aspx?CustomName=" + Request.QueryString["CustomName"].ToString());
    }
}}