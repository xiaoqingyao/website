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

public partial class Admin_WyfTj : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //根据楼栋 统计物业收费信息
            GridView1.DataSource = SQL.GetTable("select 楼栋名称,sum(收费金额) as 收费总额 from 物业费,住户,楼栋 where  物业费.住户代码=住户.住户代码 and 住户.楼栋代码=楼栋.楼栋代码 group by 楼栋.楼栋代码,楼栋名称");
            GridView1.DataBind();
        }
    }
}
