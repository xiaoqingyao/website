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
public partial class ModifyCKMoney : System.Web.UI.Page
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
        dr = data.GetDataReader("select * from  LC_Money where id=" + id);
        if (dr.Read())
        {
            TxtMoney.Text = dr["AddMoney"].ToString();
            TxtStatement.Text = dr["Ds"].ToString();
            TextBox1.Text = dr["name"].ToString();
            this.txtKhr.Text= dr["UserName"].ToString();

            this.DropDownList1.SelectedValue = dr["TypeName"].ToString();
            this.txtKhrq.Text = dr["AddTime"].ToString();
            this.txtYears.Text = dr["years"].ToString();
            this.txtDqrq.Text = dr["endTime"].ToString();

            this.txtDqbx.Text = dr["endBenXi"].ToString();
            this.txtXybx.Text = dr["BenXi"].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        int id = int.Parse(Request.QueryString["id"].ToString());
        data.RunSql("update  LC_Money set  name='" + TextBox1.Text + "',AddMoney='" + TxtMoney.Text + "',Ds='" + TxtStatement.Text +
            "',UserName='" + this.txtKhr.Text.Trim() + "',TypeName='" + this.DropDownList1.SelectedValue + "',AddTime='" + txtKhrq.Text +
            "',years='" + txtYears.Text + "',endTime='" + txtDqrq.Text + "',endBenXi='" + txtDqbx.Text + "',BenXi='" + txtXybx.Text + "' where id=" + id);

        Alert.AlertAndRedirect("修改成功！", "CKMoneyManger.aspx");
    }
}
