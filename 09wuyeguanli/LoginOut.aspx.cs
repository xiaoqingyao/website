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

public partial class LoginOut : System.Web.UI.Page
{
    public string html = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// 退出
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void BtnOK_Click(object sender, EventArgs e) {

        Session["UserID"] = null;
        Session["RoleID"] = null;
        Session["UserName"] = null;
        Response.Redirect("Close2.aspx");
    }

    protected void BtnCancel_Click(object sender, EventArgs e) {
        Response.Redirect("Close.aspx");
    }

    private void ShowMessage(string sMsg) {
        ///显示操作结果信息
        Response.Write("<script>window.alert('" + sMsg + "')</script>");
    } 
}
