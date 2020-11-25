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

namespace OA.aspx.SystemManage{ 
 public partial class SystemUserSetDep: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            this.Label1.Text = Request.QueryString["UserName"].ToString();
            this.TextBox1.Text = FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 XiaShuUser from ERPUser where UserName='" + Request.QueryString["UserName"].ToString() + "'");
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPUser set XiaShuUser='" + this.TextBox1.Text.Trim() + "' where UserName='" + Request.QueryString["UserName"].ToString() + "'");


        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户设置下属员工(" + this.Label1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
        FTD.Unit.MessageBox.ShowAndRedirect(this, "下属员工设置成功！", "SystemUser.aspx");
    }
}
}