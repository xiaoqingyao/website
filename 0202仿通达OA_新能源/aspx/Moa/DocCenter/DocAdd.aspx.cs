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

namespace OA.aspx.Moa.DocCenter{ 
 public partial class DocAdd: System.Web.UI.Page
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
        string FileNameStr = FTD.Unit.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (FileNameStr.Trim().Length > 0)
        {
            FTD.BLL.ERPFileList MyModel = new FTD.BLL.ERPFileList();
            MyModel.FileName = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
            MyModel.BianHao = this.TextBox1.Text;
            MyModel.BackInfo = this.TxtContent.Text;
            MyModel.DaXiao = (this.FileUpload1.PostedFile.ContentLength / 1024)+1;
            try
            {
                MyModel.FileType = this.FileUpload1.FileName.Remove(0, this.FileUpload1.FileName.LastIndexOf('.') + 1);
            }
            catch
            { }
            MyModel.DirID = int.Parse(Request.QueryString["DirID"].ToString());
            MyModel.ShangChuanTime = DateTime.Now;
            MyModel.FilePath = FileNameStr;
            MyModel.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyModel.IFDel = "否";
            MyModel.TypeName = Request.QueryString["Type"].ToString();
            MyModel.IfShare = "否";
            MyModel.DirOrFile =0;

            MyModel.CanView = txtCanView.Text;
            MyModel.CanAdd = txtCanAdd.Text;
            MyModel.CanMod = txtCanMod.Text;
            MyModel.CanDel = txtCanDel.Text;

            MyModel.Add();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户添加文件信息(" + System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName) + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            FTD.Unit.MessageBox.ShowAndRedirect(this, "文件添加成功！", "DocCenter.aspx?Type=" + Request.QueryString["Type"].ToString() + "&DirID=" + Request.QueryString["DirID"].ToString());
        }
    }
}}