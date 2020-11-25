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

public partial class LanEmail_EmailView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();

            ZWL.BLL.ERPLanEmail MyLanEmail = new ZWL.BLL.ERPLanEmail();
            MyLanEmail.GetModel(int.Parse(Request.QueryString["ID"].ToString().Trim()));
            this.Label1.Text = MyLanEmail.EmailTitle;
            this.Label2.Text = MyLanEmail.FromUser;
            this.Label3.Text = MyLanEmail.ToUser;
            this.Label4.Text = MyLanEmail.TimeStr.ToString();
            this.Label5.Text =ZWL.Common.PublicMethod.GetWenJian(MyLanEmail.FuJian,"../UploadFile/");
            this.Label6.Text = MyLanEmail.EmailContent;

            //写系统日志
            ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
            MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户查看邮件(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            //设置为已读
            if (MyLanEmail.ToUser.Trim() == ZWL.Common.PublicMethod.GetSessionValue("UserName").Trim())
            {
                if (MyLanEmail.EmailState == "未读")
                {
                    ZWL.DBUtility.DbHelperSQL.ExecuteSQL("update ERPLanEmail set EmailState='已读' where ID=" + Request.QueryString["ID"].ToString().Trim());
                }
            }
        }
    }
    public void btnDownloadFile_Click(object sender, EventArgs e)
    {
        try
        {
            ZWL.Common.PublicMethod.DownloadFile(Server.MapPath("~"), this.hdnFileURL.Value.Trim());
        }
        catch
        {
        }
    }
}
