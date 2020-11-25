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

public partial class UserControl_QueryUC : System.Web.UI.UserControl
{
	protected string Body = "";

    protected void Page_Load(object sender, EventArgs e) {
        if (!Page.IsPostBack) {
            BindNotifyData();
        }
    }

	private void BindNotifyData()
	{
        //查询物业公司信息显示在页面上
        DataTable dt = new DataTable();
        dt = SQL.GetTable("select * from 物业公司信息");
        if (dt.Rows.Count > 0) {
            Label1.Text = dt.Rows[0]["公司名称"].ToString();
            Label2.Text = dt.Rows[0]["公司规模"].ToString();
            Label3.Text = dt.Rows[0]["负责人"].ToString();
            Label4.Text = dt.Rows[0]["联系电话"].ToString();
            Label5.Text = dt.Rows[0]["公司地址"].ToString();
			Session["info"] = dt.Rows[0]["物业公司介绍"].ToString();
        }
	}
}
