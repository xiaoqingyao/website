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

namespace OA.aspx.WorkFlow{ 
 public partial class YinZhangModify: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();

            FTD.BLL.ERPYinZhang MyModel = new FTD.BLL.ERPYinZhang();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.HyperLink1.Text = MyModel.ImgPath;
            this.HyperLink1.NavigateUrl = "../../UploadFile/" + MyModel.ImgPath;

            this.TextBox1.Text = MyModel.YinZhangName;
            this.TextBox2.Text= MyModel.YinZhangMiMa;            
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        //判断名称是否唯一性
        if (FTD.Unit.PublicMethod.IFExists("YinZhangName", "ERPYinZhang", int.Parse(Request.QueryString["ID"].ToString()), this.TextBox1.Text) == false)
        {
            FTD.Unit.MessageBox.Show(this, "该印章名称已经存在！");
            return;
        }

        if (this.FileUpload1.FileName.Trim().Length > 0)
        {
            string FileNameStr = FTD.Unit.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
            if (FileNameStr.Trim().Length > 0)
            {
                FTD.BLL.ERPYinZhang MyModel = new FTD.BLL.ERPYinZhang();
                MyModel.ID = int.Parse(Request.QueryString["ID"].ToString());
                MyModel.ImgPath = FileNameStr;
                MyModel.TimeStr = DateTime.Now;
                MyModel.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
                MyModel.YinZhangLeiBie = Request.QueryString["Type"].ToString();
                MyModel.YinZhangMiMa = this.TextBox2.Text;
                MyModel.YinZhangName = this.TextBox1.Text;
                MyModel.Update();

                //写系统日志
                FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
                MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
                MyRiZhi.DoSomething = "用户修改印章信息(" + this.TextBox1.Text + ")";
                MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
                MyRiZhi.Add();

                FTD.Unit.MessageBox.ShowAndRedirect(this, "印章信息修改成功！", "PublicSeal.aspx?Type=" + Request.QueryString["Type"].ToString());
            }
        }
        else
        {
            FTD.BLL.ERPYinZhang MyModel = new FTD.BLL.ERPYinZhang();
            MyModel.ID = int.Parse(Request.QueryString["ID"].ToString());
            MyModel.ImgPath =this.HyperLink1.Text;
            MyModel.TimeStr = DateTime.Now;
            MyModel.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyModel.YinZhangLeiBie = Request.QueryString["Type"].ToString();
            MyModel.YinZhangMiMa = this.TextBox2.Text;
            MyModel.YinZhangName = this.TextBox1.Text;
            MyModel.Update();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户修改印章信息(" + this.TextBox1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            FTD.Unit.MessageBox.ShowAndRedirect(this, "印章信息修改成功！", "PublicSeal.aspx?Type=" + Request.QueryString["Type"].ToString());
        }
    }
}}