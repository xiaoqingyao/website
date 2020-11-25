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

public partial class BaseInfo_notice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BaseClass bc = new BaseClass();
        if (TextBox2.Text == "" && TextBox1.Text == "")
        {
            Response.Write(bc.MessageBox("标题和内容不能为空！"));
            return;
        }

        bool bl;
        string str = Convert.ToString(Session["loginName"]);
        bl = bc.ExecSQL("insert into notice values('" + TextBox1.Text + "','" + DateTime.Today.ToString("yyyy-MM-dd") + "','" + str + "','" + TextBox2.Text + "')");
        if (bl)
        {
            Response.Write(bc.MessageBox("－公告发布－成功！"));
        }
        else
        {
            Response.Write(bc.MessageBox("由于网络故障信息－公告发布－失败！"));
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }
}
