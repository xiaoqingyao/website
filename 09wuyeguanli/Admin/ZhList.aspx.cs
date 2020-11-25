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

public partial class Admin_ZhList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //显示全小区的住户列表
            this.GridView1.DataSource = SQL.GetTable("select * from 住户,楼栋,员工信息 where 住户.楼栋代码=楼栋.楼栋代码 and 住户.员工代码=员工信息.员工代码");
            this.GridView1.DataBind();
        }
    }
}
