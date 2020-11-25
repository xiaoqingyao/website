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

public partial class save_analysis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "个人储蓄";

        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (TextBox3.Text == "" || TextBox5.Text=="")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('数值不能为空！');</script>");
            return;
        }
        Label2.Text = "共得利息：" + decimal.Round((decimal.Parse(TextBox3.Text) * decimal.Parse("0.0035")*decimal.Parse(TextBox5.Text)), 2).ToString() + "元";
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        if (TextBox4.Text == "" || TextBox6.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('数值不能为空！');</script>");
            return;
        }

        decimal temp = 0;
        if (decimal.Parse(TextBox6.Text) < 2)
        {
            temp = decimal.Parse("0.03");
        }
        else if (decimal.Parse(TextBox6.Text) < 3)
        {
            temp = decimal.Parse("0.0375");
        }
        else
        {
            temp = decimal.Parse("0.0425");
        }
        Label4.Text = "共得利息：" + decimal.Round((decimal.Parse(TextBox4.Text) * temp * decimal.Parse(TextBox6.Text)), 2).ToString() + "元";
    }
}
