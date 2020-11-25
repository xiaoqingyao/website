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
public partial class ModifyMoney : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Type();
            GetInfo();
        }
    }
    private void Type()
    {
        drpParentItem.DataSource = data.GetDataReader("select * from  MoenyClass  ");
        drpParentItem.DataTextField = "name";
        drpParentItem.DataValueField = "id";
        drpParentItem.DataBind();

    }
    private void GetInfo()
    {
        int id = int.Parse(Request.QueryString["id"].ToString());
        SqlDataReader dr;
        dr = data.GetDataReader("select * from  F_Money where id=" + id);
        if (dr.Read())
        {
            TxtMoney.Text = dr["AddMoney"].ToString();
            TxtStatement.Text = dr["Ds"].ToString();

            drpSubItem.Items.FindByValue(dr["Type"].ToString()).Selected = true;//选项Text  

            drpParentItem.Items.FindByText(dr["name"].ToString()).Selected = true;//选项Text  
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        int id = int.Parse(Request.QueryString["id"].ToString());
        data.RunSql("update  F_Money set  name='" + drpParentItem.SelectedItem.Text + "',Type='" + drpSubItem.SelectedItem.Text + "',AddMoney='" + TxtMoney.Text + "',Ds='" + TxtStatement.Text + "' where id=" + id);

        Alert.AlertAndRedirect("修改成功！", "MoneyManger.aspx");
    }
}
