﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class SystemManage_RedHeadModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            //绑定页面数据
            ZWL.BLL.ERPRedHead MyModel = new ZWL.BLL.ERPRedHead();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label1.Text = MyModel.FilePath;
            this.TextBox1.Text = MyModel.FileName;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string FileNameStr = ZWL.Common.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (FileNameStr.Trim().Length > 0)
        {
            ZWL.BLL.ERPRedHead MyModel = new ZWL.BLL.ERPRedHead();
            MyModel.ID = int.Parse(Request.QueryString["ID"].ToString());
            MyModel.FilePath = FileNameStr;
            MyModel.FileName = this.TextBox1.Text;
            MyModel.TimeStr = DateTime.Now;
            MyModel.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyModel.Update();

            //写系统日志
            ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
            MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户修改红头文件(" + this.TextBox1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            ZWL.Common.MessageBox.ShowAndRedirect(this, "红头文件修改成功！", "RedHeadFile.aspx");
        }
        else if (FileUpload1.PostedFile.FileName.Trim().Length <= 0)
        {
            ZWL.BLL.ERPRedHead MyModel = new ZWL.BLL.ERPRedHead();
            MyModel.ID = int.Parse(Request.QueryString["ID"].ToString());
            MyModel.FilePath =this.Label1.Text;
            MyModel.FileName = this.TextBox1.Text;
            MyModel.TimeStr = DateTime.Now;
            MyModel.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyModel.Update();

            //写系统日志
            ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
            MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户修改红头文件(" + this.TextBox1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            ZWL.Common.MessageBox.ShowAndRedirect(this, "红头文件修改成功！", "RedHeadFile.aspx");
        }
    }
}