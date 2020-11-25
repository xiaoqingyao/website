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

public partial class BlogList : System.Web.UI.Page
{
    //列表SQL
    public string sqltxt = "select *,(select count(0) from comment where blogid=Blog.blogid) as plcount from [Blog] order by BlogId desc";
    //总数SQL
    public string cmdtxt2 = "select count(0) from [Blog]";
    protected string tid = string.Empty, key = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        tid = Request.QueryString["tid"];
        key = Request.QueryString["key"];
        if (!IsPostBack)
        {
            string where = " where 1=1";
            if (!string.IsNullOrEmpty(tid))
            {
                where += " and typeid=" + tid;
            }

            if (!string.IsNullOrEmpty(key))
            {
                where += " and blogName like '%" + key + "%'";
                ltlArea.Text = "搜索：" + key;
            }

            //rptListBlog.DataSource = DB.getDataTable("select " + word + " from Blog " + where + " order by Blogid desc");
            //rptListBlog.DataBind();

            //=======================================================
            sqltxt = "select *,(select count(0) from comment where blogid=Blog.blogid) as plcount from [Blog] " + where + " order by BlogId desc";
            cmdtxt2 = "select count(0) from [Blog] " + where + "";
            Get_Pager_Data();
        }
    }

    /// <summary>
    /// 获取记录总数
    /// </summary>
    void Get_Pager_Data()
    {
        SqlConnection cn = DB.OpenConnection();
        SqlCommand cmd0 = new SqlCommand(cmdtxt2, cn);
        AspNetPager1.AlwaysShow = true;
        AspNetPager1.PageSize = 10;
        AspNetPager1.RecordCount = (int)cmd0.ExecuteScalar();
        DB.DisposeConnection(cn);
        Get_Data();
    }

    /// <summary>
    /// 绑定数据
    /// </summary>
    void Get_Data()
    {
        SqlConnection cn = DB.OpenConnection();
        SqlCommand cmd = new SqlCommand(sqltxt, cn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize, "[Blog]");
        DataView dv = ds.Tables["[Blog]"].DefaultView;
        this.rptListBlog.DataSource = dv;
        this.rptListBlog.DataBind();
    }

    /// <summary>
    /// 分页事件
    /// </summary>
    /// <param name="src"></param>
    /// <param name="e"></param>
    protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        Get_Data();
    }




}
