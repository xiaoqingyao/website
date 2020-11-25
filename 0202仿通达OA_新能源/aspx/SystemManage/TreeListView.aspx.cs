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

namespace OA.aspx.SystemManage{ 
 public partial class TreeListView: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPTreeList Model = new FTD.BLL.ERPTreeList();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblTextStr.Text=Model.TextStr.ToString();
			this.lblImageUrlStr.Text=Model.ImageUrlStr.ToString();
			this.lblValueStr.Text=Model.ValueStr.ToString();
			this.lblNavigateUrlStr.Text=Model.NavigateUrlStr.ToString();
			this.lblTarget.Text=Model.Target.ToString();
			this.lblParentID.Text=Model.ParentID.ToString();
			this.lblQuanXianList.Text=Model.QuanXianList.ToString();
			this.lblPaiXuStr.Text=Model.PaiXuStr.ToString();
            this.lblClass.Text = Model.ParentClass;
			
			//写系统日志
			FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
			MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看菜单管理信息(" + this.lblTextStr.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
}