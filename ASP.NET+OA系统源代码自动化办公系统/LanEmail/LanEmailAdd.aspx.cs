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

public partial class LanEmail_LanEmailAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();
            //设置上传的附件为空
            SDLX.Common.PublicMethod.SetSessionValue("WenJianList", "");

            try
            {
                this.TextBox2.Text = Request.QueryString["UserName"].ToString();
            }
            catch
            { }

            //检测是回复或者转发
            try
            {
                if (Request.QueryString["Type"].ToString().Trim() == "HuiFu")
                {
                    SDLX.BLL.ERPLanEmail MyModel = new SDLX.BLL.ERPLanEmail();
                    MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
                    //设置页面数据
                    this.TextBox1.Text = "Re：" + MyModel.EmailTitle;
                    this.TextBox2.Text = MyModel.FromUser;
                }
            }
            catch
            { }
            //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            try
            {
                if (Request.QueryString["Type"].ToString().Trim() == "ZhuanFa")
                {
                    SDLX.BLL.ERPLanEmail MyModel = new SDLX.BLL.ERPLanEmail();
                    MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
                    //设置页面数据
                    this.TextBox1.Text = "RW：" + MyModel.EmailTitle;
                    this.TxtContent.Value = MyModel.EmailContent;
                    SDLX.Common.PublicMethod.SetSessionValue("WenJianList", MyModel.FuJian);
                    SDLX.Common.PublicMethod.BindDDL(this.CheckBoxList1, SDLX.Common.PublicMethod.GetSessionValue("WenJianList"));
                }
            }
            catch
            { }
        }
    }
    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        SDLX.BLL.ERPLanEmail MyModel = new SDLX.BLL.ERPLanEmail();

        MyModel .EmailTitle = this.TextBox1.Text;
        MyModel.EmailContent = this.TxtContent.Value;
        MyModel.FuJian = SDLX.Common.PublicMethod.GetSessionValue("WenJianList");
        MyModel.FromUser = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        MyModel.EmailState = "未读";
        string[] ToWhoList=this.TextBox2.Text.Trim().Split(',');
        for(int i=0;i<ToWhoList.Length;i++)
        {
            if (ToWhoList[i].Trim().Length > 0)
            {
                MyModel.ToUser = ToWhoList[i].Trim();
                MyModel.Add();
            }
        }

        //写系统日志
        SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
        MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加新邮件(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        SDLX.Common.MessageBox.ShowAndRedirect(this, "内部邮件添加成功！", "LanEmailShou.aspx");
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string FileNameStr = SDLX.Common.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (SDLX.Common.PublicMethod.GetSessionValue("WenJianList").Trim() == "")
        {
            SDLX.Common.PublicMethod.SetSessionValue("WenJianList", FileNameStr);
        }
        else
        {
            SDLX.Common.PublicMethod.SetSessionValue("WenJianList", SDLX.Common.PublicMethod.GetSessionValue("WenJianList") + "|" + FileNameStr);
        }
        SDLX.Common.PublicMethod.BindDDL(this.CheckBoxList1, SDLX.Common.PublicMethod.GetSessionValue("WenJianList"));
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
            {
                if (this.CheckBoxList1.Items[i].Selected == true)
                {
                    SDLX.Common.PublicMethod.SetSessionValue("WenJianList", SDLX.Common.PublicMethod.GetSessionValue("WenJianList").Replace(this.CheckBoxList1.Items[i].Text, "").Replace("||", "|"));
                }
            }
            SDLX.Common.PublicMethod.BindDDL(this.CheckBoxList1, SDLX.Common.PublicMethod.GetSessionValue("WenJianList"));
        }
        catch
        { }
    }
    protected void ImageButton4_Click(object sender, EventArgs e)
    {
        //草稿
        SDLX.BLL.ERPLanEmail MyModel = new SDLX.BLL.ERPLanEmail();

        MyModel.EmailTitle = this.TextBox1.Text;
        MyModel.EmailContent = this.TxtContent.Value;
        MyModel.FuJian = SDLX.Common.PublicMethod.GetSessionValue("WenJianList");
        MyModel.FromUser = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        MyModel.EmailState = "草稿";
        string[] ToWhoList = this.TextBox2.Text.Trim().Split(',');
        for (int i = 0; i < ToWhoList.Length; i++)
        {
            if (ToWhoList[i].Trim().Length > 0)
            {
                MyModel.ToUser = ToWhoList[i].Trim();
                MyModel.Add();
            }
        }

        //写系统日志
        SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
        MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加新邮件(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        SDLX.Common.MessageBox.ShowAndRedirect(this, "内部邮件添加成功！", "LanEmailShou.aspx");
    }
}