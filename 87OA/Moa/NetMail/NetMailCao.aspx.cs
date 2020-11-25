﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

public partial class NetMail_NetMailCao : System.Web.UI.Page
{
    public List<ERPNetEmail> EmailList = new List<ERPNetEmail>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview();
        }
    }
    public void DataBindToGridview()
    {
        DataEntityDataContext context = new DataEntityDataContext();
        ZWL.BLL.ERPNetEmail MyLanEmail = new ZWL.BLL.ERPNetEmail();
        var T = context.ERPNetEmail.Where(p => p.FromUser == ZWL.Common.PublicMethod.GetSessionValue("UserName") && p.EmailState == "草稿").OrderByDescending(p => p.ID);
        EmailList = T.ToList();
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("NetEmailAdd.aspx");
    }
}