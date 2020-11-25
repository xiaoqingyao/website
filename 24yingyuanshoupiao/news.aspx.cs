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

public partial class news : System.Web.UI.Page
{
    public string sql, lbtxt, lb;
    protected void Page_Load(object sender, EventArgs e)
    {
        lb = Request.QueryString["lb"].ToString().Trim();  //类别为提交来的参数,即分为新闻中心和网站规章
        switch (lb)
        {
            case "1":
                lbtxt = "站内新闻";
                break;
            

        }
        if (!IsPostBack)
        {
            sql = "select id,title,addtime,leibie from allgonggao where leibie='" + lbtxt + "' order by id desc";
            getdata(sql);

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
    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        sql = "select id,title,addtime,leibie from allgonggao order by id desc";
        getdata(sql);
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        DataGrid1.DataBind();
    }
}
