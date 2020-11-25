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

public partial class Main_MyDeskModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();
            //绑定页面数据
            SDLX.BLL.ERPUserDesk MyModel = new SDLX.BLL.ERPUserDesk();
            MyModel.GetModel(int.Parse(SDLX.DBUtility.DbHelperSQL.GetSHSLInt("select ID from ERPUserDesk where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' and ModelName='" + Request.QueryString["ModelName"].ToString() + "'")));
            this.Label1.Text = MyModel.ModelName;
            this.TextBox1.Text = MyModel.LookNum.ToString();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        SDLX.DBUtility.DbHelperSQL.ExecuteSQL("update ERPUserDesk set LookNum=" + this.TextBox1.Text.Trim() + " where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' and ModelName='"+this.Label1.Text.ToString()+"'");

        //写系统日志
        SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
        MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改桌面显示信息(" + this.Label1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        SDLX.Common.MessageBox.ShowAndRedirect(this, "桌面显示设置修改成功！", "MyDesk.aspx");
    }
}
