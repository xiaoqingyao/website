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

public partial class GongGao_GongGaoView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();

            ZWL.BLL.ERPGongGao MyModel = new ZWL.BLL.ERPGongGao();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label1.Text = MyModel.TitleStr;
            this.Label2.Text = ZWL.Common.PublicMethod.GetWenJian(MyModel.FuJian, "../UploadFile/");
            this.Label4.Text = MyModel.ContentStr;
            this.Label5.Text = MyModel.TimeStr;
            this.Label3.Text = MyModel.UserName;
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
