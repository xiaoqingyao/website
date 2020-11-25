using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserManger_AmountTj : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Alert.AlertAndRedirect("对不起您没有登录！", "Login.aspx");

            }

            GetInfo();

        }
    }
    private void GetInfo()
    {
        string sql = "select accountname,SUM(case flag when 0 then -amount else amount end) je from AccountFundFlow where addUserId='" + Session["UserId"] + "' group by accountname";
        this.GvInfo.DataSource = data.GetDs(sql, "a");
        this.GvInfo.DataBind();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddAccountFundFlow.aspx");
    }
}