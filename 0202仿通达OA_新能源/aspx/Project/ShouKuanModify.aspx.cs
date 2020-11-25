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

namespace OA.aspx.Project{ 
 public partial class ShouKuanModify: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPShouKuan model = new FTD.BLL.ERPShouKuan();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));            
            this.txtProjectName.Text = model.ProjectName;
            this.txtProjectSerils.Text = model.ProjectSerils;
            this.txtJieDuanName.Text = model.JieDuanName;
            this.txtShouKuanE.Text = model.ShouKuanE;
            this.txtFaPiaoHao.Text = model.FaPiaoHao;
            this.txtShouKuanDate.Text = model.ShouKuanDate;
            this.txtDaoKuanDate.Text = model.DaoKuanDate;
            this.txtShengYuE.Text = model.ShengYuE;
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPShouKuan model = new FTD.BLL.ERPShouKuan();
        model.ID = int.Parse(Request.QueryString["ID"].ToString());
        model.ProjectName = this.txtProjectName.Text;
        model.ProjectSerils = this.txtProjectSerils.Text;
        model.JieDuanName = this.txtJieDuanName.Text;
        model.ShouKuanE = this.txtShouKuanE.Text;
        model.FaPiaoHao = this.txtFaPiaoHao.Text;
        model.ShouKuanDate = this.txtShouKuanDate.Text;
        model.DaoKuanDate = this.txtDaoKuanDate.Text;
        model.ShengYuE = this.txtShengYuE.Text;
        model.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        model.TimeStr = DateTime.Now;
        model.Update();

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改收款信息(" + this.txtProjectName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
        FTD.Unit.MessageBox.ShowAndRedirect(this, "收款信息修改成功！", "ShouKuan.aspx?ProjectName=" + Request.QueryString["ProjectName"].ToString());
    }
}}