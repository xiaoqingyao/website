using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class farmlandLeaseNote : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        sqlHelper server = new sqlHelper();
        if (!IsPostBack)
        {
            object objCode = Request["code"];
            if (objCode != null)
            {
                string sql = "select * from farmlandLease where  farmlandCode='" + objCode + "' order by createDate desc";
                DataTable dt = server.GetDataTable(sql, null);
                this.GridView1.DataSource = dt;
                this.GridView1.DataBind();
            }
        }
    }
}