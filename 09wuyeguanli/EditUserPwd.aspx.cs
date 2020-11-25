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

public partial class EditUserPwd : System.Web.UI.Page {
	private int nUserID = -1;
	protected void Page_Load(object sender, EventArgs e) {   ///获取参数nUserID的值
		if (Session["UserName"] != null) {   ///获取参数nUserID的值
			if (Int32.TryParse(Session["UserCode"].ToString(), out nUserID)
			== false) {
				return;
			}
		} else {
			Response.Redirect("login.aspx");
		}
		if (!Page.IsPostBack) {   ///判断参数是否正确
			if (nUserID > -1) {   ///从数据库中读取数据，并显示
				BindUserData(nUserID);
			} else {
				SureBtn.Enabled = false;
			}
		}
	}
	private void BindUserData(int nUserID) {  
		//获取数据
		string sql = "select * from 住户 where 住户代码=" + nUserID;
		DataTable dt = SQL.GetTable(sql);
		if (dt.Rows.Count == 0) {
			Response.Write("<script>window.alert('对不起，未找到该用户信息！');window.location.href='Default.aspx'</script>");
			return;
		}

        //User user = new User();
        //SqlDataReader dr = user.GetSingleUser(nUserID);
        //if (dr.Read()) {   ///读取数据
		UserName.Text = dt.Rows[0]["户主"].ToString();
		txt_oldPassword.Text = dt.Rows[0]["密码"].ToString();
        /////关闭数据源
        //dr.Close();
	}
	protected void SureBtn_Click(object sender, EventArgs e) {
		
		if (Session["UserName"]==null || Session["UserCode"] == null){
			Response.Write("<script>window.alert('对不起，未登录，请登录后再修改密码！');window.location.href='Default.aspx'</script>");
			return;
		}
		///判断用户输入的旧密码是否正确
		if (txt_oldPassword.Text.Trim() != this.OldPassword.Text.Trim()) {
			Response.Write("<script>alert('" + "旧密码输入错误，请重新输入密码！"
			+ "');</script>");
			return;
		}
		//修改用户密码
		string sql = "update 住户 set 密码='" + NewPassword.Text + "' where 住户代码=" + nUserID;
		if (SQL.ExecScalar(sql) < 0) {
			Response.Write("<script>alert('修改密码失败。请重试！');</script>");
			return; 
		}
		Response.Write("<script>alert('修改密码成功，请妥善保管好数据！');window.location.href='Default.aspx'</script>");
    }
}
