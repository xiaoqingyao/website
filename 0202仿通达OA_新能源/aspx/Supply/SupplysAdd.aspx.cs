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

namespace OA.aspx.Supply{ 
 public partial class SupplysAdd: System.Web.UI.Page
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
		FTD.BLL.ERPSupplys Model = new FTD.BLL.ERPSupplys();
		
		Model.SupplysName=this.txtSupplysName.Text.ToString();
		Model.Serils=this.txtSerils.Text.ToString();
		Model.JianCheng=this.txtJianCheng.Text.ToString();
		Model.DianHua=this.txtDianHua.Text.ToString();
		Model.MobTel=this.txtMobTel.Text.ToString();
		Model.ChuanZhen=this.txtChuanZhen.Text.ToString();
		Model.URLStr=this.txtURLStr.Text.ToString();
		Model.EmailStr=this.txtEmailStr.Text.ToString();
		Model.DiQu=this.txtDiQu.Text.ToString();
		Model.YouBian=this.txtYouBian.Text.ToString();
		Model.Address=this.txtAddress.Text.ToString();
		Model.KaiHuHang=this.txtKaiHuHang.Text.ToString();
		Model.ZhangHao=this.txtZhangHao.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.UserName=FTD.Unit.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		
		Model.Add();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加供应商信息(" + this.txtSupplysName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "供应商信息添加成功！", "Supplys.aspx");
	}
}
}