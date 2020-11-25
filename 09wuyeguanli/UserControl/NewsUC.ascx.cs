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

public partial class UserControl_NewsUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if(!Page.IsPostBack)
        //{
        //    BindNewsData();
        //}
    }

    //private void BindNewsData()
    //{
    //    ///定义获取数据的类
    //    News news = new News();
    //    SqlDataReader dr = news.GetNewss();		

    //    ///设定控件的数据源
    //    NewsList.DataSource = dr;
    //    ///绑定控件的数据
    //    NewsList.DataBind();

    //    ///关闭数据读取器和数据库的连接
    //    dr.Close();
    //}

}
