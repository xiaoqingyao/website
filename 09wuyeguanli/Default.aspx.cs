using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page 
{
    public string css = "";
    public string user = "";
    public string css2 = "";
	public string normalusercss = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null) {
            css = "";
            css2 = "hide";
            user = "欢迎您，"+Session["UserName"].ToString();
            normalusercss = "";
        } else {
            css = "hide"; 
            css2 = "";
        }
    }

    ///// <summary>
    ///// 获取菜单
    ///// </summary>
    //private void getMenus() {
    //    Category category = new Category();
    //    SqlDataReader drc = category.GetSubCategorys(1);

    //    DataTable dt = SQLHelper.ConvertdrTodt(drc);
    //    foreach (DataRow dr in dt.Rows) {
    //        menus += "<div class=\"menutitle\" onclick=\"linkProducts('product.aspx?CategoryID=" + dr["CategoryID"].ToString() + "')\">" + dr["Desn"].ToString() + "</div>";
    //    }
    //}
	protected void ButtonQuit_Click(object sender, EventArgs e) {

		Session["UserID"] = null;
		Session["RoleID"] = null;
		Session["UserName"] = null;
		Response.Redirect("Default.aspx");
		//Response.Write("<script>window.lacation.reload()</script>");
	}
    protected void MyNewsUC_Load(object sender, EventArgs e)
    {

    }
}
