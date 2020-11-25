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

public partial class Supply_SupplysModify : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPSupplys Model = new ZWL.BLL.ERPSupplys();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtSupplysName.Text=Model.SupplysName.ToString();
			this.txtSerils.Text=Model.Serils.ToString();
			this.txtJianCheng.Text=Model.JianCheng.ToString();
			this.txtDianHua.Text=Model.DianHua.ToString();
			this.txtMobTel.Text=Model.MobTel.ToString();
			this.txtChuanZhen.Text=Model.ChuanZhen.ToString();
			this.txtURLStr.Text=Model.URLStr.ToString();
			this.txtEmailStr.Text=Model.EmailStr.ToString();
			this.txtDiQu.Text=Model.DiQu.ToString();
			this.txtYouBian.Text=Model.YouBian.ToString();
			this.txtAddress.Text=Model.Address.ToString();
			this.txtKaiHuHang.Text=Model.KaiHuHang.ToString();
			this.txtZhangHao.Text=Model.ZhangHao.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPSupplys Model = new ZWL.BLL.ERPSupplys();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
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
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		
		Model.Update();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改供应商信息(" + this.txtSupplysName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "供应商信息修改成功！", "Supplys.aspx");
	}
}
