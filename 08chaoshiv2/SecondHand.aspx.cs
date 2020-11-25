using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SecondHand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindGuid();
        }
    }

    private void bindGuid()
    {
        string sql = "select * from SecondHand order by createdate desc";
        this.GridView1.DataSource = DBHelper.GetDataSet(sql).Tables[0];
        this.GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["MemberName"] == null)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Key", "alert('请先登录!')", true);
            return;
        }
        string sql = "insert into SecondHand([CreateUser],[Title],[Content],[CreateDate],[Phone],[Address],[price])values('" + Session["MemberName"].ToString() + "','" + tTitle.Text.Trim() + "','" + Content.Text.Trim() + "','" + DateTime.Now.ToString() + "','" + Phone.Text.Trim() + "','" + Address.Text.Trim() + "','" + price.Text.Trim() + "')";
        DBHelper.ExecSql(sql);
        bindGuid();
    }
}