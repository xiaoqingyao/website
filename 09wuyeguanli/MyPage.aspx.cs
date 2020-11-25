using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class MyPage : System.Web.UI.Page {
	public string page = "";
	public string title = "";
	protected void Page_Load(object sender, EventArgs e) {
		page = Request["page"].ToString();
		if (page.IndexOf("Cart.aspx") >= 0) {
			title = "我的购物车";
		} else if (page.IndexOf("Order.aspx") >= 0) {
			title = "我的的订单";
		}else if (page.IndexOf("UserInfo.aspx") >= 0) {
			title = "我的个人信息";
		} else if (page.IndexOf("Pay.aspx") >= 0) {
			title = "订单信息结算";
		} else if (page.IndexOf("NewOrder.aspx") >= 0) {
			title = "订单信息结算";
		}
	}
}
