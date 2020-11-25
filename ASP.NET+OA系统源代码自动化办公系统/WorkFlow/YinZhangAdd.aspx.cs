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

public partial class WorkFlow_YinZhangAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //判断名称是否唯一性
        if (SDLX.Common.PublicMethod.IFExists("YinZhangName", "ERPYinZhang", 0, this.TextBox1.Text) == false)
        {
            SDLX.Common.MessageBox.Show(this, "该印章名称已经存在！");
            return;
        }
        string FileNameStr = SDLX.Common.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (FileNameStr.Trim().Length > 0)
        {
            SDLX.BLL.ERPYinZhang MyModel = new SDLX.BLL.ERPYinZhang();
            MyModel.ImgPath = FileNameStr;
            MyModel.TimeStr = DateTime.Now;
            MyModel.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            MyModel.YinZhangLeiBie = Request.QueryString["Type"].ToString();
            MyModel.YinZhangMiMa = this.TextBox2.Text;
            MyModel.YinZhangName = this.TextBox1.Text;
            MyModel.Add();

            //写系统日志
            SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
            MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户添加印章信息(" + this.TextBox1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            SDLX.Common.MessageBox.ShowAndRedirect(this, "印章信息添加成功！", "PublicSeal.aspx?Type=" + Request.QueryString["Type"].ToString());
        }
    }
}