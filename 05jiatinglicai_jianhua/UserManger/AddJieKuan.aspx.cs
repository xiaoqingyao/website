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

public partial class AddJieKuan : System.Web.UI.Page
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

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "insert into Jie_Money(name,AddMoney,Ds,AddUserId,UserName,TypeName)values('" + TextBox1.Text + "','" + TxtMoney.Text + "','" + TxtStatement.Text + "','" + Session["UserId"].ToString() + "','" + Session["Name"].ToString() + "','" + DropDownList1.SelectedValue + "')";

        data.RunSql(sql);

        Alert.AlertAndRedirect("添加成功！", "JieMoneyManger.aspx");

    }
}
