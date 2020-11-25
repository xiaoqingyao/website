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

public partial class Supply_SupplysAdd : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPSupplys Model = new ZWL.BLL.ERPSupplys();
		
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
		Model.UserName=ZWL.Common.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		
		Model.Add();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加供应商信息(" + this.txtSupplysName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "供应商信息添加成功！", "Supplys.aspx");
	}
}
