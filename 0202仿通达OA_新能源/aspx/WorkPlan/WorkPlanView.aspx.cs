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

namespace OA.aspx.WorkPlan{ 
 public partial class WorkPlanView: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            //绑定页面数据
            FTD.BLL.ERPWorkPlan MyModel = new FTD.BLL.ERPWorkPlan();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label1.Text = MyModel.TitleStr;
            this.Label2.Text = MyModel.CanLookUser;
            this.Label6.Text = MyModel.ContentStr;
            this.Label4.Text = MyModel.UserName;
            this.Label5.Text = MyModel.TimeStr.ToString();

            this.HyperLink1.NavigateUrl = "../LanEmail/LanEmailAdd.aspx?UserName=" + MyModel.UserName;

            this.Label3.Text = FTD.Unit.PublicMethod.GetWenJian(MyModel.FuJianStr, "../../UploadFile/");

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "查看工作计划信息(" + this.Label1.Text + ")";
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
}
}