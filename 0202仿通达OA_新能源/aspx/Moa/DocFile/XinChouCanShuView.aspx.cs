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

namespace OA.aspx.Moa.DocFile{ 
 public partial class XinChouCanShuView: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPXinChouCanShu Model = new FTD.BLL.ERPXinChouCanShu();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblItemName.Text=Model.ItemName.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			
			//写系统日志
			FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
			MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看薪酬参数信息(" + this.lblItemName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
}