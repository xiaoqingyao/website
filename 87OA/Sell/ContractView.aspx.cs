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

public partial class Sell_ContractView : System.Web.UI.Page
{
    public string HeTongName = "";

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPContract Model = new ZWL.BLL.ERPContract();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblHeTongName.Text=Model.HeTongName.ToString();
            HeTongName = Model.HeTongName.ToString();
			this.lblHeTongSerils.Text=Model.HeTongSerils.ToString();
			this.lblHeTongLeiXing.Text=Model.HeTongLeiXing.ToString();
			this.lblQianYueKeHu.Text=Model.QianYueKeHu.ToString();
			this.lblHeTongMiaoShu.Text=Model.HeTongMiaoShu.ToString();
			this.lblHeTongTiaoKuan.Text=Model.HeTongTiaoKuan.ToString();
			this.lblHeTongContent.Text=Model.HeTongContent.ToString();
            this.lblShengXiaoDate.Text = Model.ShengXiaoDate.ToString().Replace(" 0:00:00", "");
            this.lblZhongZhiDate.Text = Model.ZhongZhiDate.ToString().Replace(" 0:00:00", "");
            this.lblTiXingDate.Text = Model.TiXingDate.ToString().Replace(" 0:00:00", "");
			this.lblQianYueRenBuy.Text=Model.QianYueRenBuy.ToString();
			this.lblQianYueRenSell.Text=Model.QianYueRenSell.ToString();
			this.lblCreateTime.Text=Model.CreateTime.ToString();
			this.lblCreateUser.Text=Model.CreateUser.ToString();
            this.lblFuJianList.Text = ZWL.Common.PublicMethod.GetWenJian(Model.FuJianList.ToString(), "../UploadFile/"); 
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			this.lblNowState.Text=Model.NowState.ToString();
			
			//写系统日志
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看销售订单信息(" + this.lblHeTongName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
    public void btnDownloadFile_Click(object sender, EventArgs e)
    {
        try
        {
            ZWL.Common.PublicMethod.DownloadFile(Server.MapPath("~"), this.hdnFileURL.Value.Trim());
        }
        catch
        {
        }
    }
}
