using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_FenLei_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql = "select * from tb_News";
            DataSet ds = DBHelper.GetDataSet(sql);
            this.GridView1.DataSource = ds.Tables[0];
            this.GridView1.DataBind();
        } 
    } 
} 