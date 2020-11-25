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

public partial class UserControl_NotifyUC : System.Web.UI.UserControl
{
	protected string Body = "";

    protected void Page_Load(object sender, EventArgs e)
    {
		//BindNotifyData();
    }

    //private void BindNotifyData()
    //{
    //    ///定义获取数据的类
    //    Notify notify = new Notify();
    //    SqlDataReader dr = notify.GetNotify();		

    //    ///读取数据
    //    if(dr.Read())
    //    {
    //        Body = dr["Body"].ToString();
    //        if(Body.Length > 100)
    //        {
    //            Body = Body.Substring(0,100);
    //        }
    //    }
    //    ///关闭数据读取器和数据库的连接
    //    dr.Close();
	//}
}
