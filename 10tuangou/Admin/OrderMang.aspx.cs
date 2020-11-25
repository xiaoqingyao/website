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

public partial class Admin_OrderMang : System.Web.UI.Page
{
    CtlOrder co = new CtlOrder();
    public static string sql;//
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            sql = "select * from vwOrderProduct";
            gvbinding(sql);
        }
    }
    protected void ibtnSreach_Click(object sender, ImageClickEventArgs e)
    {
        if (ddltype.SelectedValue == "1")//定单号
        {
            sql = "select * from vwOrderProduct where orderId='" + this.txtSechCompanyName.Text.Trim() + "'";
        }
        if (ddltype.SelectedValue == "2")//用户名
        {
            sql = "select * from vwOrderProduct where perName like'%" + this.txtSechCompanyName.Text.Trim() + "%'";
        }
        if (ddltype.SelectedValue == "3")//产品名
        {
            sql = "select * from vwOrderProduct where productName like'%" + this.txtSechCompanyName.Text.Trim() + "%'";
        }
        gvbinding(sql);
    }
    private void gvbinding(string sql)
    {
        DataTable dt = new DataTable();
        dt = co.selectOrder(sql);
        this.gvOrder.DataSource = dt;
        this.gvOrder.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = ((Button)sender).CommandArgument;

        new SqlHelper().ExecuteNonQuery("update g_order set state='已通过' where orderid='" + id + "'");
        Response.Redirect("OrderMang.aspx");
    }
}
