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

public partial class Admin_index : System.Web.UI.Page {
	protected void Page_Load(object sender, EventArgs e) {

        if (Session["UserName"]== null || Session["UserCode"] == "")
        {
			Response.Write("<script>window.location.href='login.aspx'</script>");//window.alert('对不起，无权限浏览，请您登录后再试！');
			return;
		}
	}
}
