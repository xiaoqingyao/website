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

public partial class Admin_UserComplaint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            GridView1.DataSource = SQL.GetTable("select 投诉内容,参与人员,处理日期,投诉日期,是否处理 from 住户投诉 z join 住户 on  z.住户代码=住户.住户代码");
            GridView1.DataBind();
        }
    }
}
