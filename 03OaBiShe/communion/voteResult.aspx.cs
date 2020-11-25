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

public partial class communion_voteResult : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true);
        GridView1.DataSource = bc.GetDataSet("select * from vote", "vote");
        GridView1.DataKeyNames = new String[] { "id" };
        GridView1.DataBind();

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //清除数据
        bc.ExecSQL("delete  from vote where id='" + this.GridView1.DataKeys[e.RowIndex].Value.ToString() + "'");
        GridView1.DataSource = bc.GetDataSet("select * from vote", "vote");
        GridView1.DataBind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        bc.ExecSQL("update vote set voteQty=0 where id='" + this.GridView1.DataKeys[e.NewEditIndex].Value.ToString() + "'");
        GridView1.DataSource = bc.GetDataSet("select * from vote", "vote");
        GridView1.DataBind();
    }
}
