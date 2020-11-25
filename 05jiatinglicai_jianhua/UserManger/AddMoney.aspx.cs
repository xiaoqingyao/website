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

public partial class AddMoney : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Alert.AlertAndRedirect("对不起您没有登录！", "Login.aspx");

            }
            else
            {
                drpParentItem.DataSource = data.GetDataReader("select * from  MoenyClass  ");
                drpParentItem.DataTextField = "name";
                drpParentItem.DataValueField = "id";
                drpParentItem.DataBind();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "insert into F_Money(name,Type,UserName,AddMoney,Ds,AddUserId)values('" + drpParentItem.SelectedItem.Text + "','" + drpSubItem.SelectedItem.Text + "','" + Session["Name"].ToString() + "','" + TxtMoney.Text + "','" + TxtStatement.Text + "','" + Session["UserId"].ToString() + "')";

        data.RunSql(sql);

        Alert.AlertAndRedirect("添加成功！", "AddMoney.aspx");

    }
}
