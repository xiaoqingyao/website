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

public partial class Project_ShiShiModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPShiShi model = new ZWL.BLL.ERPShiShi();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.txtProjectName.Text = model.ProjectName;
            this.txtProjectSerils.Text = model.ProjectSerils;
            this.txtShiShiTime.Text = model.ShiShiTime;
            this.txtShiShiRen.Text = model.ShiShiRen;
            this.txtShiShiContent.Text = model.ShiShiContent;
            this.txtWanGongLiang.Text = model.WanGongLiang;
            this.txtPingJia.Text = model.PingJia;
            this.txtXiaoJie.Text = model.XiaoJie;
            this.txtWenTi.Text = model.WenTi;
            this.txtYuJiJieJueRiQi.Text = model.YuJiJieJueRiQi;
            this.txtWenTiJieDa.Text = model.WenTiJieDa;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPShiShi model = new ZWL.BLL.ERPShiShi();
        model.ID = int.Parse(Request.QueryString["ID"].ToString());
        model.ProjectName = this.txtProjectName.Text;
        model.ProjectSerils = this.txtProjectSerils.Text;
        model.ShiShiTime = this.txtShiShiTime.Text;
        model.ShiShiRen = this.txtShiShiRen.Text;
        model.ShiShiContent = this.txtShiShiContent.Text;
        model.WanGongLiang = this.txtWanGongLiang.Text;
        model.PingJia = this.txtPingJia.Text;
        model.XiaoJie = this.txtXiaoJie.Text;
        model.WenTi = this.txtWenTi.Text;
        model.YuJiJieJueRiQi = this.txtYuJiJieJueRiQi.Text;
        model.WenTiJieDa = this.txtWenTiJieDa.Text;
        model.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        model.TimeStr = DateTime.Now;
        model.Update();

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改实施信息(" + this.txtProjectName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
        ZWL.Common.MessageBox.ShowAndRedirect(this, "实施日志信息修改成功！", "ShiShiRiZhi.aspx?ProjectName=" + Request.QueryString["ProjectName"].ToString());
    }
}