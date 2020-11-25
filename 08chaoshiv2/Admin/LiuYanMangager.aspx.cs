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

public partial class Admin_LiuYanMangager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql = "select * from TB_LiuYan";
            DataSet ds = DBHelper.GetDataSet(sql);
            dlTopic.DataSource = ds.Tables[0];
            dlTopic.DataBind();
        }
    }
}
