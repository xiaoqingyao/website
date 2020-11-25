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

public partial class TelFile_TelFileAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();
            SDLX.DBUtility.DbHelperSQL.BindDropDownList2("select * from ERPCYDIC where UserName='"+SDLX.Common.PublicMethod.GetSessionValue("UserName")+"'", this.DropDownList1, "DicName", "ID");

            //设置上传的附件为空
            SDLX.Common.PublicMethod.SetSessionValue("WenJianList", "");

            try
            {
                this.TextBox2.Text = Request.QueryString["UserName"].ToString();
            }
            catch
            { }
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        SDLX.BLL.ERPTelFile MyModel = new SDLX.BLL.ERPTelFile();

        MyModel.ChuanYueYiJian = "";
        MyModel.FileType = this.TextBox3.Text;
        MyModel.TimeStr = DateTime.Now;
        MyModel.TitleStr = this.TextBox1.Text;
        MyModel.ContentStr = this.TxtContent.Text;
        MyModel.FuJianStr = SDLX.Common.PublicMethod.GetSessionValue("WenJianList");
        MyModel.FromUser = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        MyModel.ToUser = this.TextBox2.Text;
        MyModel.YiJieShouRen = "";
        MyModel.ChuanYueHouIDList1 = this.DropDownList1.SelectedItem.Value.ToString();
        MyModel.QianShouHouIDList = "0";
        MyModel.Add();


        //发送短信
        SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "您有新的文件需要接收！(" + this.TextBox1.Text + ")", this.TextBox2.Text.Trim());


        //写系统日志
        SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
        MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加传阅文件(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        SDLX.Common.MessageBox.ShowAndRedirect(this, "传阅文件添加成功！", "SendFile.aspx");
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
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (this.CheckBoxList1.SelectedItem.Text.Trim().Length > 0)
            {
                Response.Write("<script>window.open('../DsoFramer/ReadFile.aspx?FilePath=" + this.CheckBoxList1.SelectedItem.Text + "');</script>");
            }
        }
        catch
        { }
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (this.CheckBoxList1.SelectedItem.Text.Trim().Length > 0)
            {
                Response.Write("<script>window.open('../DsoFramer/EditFile.aspx?FilePath=" + this.CheckBoxList1.SelectedItem.Text + "');</script>");
            }
        }
        catch
        { }
    }
}