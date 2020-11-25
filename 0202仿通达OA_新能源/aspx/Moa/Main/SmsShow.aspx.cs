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

namespace OA.aspx.Moa.Main{ 
 public partial class SmsShow: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPLanEmail MyLanEmail = new FTD.BLL.ERPLanEmail();

            //获得最新的一个未读ID
            int NewMailID = int.Parse(FTD.DBUnit.DbHelperSQL.GetSHSLInt("select top 1 ID from ERPLanEmail where ToUser='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' and EmailState='未读' order by ID desc"));
            MyLanEmail.GetModel(NewMailID);
            this.Label5.Text = MyLanEmail.EmailTitle;
            this.Label2.Text = MyLanEmail.FromUser;
            this.Label4.Text = MyLanEmail.ToUser;
            this.Label3.Text = MyLanEmail.TimeStr.ToString();
            this.Label6.Text = MyLanEmail.EmailContent + "<br>" + FTD.Unit.PublicMethod.GetWenJian(MyLanEmail.FuJian, "../../UploadFile/");
            this.Label7.Text = NewMailID.ToString();
            //新邮件个数
            this.Label1.Text = FTD.DBUnit.DbHelperSQL.GetSHSLInt("select count(*) from ERPLanEmail where ToUser='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' and EmailState='未读'");

            this.HyperLink1.NavigateUrl = "../LanEmail/EmailView.aspx?ID=" + NewMailID.ToString();
        }
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPLanEmail set EmailState='已读' where ID="+this.Label7.Text.Trim());
        Response.Write("<script>window.close();</script>");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPLanEmail set EmailState='删除' where ID=" + this.Label7.Text.Trim());
        Response.Write("<script>window.close();</script>");
    }
}
}