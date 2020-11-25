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
using System.Data.SqlClient;
public partial class BasicInfo_Modify_UserInfo : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList2.DataSource = data.GetDataReader("select * from  BuMen ");
            DropDownList2.DataTextField = "name";
            DropDownList2.DataValueField = "id";
            DropDownList2.DataBind();

            SqlDataReader dr = data.GetDataReader("select * from UsersInfo where id=" + Request.QueryString["id"].ToString());
            if (dr.Read())
            {

                txtUser.Text = dr["Name"].ToString();
                TextBox1.Text = dr["TName"].ToString();

                if (Convert.ToString(dr["Roule"]).Trim() == "管理员")
                {
                    DropDownList1.SelectedIndex = 0;
                }
                if (Convert.ToString(dr["Roule"]).Trim() == "普通用户")
                {
                    DropDownList1.SelectedIndex = 1;
                }
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        data.RunSql("update UsersInfo set  Name='" + txtUser.Text + "', Roule='" + DropDownList1.SelectedValue + "' ,TName='" + TextBox1.Text + "',Bumen='" + DropDownList2.SelectedItem.Text + "'  where id=" + Request.QueryString["id"].ToString());
        Alert.AlertAndRedirect("修改成功", "UserInfoManger.aspx");
    }
}
