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
 public partial class DirModify: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();

            FTD.BLL.ERPFileList MyModel = new FTD.BLL.ERPFileList();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));           
            this.TextBox1.Text = MyModel.FileName;
            this.TextBox2.Text = MyModel.BianHao;
            this.RadioButtonList1.SelectedValue = MyModel.IfShare;

            txtCanView.Text = MyModel.CanView;
            txtCanAdd.Text = MyModel.CanAdd;
            txtCanMod.Text = MyModel.CanMod;
            txtCanDel.Text = MyModel.CanDel;
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPFileList MyModel = new FTD.BLL.ERPFileList();
        MyModel.ID = int.Parse(Request.QueryString["ID"].ToString());
        MyModel.FileName = this.TextBox1.Text;
        MyModel.BianHao = this.TextBox2.Text;
        MyModel.BackInfo = "";
        MyModel.DaXiao = 0;
        MyModel.FileType = "dir";
        MyModel.DirID = int.Parse(Request.QueryString["DirID"].ToString());
        MyModel.ShangChuanTime = DateTime.Now;
        MyModel.FilePath = "";
        MyModel.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyModel.IFDel = "否";
        MyModel.TypeName = Request.QueryString["Type"].ToString();
        MyModel.IfShare = this.RadioButtonList1.SelectedItem.Text;
        MyModel.DirOrFile = 1;

        MyModel.CanView = txtCanView.Text;
        MyModel.CanAdd = txtCanAdd.Text;
        MyModel.CanMod = txtCanMod.Text;
        MyModel.CanDel = txtCanDel.Text;


        MyModel.Update();

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改文件夹信息(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "文件夹修改成功！", "DocCenter.aspx?Type=" + Request.QueryString["Type"].ToString() + "&DirID=" + Request.QueryString["DirID"].ToString());        
    }
}}