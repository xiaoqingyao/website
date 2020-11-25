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

public partial class DocCenter_DocView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();

            ZWL.BLL.ERPFileList MyModel = new ZWL.BLL.ERPFileList();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label8.Text = MyModel.FileName;
            //this.HyperLink1.Text = MyModel.FileName;
            //this.HyperLink1.NavigateUrl = "../UploadFile/" + MyModel.FilePath;
            this.Label7.Text = ZWL.Common.PublicMethod.GetWenJian(MyModel.FilePath, "../UploadFile/");

            this.Label1.Text = MyModel.BianHao;
            this.Label6.Text = MyModel.BackInfo;

            this.Label2.Text = MyModel.DaXiao.ToString();
            this.Label3.Text = MyModel.ShangChuanTime.ToString();
            this.Label4.Text = MyModel.UserName;
            this.Label5.Text = MyModel.FileType;

            this.Label9.Text = MyModel.CanView;
            this.Label10.Text = MyModel.CanAdd;
            this.Label11.Text = MyModel.CanMod;
            this.Label12.Text = MyModel.CanDel;

            
            //写系统日志
            ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
            MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "查看文件信息(" + this.Label8.Text + ")";
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
