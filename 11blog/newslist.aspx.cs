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

public partial class newslist : System.Web.UI.Page
{
    public string sql, lb, lbtxt;

    protected void Page_Load(object sender, EventArgs e)
    {
        lb = Request.QueryString["lb"].ToString().Trim();
        switch (lb)
        {
            case "1":
                lbtxt = "资讯";
                break;
            case "2":
                lbtxt = "学院动态";
                break;
            case "3":
                lbtxt = "每周时报";
                break;
        }
        if (!IsPostBack)
        {
            string sql;
            sql = "select * from allgonggao where leibie='"+lbtxt +"' order by id desc";
            getdata2(sql);
        }
    }
    private void getdata2(string sql)
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                DataGrid2.DataSource = result.Tables[0];
                DataGrid2.DataBind();
            }
            else
            {
                DataGrid2.DataSource = null;
                DataGrid2.DataBind();
            }
        }
    }
}
