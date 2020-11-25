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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //获取列表
            rptList1.DataSource = DB.getDataTable("select top 10 * from pic order by picId desc");
            rptList1.DataBind();


            rptListBlog1.DataSource = DB.getDataTable("select top 5 *,(select count(0) from comment where blogid=Blog.blogid) as plcount from Blog order by hits desc");
            rptListBlog1.DataBind();
            
            rptListBlog2.DataSource = DB.getDataTable("select top 5 *,(select count(0) from comment where blogid=Blog.blogid) as plcount from Blog order by Blogid desc");
            rptListBlog2.DataBind();

        }
    }
}
