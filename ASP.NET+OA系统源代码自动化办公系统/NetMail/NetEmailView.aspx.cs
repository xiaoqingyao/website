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

public partial class NetMail_NetEmailView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();

            SDLX.BLL.ERPNetEmail MyLanEmail = new SDLX.BLL.ERPNetEmail();
            MyLanEmail.GetModel(int.Parse(Request.QueryString["ID"].ToString().Trim()));
            this.Label1.Text = MyLanEmail.EmailTitle;
            this.Label2.Text = MyLanEmail.FromUser;
            this.Label3.Text = MyLanEmail.ToUser;
            this.Label4.Text = MyLanEmail.TimeStr.ToString();
            this.Label5.Text = SDLX.Common.PublicMethod.GetWenJian(MyLanEmail.FuJian, "../UploadFile/");
            this.Label6.Text = MyLanEmail.EmailContent;

            //写系统日志
            SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
            MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户查看邮件(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            //设置为已读
            if (MyLanEmail.ToUser.Trim() == SDLX.Common.PublicMethod.GetSessionValue("UserName").Trim())
            {
                if (MyLanEmail.EmailState == "未读")
                {
                    SDLX.DBUtility.DbHelperSQL.ExecuteSQL("update ERPNetEmail set EmailState='已读' where ID=" + Request.QueryString["ID"].ToString().Trim());
                }
            }
        }
    }
}
