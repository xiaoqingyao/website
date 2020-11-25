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
 public partial class BaoXiaoAdd: System.Web.UI.Page
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
        FTD.BLL.ERPBaoXiao model = new FTD.BLL.ERPBaoXiao();
        model.ProjectName = this.txtProjectName.Text;
        model.FeiYongType = this.txtFeiYongType.Text;
        model.ShenQingRen = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        model.ShenPiRen = this.txtShenPiRen.Text;
        model.ShenQingContent = this.txtShenQingContent.Text;
        model.JinE = this.txtJinE.Text;
        model.StateNow = "待批";
        model.Username = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        model.ShenQingTime = DateTime.Now; ;        
        model.Add();

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加报销申请(" + this.txtProjectName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
        FTD.Unit.MessageBox.ShowAndRedirect(this, "报销申请添加成功！", "BaoXiaoShenQing.aspx?ProjectName=" + Request.QueryString["ProjectName"].ToString());
    }
}}