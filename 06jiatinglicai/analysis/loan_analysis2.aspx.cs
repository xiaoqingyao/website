using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class loan_analysis2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "个人贷款";
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (TextBox3.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('数值不能为空！');</script>");
            return;
        }
        Label2.Text = "结果为：" + decimal.Round((decimal.Parse(TextBox3.Text) / decimal.Parse("3.433")), 2).ToString() + "元";
    }      
}
