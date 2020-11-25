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

public partial class GongGao_VoteAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();            
        }
    }
    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        SDLX.BLL.ERPVote Model = new SDLX.BLL.ERPVote();
        Model.TitleStr = this.TextBox1.Text;
        Model.ContentStr = this.TextBox2.Text;
        Model.TimeStr = DateTime.Now;
        Model.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
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
        Model.Add();

        //写系统日志
        SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
        MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加投票信息(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
        SDLX.Common.MessageBox.ShowAndRedirect(this, "投票信息添加成功！", "Vote.aspx");
    }
}
