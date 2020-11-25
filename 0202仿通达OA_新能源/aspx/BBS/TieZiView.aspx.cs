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

namespace OA.aspx.BBS{ 
 public partial class TieZiView: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();

            FTD.BLL.ERPBBSTieZi MyModel = new FTD.BLL.ERPBBSTieZi();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label4.Text = MyModel.TitleStr;
            this.Label3.Text = MyModel.ContentStr;
            this.Label2.Text = MyModel.TimeStr.ToString();
            this.Label1.Text = MyModel.UserName;

            this.Label5.Text = MyModel.HuiFuContent;

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户查看论坛帖子信息(" + this.Label4.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (this.TxtContent.Text.Trim() != "")
        {
            string HuiFuStr = "<table><tr><td></td></tr></table><table style=\"width: 100%\" bgcolor=\"#999999\" border=\"0\" cellpadding=\"2\" cellspacing=\"1\"><tr><td align=\"center\" valign=\"top\" style=\"width: 170px; height: 25px; background-color: #ffffff\"><br><img src=\"../../images/Button/Man.gif\" align=\"absMiddle\" /><font color=\"#0000C0\" style=\" font-weight:bold\">"+FTD.Unit.PublicMethod.GetSessionValue("UserName")+"</font><br></td><td style=\"padding-left: 5px; background-color: #ffffff\" rowspan=\"2\" valign=\"top\">"+this.TxtContent.Text+"</td></tr><tr><td align=\"center\" valign=\"top\"  style=\"width: 170px; height: 25px; background-color: #ffffff\"><br>"+DateTime.Now.ToString()+"<br></td></tr></table>";
            string SqlStr = "update ERPBBSTieZi set ZuiHouTime='"+DateTime.Now.ToString()+"',ZuiHouUser='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "',HuiFuContent='" + this.Label5.Text + HuiFuStr + "' where ID=" + Request.QueryString["ID"].ToString();
            FTD.DBUnit.DbHelperSQL.ExecuteSQL(SqlStr);
            FTD.Unit.MessageBox.Show(this, "信息回复成功！");

            this.Label5.Text =this.Label5.Text+HuiFuStr;

            this.TxtContent.Text = "";
        }
        else
        {
            FTD.Unit.MessageBox.Show(this, "回复的内容不可以为空！");
            this.TxtContent.Text = "";
        }
    }
}}