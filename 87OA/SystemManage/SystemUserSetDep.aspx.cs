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

public partial class SystemManage_SystemUserSetDep : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            this.Label1.Text = Request.QueryString["UserName"].ToString();
            this.TextBox1.Text = ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 XiaShuUser from ERPUser where UserName='" + Request.QueryString["UserName"].ToString() + "'");
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL("update ERPUser set XiaShuUser='" + this.TextBox1.Text.Trim() + "' where UserName='" + Request.QueryString["UserName"].ToString() + "'");


        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户设置下属员工(" + this.Label1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
        ZWL.Common.MessageBox.ShowAndRedirect(this, "下属员工设置成功！", "SystemUser.aspx");
    }
}
