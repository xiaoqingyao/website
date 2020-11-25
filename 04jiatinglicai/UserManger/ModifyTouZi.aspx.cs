using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserManger_ModifyTouZi : System.Web.UI.Page
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
        dr = data.GetDataReader("select * from  TZ_Money where id=" + id);
        if (dr.Read())
        {
            txtTzkm.Text = dr["subName"].ToString();
            txtTzr.Text = dr["UserName"].ToString();
            txtTzrq.Text = dr["addDate"].ToString();
            txtDqrq.Text = dr["endDate"].ToString();
            txtTzsc.Text = dr["days"].ToString();
            txtTzje.Text = dr["je"].ToString();
            txtYjsy.Text = dr["YjShouyi"].ToString();
            txtXysy.Text = dr["XyShouyi"].ToString();
            TxtStatement.Text = dr["bz"].ToString();

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        int id = int.Parse(Request.QueryString["id"].ToString());
        data.RunSql("update  TZ_Money set  subName='" + txtTzkm.Text + "',UserName='" + txtTzr.Text + "',addDate='" + txtTzrq.Text + "',endDate = '" + txtDqrq.Text + "', days = '" + txtTzsc.Text + "', je = '" + txtTzje.Text + "',YjShouyi = '" + txtYjsy.Text + "', XyShouyi = '" + txtXysy.Text + "', bz = '" + TxtStatement.Text + "' where id=" + id);
        Alert.AlertAndRedirect("修改成功！", "TouZiManger.aspx");
    }
}