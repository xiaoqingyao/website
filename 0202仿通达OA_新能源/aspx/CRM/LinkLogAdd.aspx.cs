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
 public partial class LinkLogAdd: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            this.txtCustomName.Text = Request.QueryString["CustomName"].ToString();
            try
            {                
                FTD.BLL.ERPAnPai Model = new FTD.BLL.ERPAnPai();
                Model.GetModel(int.Parse(Request.QueryString["RiChengID"].ToString()));
                this.txtLinkTitle.Text = Model.TitleStr;                
                this.txtLinkType.Text = Model.TypeStr;
                this.txtLinkTime.Text = Model.TimeStart.ToString();
            }
            catch
            { }
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPLinkLog model = new FTD.BLL.ERPLinkLog();
        model.CustomName = this.txtCustomName.Text;
        model.LinkTitle = this.txtLinkTitle.Text;
        model.LinkType = this.txtLinkType.Text;
        model.LinkResult = this.txtLinkResult.Text;
        model.LinkTime = this.txtLinkTime.Text;
        model.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        model.TimeStr = DateTime.Now;
        model.IFShare = this.txtIFShare.Text;
        model.CusBakA = this.txtCusBakA.Text;
        model.CusBakB = this.txtCusBakB.Text;
        model.CusBakC = this.txtCusBakC.Text;
        model.CusBakD = this.txtCusBakD.Text;
        model.CusBakE = this.txtCusBakE.Text;

        model.Add();

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加联系记录(" + this.txtCustomName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "联系记录信息添加成功！", "MyCustomLinkLog.aspx?CustomName=" + Request.QueryString["CustomName"].ToString());
    }
}}