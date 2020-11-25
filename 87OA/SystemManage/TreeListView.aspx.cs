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

public partial class SystemManage_TreeListView : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPTreeList Model = new ZWL.BLL.ERPTreeList();
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
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看菜单管理信息(" + this.lblTextStr.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
