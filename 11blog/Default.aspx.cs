using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    public string sql;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) //以下程序意思均与czlist.aspx.cs里的大同小异
        {
            sql = "select top 8 id,title,addtime from allgonggao where leibie='资讯'";
            getdata(sql);
            //sql = "select top 8 * from users order by id desc";
            //getdata2(sql);
           
        }
    }

    private void getdata(string sql)
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                DataGrid1.DataSource = result.Tables[0];
                DataGrid1.DataBind();
            }
            else
            {
                DataGrid1.DataSource = null;
                DataGrid1.DataBind();
            }
        }
    }
    //private void getdata2(string sql)
    //{
    //    DataSet result = new DataSet();
    //    result = new Class1().hsggetdata(sql);
    //    if (result != null)
    //    {
    //        if (result.Tables[0].Rows.Count > 0)
    //        {
    //            DataGrid2.DataSource = result.Tables[0];
    //            DataGrid2.DataBind();
    //        }
    //        else
    //        {
    //            DataGrid2.DataSource = null;
    //            DataGrid2.DataBind();
    //        }
    //    }
    //}
   
    protected void Hsgtop21_Load(object sender, EventArgs e)
    {

    }
}
