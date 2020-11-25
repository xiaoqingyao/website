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
using System.Data.SqlClient;

public partial class SysManage_ShouFeiList : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Get_Data();
        }
    }

    /// <summary>
    /// 绑定数据
    /// </summary>
    void Get_Data()
    {
        string sql = @"select (cast(datepart(year,shoufeidate) as varchar)+'年'+cast(datepart(month,shoufeidate) as varchar)+'月') as sftime,qutype,count(0) cs,sum(total) as total
from ShouFei
group by cast(datepart(year,shoufeidate) as varchar)+'年'+cast(datepart(month,shoufeidate) as varchar)+'月',qutype";

        this.rptList1.DataSource = DB.getDataTable(sql);
        this.rptList1.DataBind();

        sql = @"select zhuhuname,count(0) as cs,sum(total) as total
from ShouFei
where typeid=3
group by zhuhuname";

        this.rptList2.DataSource = DB.getDataTable(sql);
        this.rptList2.DataBind();

    }

    
}
