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

public partial class cjwt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string str = "select count(*) from news";
            int result = Convert.ToInt32(Common.DB.ExecuteScalar(str));
            AspNetPager21.RecordCount = result;
            AspNetPager21.PageSize = 20;
            info();
            repeat();
        }
    }
    public void info()
    {

        string str = "select * from news,article where news._ispic=article._id order by _top desc ,news._id desc ";
        DataSet ds = Common.DB.PagedataSet(str, AspNetPager21.PageSize * (AspNetPager21.CurrentPageIndex - 1), AspNetPager21.PageSize, "helpcate");
        Repeater1.DataSource = ds.Tables[0];
        Repeater1.DataBind();
    }
    protected void AspNetPager1_PageChanging1(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager21.CurrentPageIndex = e.NewPageIndex;
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