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

public partial class DocCenter_DocDirAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {        
        ZWL.BLL.ERPFileList MyModel = new ZWL.BLL.ERPFileList();
        MyModel.FileName = this.TextBox1.Text;
        MyModel.BianHao = this.TextBox2.Text;
        MyModel.BackInfo = "";
        MyModel.DaXiao = 0;
        MyModel.FileType = "dir";
        MyModel.DirID = int.Parse(Request.QueryString["DirID"].ToString());
        MyModel.ShangChuanTime = DateTime.Now;
        MyModel.FilePath = "";
        MyModel.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyModel.IFDel = "否";
        MyModel.TypeName = Request.QueryString["Type"].ToString();
        MyModel.IfShare = this.RadioButtonList1.SelectedItem.Text;
        MyModel.DirOrFile = 1;

        MyModel.CanView = txtCanView.Text;
        MyModel.CanAdd = txtCanAdd.Text;
        MyModel.CanMod = txtCanMod.Text;
        MyModel.CanDel = txtCanDel.Text;

        MyModel.Add();

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加文件夹信息(" + this.TextBox1.Text+ ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "文件夹添加成功！", "DocCenter.aspx?Type=" + Request.QueryString["Type"].ToString() + "&DirID=" + Request.QueryString["DirID"].ToString());        
    }
}