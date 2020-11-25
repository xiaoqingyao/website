using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class xueshengzuopin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql = "select * from xueyuanzuopin";
            DataTable tb = new Class1().hsggetdata(sql).Tables[0];
            DataList1.DataSource = tb;
            DataList1.DataBind();
        }
    }
}