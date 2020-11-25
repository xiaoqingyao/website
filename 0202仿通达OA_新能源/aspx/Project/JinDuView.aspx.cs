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
 public partial class JinDuView: System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPJinDu model = new FTD.BLL.ERPJinDu();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.lblProjectName.Text = model.ProjectName;
            this.lblProjectSerils.Text = model.ProjectSerils;
            this.lblJieDuanName.Text = model.JieDuanName;
            this.lblStartTime.Text = model.StartTime.ToString();
            this.lblEndTime.Text = model.EndTime.ToString();
            this.lblWanChengDu.Text = model.WanChengDu;
            this.lblFuZeRen.Text = model.FuZeRen;
            this.lblContentStr.Text = model.ContentStr;            
            this.lblUserName.Text = model.UserName;
            this.lblTimeStr.Text = model.TimeStr.ToString();
            this.lblFuJianList.Text = FTD.Unit.PublicMethod.GetWenJian(model.FuJianList, "../../UploadFile/");
            

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "查看项目进度信息(" + this.lblProjectName.Text + ")";
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