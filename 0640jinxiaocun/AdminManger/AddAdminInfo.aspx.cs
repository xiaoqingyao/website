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

public partial class AdminManger_AddAdminInfo : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    Alert alert = new Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Roule"].ToString().Trim() != "管理员")
        {
            Response.Write("<script>javascript:alert('对不起,您没有这个权限');history.back();</script>");
            Response.End();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        data.RunSql("insert into UsersInfo(name,Password,TName)values('" + txtUser.Text + "','" + txtPwd.Text + "','" + TextBox1.Text + "')");
        Alert.AlertAndRedirect("添加成功", "AdminManger.aspx");
    }
}
