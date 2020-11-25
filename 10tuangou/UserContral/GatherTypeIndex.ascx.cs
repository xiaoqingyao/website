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

public partial class UserContral_GatherTypeIndex : System.Web.UI.UserControl
{
   
    DataBase db = new DataBase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = new DataSet();
            String sql = "select * from g_type";
            ds = db.RunDataSet(sql);
            this.DataList1.DataSource = ds;
            this.DataList1.DataBind();
        }
    }
}
