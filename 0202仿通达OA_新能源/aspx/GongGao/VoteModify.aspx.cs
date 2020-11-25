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

namespace OA.aspx.GongGao{ 
 public partial class VoteModify: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPVote MyModel = new FTD.BLL.ERPVote();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.TextBox1.Text = MyModel.TitleStr;
            this.TextBox2.Text = MyModel.ContentStr;
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPVote Model = new FTD.BLL.ERPVote();
        Model.TitleStr = this.TextBox1.Text;
        Model.ContentStr = this.TextBox2.Text;
        Model.ScoreStr = "";
        for (int i = 0; i < Model.ContentStr.Split('|').Length; i++)
        {
            if (Model.ScoreStr.Trim().Length > 0)
            {
                Model.ScoreStr = Model.ScoreStr + "|0";
            }
            else
            {
                Model.ScoreStr = "0";
            }
        }
        Model.ID = int.Parse(Request.QueryString["ID"].ToString());
        Model.Update();

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改投票信息(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
        FTD.Unit.MessageBox.ShowAndRedirect(this, "投票信息修改成功！", "Vote.aspx");
    }
}}