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

public partial class Project_ProjectView : System.Web.UI.Page
{
    public string CustomNameStr = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPProject model = new ZWL.BLL.ERPProject();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.lblProjectName.Text = model.ProjectName;
            CustomNameStr = model.ProjectName;
            this.HyperLink1.NavigateUrl = "TuXingJinDu.aspx?ProjectName=" + model.ProjectName;
            this.lblProjectSerils.Text = model.ProjectSerils;
            this.lblSuoShuKeHu.Text = model.SuoShuKeHu;
            this.lblYuJiChengJiaoRiQi.Text = model.YuJiChengJiaoRiQi;
            this.lblTiXingDate.Text = model.TiXingDate;
            this.lblFuZeRen.Text = model.FuZeRen;
            this.lblXiangMuJinE.Text = model.XiangMuJinE;
            this.lblXiangMuYuSuan.Text = model.XiangMuYuSuan;
            this.lblXiangMuDaXiao.Text = model.XiangMuDaXiao;
            this.lblPeiHeRenList.Text = model.PeiHeRenList;
            this.lblUserName.Text = model.UserName;
            this.lblTimeStr.Text = model.TimeStr.ToString();
            this.lblHeTongAndFuJian.Text = ZWL.Common.PublicMethod.GetWenJian(model.HeTongAndFuJian, "../UploadFile/"); 
            this.lblBackInfo.Text = model.BackInfo;

            //写系统日志
            ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
            MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "查看项目信息(" + this.lblProjectName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();
        }
    }
    public void btnDownloadFile_Click(object sender, EventArgs e)
    {
        try
        {
            ZWL.Common.PublicMethod.DownloadFile(Server.MapPath("~"), this.hdnFileURL.Value.Trim());
        }
        catch
        {
        }
    }
}
