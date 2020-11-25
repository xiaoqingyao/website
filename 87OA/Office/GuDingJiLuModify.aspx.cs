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

public partial class Office_GuDingJiLuModify : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPGuDingJiLu Model = new ZWL.BLL.ERPGuDingJiLu();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtGDName.Text=Model.GDName.ToString();
			this.txtZJType.Text=Model.ZJType.ToString();
			this.txtZJDate.Text=Model.ZJDate.ToString();
			this.txtZJJinE.Text=Model.ZJJinE.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPGuDingJiLu Model = new ZWL.BLL.ERPGuDingJiLu();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.GDName=this.txtGDName.Text.ToString();
		Model.ZJType=this.txtZJType.Text.ToString();
		Model.ZJDate=this.txtZJDate.Text.ToString();
		Model.ZJJinE=this.txtZJJinE.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		
		Model.Update();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改折旧记录信息(" + this.txtGDName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "折旧记录信息修改成功！", "GuDingJiLu.aspx?GDName=" + Request.QueryString["GDName"].ToString());
	}
}
