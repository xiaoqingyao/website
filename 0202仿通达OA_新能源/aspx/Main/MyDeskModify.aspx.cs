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

namespace OA.aspx.Main{ 
 public partial class MyDeskModify: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            //绑定页面数据
            FTD.BLL.ERPUserDesk MyModel = new FTD.BLL.ERPUserDesk();
            MyModel.GetModel(int.Parse(FTD.DBUnit.DbHelperSQL.GetSHSLInt("select ID from ERPUserDesk where UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' and ModelName='" + Request.QueryString["ModelName"].ToString() + "'")));
            this.Label1.Text = MyModel.ModelName;
            this.TextBox1.Text = MyModel.LookNum.ToString();
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPUserDesk set LookNum=" + this.TextBox1.Text.Trim() + " where UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' and ModelName='"+this.Label1.Text.ToString()+"'");

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改桌面显示信息(" + this.Label1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "桌面显示设置修改成功！", "MyDesk.aspx");
    }
}
}