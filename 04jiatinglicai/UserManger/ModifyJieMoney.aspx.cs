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
public partial class ModifyJieMoney : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            GetInfo();
        }
    }

    private void GetInfo()
    {
        int id = int.Parse(Request.QueryString["id"].ToString());
        SqlDataReader dr;
        dr = data.GetDataReader("select * from  Jie_Money where id=" + id);
        if (dr.Read())
        {
            TxtMoney.Text = dr["AddMoney"].ToString();
            TxtStatement.Text = dr["Ds"].ToString();
            TextBox1.Text = dr["name"].ToString();
            txtJksj.Text = dr["AddTime"].ToString();
            txtShrq.Text = dr["ReturnTime"].ToString();
            txtYsh.Text = dr["ReturnMoney"].ToString();
            txtDsh.Text = dr["unReturnMoeny"].ToString();
            DropDownList1.Items.FindByValue(dr["TypeName"].ToString()).Selected = true;//选项Text  
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        int id = int.Parse(Request.QueryString["id"].ToString());
        data.RunSql("update  Jie_Money set  name='" + TextBox1.Text + "',AddMoney='" + TxtMoney.Text + "',Ds='" + TxtStatement.Text + "',TypeName='"+DropDownList1.SelectedValue+"' where id=" + id);

        Alert.AlertAndRedirect("修改成功！", "JieMoneyManger.aspx");
    }
}
