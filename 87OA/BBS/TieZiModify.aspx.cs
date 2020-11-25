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

public partial class BBS_TieZiModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();

            ZWL.BLL.ERPBBSTieZi MyModel = new ZWL.BLL.ERPBBSTieZi();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.TextBox1.Text = MyModel.TitleStr;
            this.TxtContent.Text = MyModel.ContentStr;            
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPBBSTieZi Model = new ZWL.BLL.ERPBBSTieZi();
        Model.ID = int.Parse(Request.QueryString["ID"].ToString());
        Model.ContentStr = this.TxtContent.Text;       
        Model.TitleStr = this.TextBox1.Text.Trim();        
        Model.Update();

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改论坛帖子信息(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "论坛帖子修改成功！", "BanKuaiView.aspx?ID=" + Request.QueryString["BanKuaiID"].ToString());
    }
}