using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WareHouseQuery : System.Web.UI.Page
{
    sqlHelper server = new sqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        string dtFrm = this.dtFrm.Text.Trim();
        string dtTo = this.dtTo.Text.Trim();
        string cate = this.Category.SelectedValue;
        string sql = @"select Category,sum([count]) as ct from WareHouse
                    where 1=1 
                    
                    ";
        if (!string.IsNullOrEmpty(dtFrm))
        {
            sql += " and createDate>='" + dtFrm + "'";
        }
        if (!string.IsNullOrEmpty(dtTo))
        {
            sql += " and createDate<='" + dtTo + "'";
        }
        if (!string.IsNullOrEmpty(cate))
        {
            sql += " and Category='" + cate + "'";
        }
        sql += "group by Category";
        this.GridView1.DataSource= server.GetDataTable(sql, null);
        this.GridView1.DataBind();
    }

    protected void select_Click(object sender, EventArgs e)
    {

    }
}