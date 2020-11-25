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
public partial class Admin_AddUser : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

         
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        SqlDataReader dr = data.GetDataReader("select * from  UserInfo where loginName='" + loginName.Text + "'  ");
        if (dr.Read())
        {
            Label1.Text = "账号已经存在！";
            return;
        }
        else
        {

            string sql = "insert into UserInfo(Name,Sex,Pass,loginName,NianLing,Ds,LoginRoule,SFZ,XueLI,TEl)values('" + Name.Text + "','" + Sex.SelectedValue + "','" + Pass.Text + "','" + loginName.Text + "','" + NianLing.Text + "','" + Ds.Text + "','" + DropDownList1.SelectedValue + "','" + SFZ.Text + "','" + XueLI.Text + "','" + TEl.Text + "')";
            data.RunSql(sql);
            Alert.AlertAndRedirect("添加成功", "UserMange.aspx");
        }
    }
}
