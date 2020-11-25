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

public partial class communion_setVote : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool bl=bc.ExecSQL("INSERT INTO vote (voteTitle, voteContent) VALUES ('" + TextBox1.Text + "','" + TextBox2.Text + "')");
        if (bl)
        {
            Response.Write(bc.MessageBox("数据提交成功！"));
        }
        else 
        {
            Response.Write(bc.MessageBox("网络故障，数据提交失败！"));
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }
}
