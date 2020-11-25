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
 public partial class BookAdd: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPBook Model = new FTD.BLL.ERPBook();
		
		Model.BookName=this.txtBookName.Text.ToString();
		Model.BookSerils=this.txtBookSerils.Text.ToString();
		Model.SuoShuBuMen=this.txtSuoShuBuMen.Text.ToString();
		Model.BookType=this.txtBookType.Text.ToString();
		Model.Auother=this.txtAuother.Text.ToString();
		Model.ISBN=this.txtISBN.Text.ToString();
		Model.CoperStr=this.txtCoperStr.Text.ToString();
		Model.ChuBanDate=this.txtChuBanDate.Text.ToString();
		Model.CunFangDian=this.txtCunFangDian.Text.ToString();
		Model.ShuLiang=this.txtShuLiang.Text.ToString();
		Model.JiaGe=this.txtJiaGe.Text.ToString();
		Model.NeiRong=this.txtNeiRong.Text.ToString();
		Model.NowState=this.txtNowState.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.UserName=FTD.Unit.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		
		Model.Add();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加图书信息(" + this.txtBookName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "图书信息添加成功！", "Book.aspx");
	}
}
}