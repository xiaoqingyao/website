using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class News : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
             
            GetInfo();
        } 
    } 
    private void GetInfo()
    {
        string id =Request.QueryString["newsid"];
        string Sql = "select * from tb_News where NewsID="+id;
        DataSet result = DBHelper.GetDataSet(Sql);
        DataTable dt = result.Tables[0];
        this.Label2.Text = dt.Rows[0]["NewsTitle"].ToString();
        this.Label4.Text = dt.Rows[0]["NewsDate"].ToString();
        this.Label3.Text = dt.Rows[0]["NewsContent"].ToString();


    } 
 
} 