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

namespace OA.aspx.Office{ 
 public partial class BookView: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPBook Model = new FTD.BLL.ERPBook();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblBookName.Text=Model.BookName.ToString();
			this.lblBookSerils.Text=Model.BookSerils.ToString();
			this.lblSuoShuBuMen.Text=Model.SuoShuBuMen.ToString();
			this.lblBookType.Text=Model.BookType.ToString();
			this.lblAuother.Text=Model.Auother.ToString();
			this.lblISBN.Text=Model.ISBN.ToString();
			this.lblCoperStr.Text=Model.CoperStr.ToString();
			this.lblChuBanDate.Text=Model.ChuBanDate.ToString();
			this.lblCunFangDian.Text=Model.CunFangDian.ToString();
			this.lblShuLiang.Text=Model.ShuLiang.ToString();
			this.lblJiaGe.Text=Model.JiaGe.ToString();
			this.lblNeiRong.Text=Model.NeiRong.ToString();
			this.lblNowState.Text=Model.NowState.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			
			//写系统日志
			FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
			MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户查看图书信息(" + this.lblBookName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
}