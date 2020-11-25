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

public partial class GongGao_GongGao : System.Web.UI.Page
{
    public List<ERPGongGao> EmailList = new List<ERPGongGao>();
    public string type = "";
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
        ZWL.BLL.ERPGongGao MyLanEmail = new ZWL.BLL.ERPGongGao();
        type = Request.QueryString["Type"].ToString().Trim();
        if (Request.QueryString["Type"].ToString().Trim() == "单位")
        {
            var T = context.ERPGongGao.Where(p => p.TypeStr == Request.QueryString["Type"].ToString().Trim()).OrderByDescending(p => p.ID);
            EmailList = T.ToList();
        }
        else
        {
            var T = context.ERPGongGao.Where(p => p.TypeStr == Request.QueryString["Type"].ToString().Trim() && p.UserBuMen == ZWL.Common.PublicMethod.GetSessionValue("Department")).OrderByDescending(p => p.ID);
            EmailList = T.ToList();
        }
    }
}