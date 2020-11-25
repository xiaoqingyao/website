using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
public partial class cjwt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string name = Request.QueryString["title"].ToString();
        string str = " select count(*) from news  where _title like '%" + name + "%'";
        int result = Convert.ToInt32(Common.DB.ExecuteScalar(str));
        AspNetPager23.RecordCount = result;
        AspNetPager23.PageSize = 5;
        info();
    }

    public void info()
    {
        string name = Request.QueryString["title"].ToString();
        string str = " select * from news ,article where _title like '%" + name + "%' and news._ispic=article._id order by _top desc ,news._id desc ";
        int result = Common.DB.ExecuteSql(str);
        if (result<0)
        {
            Label1.Text = "没有您要搜索的信息";
        }
       
        DataSet ds = Common.DB.PagedataSet(str, AspNetPager23.PageSize * (AspNetPager23.CurrentPageIndex - 1), AspNetPager23.PageSize, "helpcate");
        Repeater1.DataSource = ds.Tables[0];
        Repeater1.DataBind();
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("newselect.aspx?title=" + search.Text + "");
    }
    protected void AspNetPager1_PageChanging1(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager23.CurrentPageIndex = e.NewPageIndex;
        info();
    }
}
