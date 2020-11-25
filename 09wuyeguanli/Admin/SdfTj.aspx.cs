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

public partial class Admin_SdfTj : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //根据收费月份 统计小区的收费信息
            GridView1.DataSource = SQL.GetTable("select 收费月份,sum(水费金额) as 水费总额,sum(电费金额) as 电费总额, sum(气费金额) as 气费总额,sum(收费总额) as 收费总额 from 水电气费  where 是否缴费=1 group by 收费月份");
            GridView1.DataBind();
        }
    }
}
