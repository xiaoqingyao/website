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

public partial class Main_SmsShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPLanEmail MyLanEmail = new ZWL.BLL.ERPLanEmail();

            //获得最新的一个未读ID
            int NewMailID = int.Parse(ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select top 1 ID from ERPLanEmail where ToUser='" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "' and EmailState='未读' order by ID desc"));
            MyLanEmail.GetModel(NewMailID);
            this.Label5.Text = MyLanEmail.EmailTitle;
            this.Label2.Text = MyLanEmail.FromUser;
            this.Label4.Text = MyLanEmail.ToUser;
            this.Label3.Text = MyLanEmail.TimeStr.ToString();
            this.Label6.Text = MyLanEmail.EmailContent + "<br>" + ZWL.Common.PublicMethod.GetWenJian(MyLanEmail.FuJian, "../UploadFile/");
            this.Label7.Text = NewMailID.ToString();
            //新邮件个数
            this.Label1.Text = ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select count(*) from ERPLanEmail where ToUser='" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "' and EmailState='未读'");

            this.HyperLink1.NavigateUrl = "../LanEmail/EmailView.aspx?ID=" + NewMailID.ToString();
        }
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL("update ERPLanEmail set EmailState='已读' where ID="+this.Label7.Text.Trim());
        Response.Write("<script>window.close();</script>");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL("update ERPLanEmail set EmailState='删除' where ID=" + this.Label7.Text.Trim());
        Response.Write("<script>window.close();</script>");
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
