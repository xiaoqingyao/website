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
        string Sql = "select * from tb_News order by NewsDate desc";
        DataSet result = DBHelper.GetDataSet(Sql);
        this.GridView1.DataSource = result.Tables[0];
        this.GridView1.DataBind();


    } 
 
} 