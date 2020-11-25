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

public partial class gg_list : System.Web.UI.Page
{
    public string sql, lb, lbtxt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lb = Request.QueryString["lb"].ToString().Trim();  //此处与gg_add.aspx.cs一样
            switch (lb)
            {
                case "1":
                    lbtxt = "新闻中心";
                    break;
                case "2":
                    lbtxt = "网站规章";
                    break;

            }
            //sql语句意思:查找所有符合要求的数据
            sql = "select * from allgonggao where leibie='" + lbtxt + "' order by id desc";
            getdata(sql);//调用getdata,为了得到数据
        }
    }
    private void getdata(string sql)  //自定义函数getdata,用于读取数据,并将值绑定在datagrid中
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
}
