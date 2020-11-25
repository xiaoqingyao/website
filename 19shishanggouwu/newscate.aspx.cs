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

public partial class catenews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int c = Convert.ToInt32(Request.QueryString["uid"]); 
            string str = "select count(*) from news where _cateid="+c+"";
            int result = Convert.ToInt32(Common.DB.ExecuteScalar(str));
            AspNetPager22.RecordCount = result;
            AspNetPager22.PageSize = 20;
            info();
            repeat();
        }
    }
    public void info()
    {
        int c = Convert.ToInt32(Request.QueryString["uid"]);
        string str = "select * from news,article where news._ispic=article._id and news._cateid=" + c + " order by _top desc ,news._id desc ";
        string sql = "select * from newscate where _cateid=" + c + "";
        SqlDataReader sdr = Common.DB.dataReader(sql);
        if (sdr.Read())
        {
            Page.Title = sdr["_catename"].ToString();
        }
        sdr.Close();
        DataSet ds = Common.DB.PagedataSet(str, AspNetPager22.PageSize * (AspNetPager22.CurrentPageIndex - 1), AspNetPager22.PageSize, "helpcate");
        Repeater1.DataSource = ds.Tables[0];
        Repeater1.DataBind();
    }
    protected void AspNetPager1_PageChanging1(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager22.CurrentPageIndex = e.NewPageIndex;
        info();
    }


    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (search.Text != "")
        {
            Response.Redirect("newselect.aspx?title=" + search.Text + "");
        }
    }
    private void repeat()
    {

        string st = "select * from newscate ";
        DataSet ds1 = Common.DB.dataSet(st);
        Repeater2.DataSource = ds1.Tables[0];
        Repeater2.DataBind();
    }
}
