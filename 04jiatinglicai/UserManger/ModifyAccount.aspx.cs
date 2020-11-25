using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserManger_ModifyAccount : System.Web.UI.Page
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
        dr = data.GetDataReader("select * from  account where id=" + id);
        if (dr.Read())
        {
            this.name.Text = dr["name"].ToString();
            this.atype.Text = dr["atype"].ToString();
            this.bz.Text = dr["bz"].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        int id = int.Parse(Request.QueryString["id"].ToString());
        data.RunSql("update  account set  name='" + name.Text + "',atype='" + atype.Text + "',bz='" + bz.Text + "' where id=" + id);

        Alert.AlertAndRedirect("修改成功！", "AcountManager.aspx");
    }
}