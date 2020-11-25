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

namespace OA.aspx.Subaltern{ 
 public partial class TaskHB: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPTaskFP Model = new FTD.BLL.ERPTaskFP();
            Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.lblTaskTitle.Text = Model.TaskTitle.ToString();
            this.lblTaskContent.Text = Model.TaskContent.ToString();
            this.lblFromUser.Text = Model.FromUser.ToString();
            this.lblToUserList.Text = Model.ToUserList.ToString();
            this.lblXinXiGouTong.Text = Model.XinXiGouTong.ToString();
            this.lblJinDu.Text = Model.JinDu.ToString() + "%";
            this.lblWanCheng.Text = Model.WanCheng.ToString();
            this.lblNowState.Text = Model.NowState.ToString();
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        string SqlStr = "update ERPTaskFP set JinDu=" + this.txtJinDu.Text.Trim() + ",WanCheng='" + this.txtWanCheng.Text.Trim() + "',XinXiGouTong='"+GetNowString()+"' where ID=" + Request.QueryString["ID"].ToString();

        FTD.DBUnit.DbHelperSQL.ExecuteSQL(SqlStr);
        
        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户汇报任务最新信息(" + this.lblTaskTitle.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "任务最新情况汇报成功！", "Task.aspx");
    }

    public string GetNowString()
    {
        string ReturnStr = "";
        ReturnStr = "汇报用户：" + FTD.Unit.PublicMethod.GetSessionValue("UserName") +"&nbsp;时间：" + DateTime.Now.ToString();        
        ReturnStr = ReturnStr + "&nbsp;最新进度：" + "<img src=\"../../images/vote_bg.gif\" width=" + this.txtJinDu.Text.Trim() + "  height=10 />&nbsp;" + this.txtJinDu.Text.Trim() + "%";
        ReturnStr =ReturnStr+ "<br>完成情况：" + this.txtWanCheng.Text.Trim();
        ReturnStr =ReturnStr+ "<br>汇报内容：" + this.TextBox1.Text.Trim() + "<hr style=\"height:1px; color: #006600;\">" + this.lblXinXiGouTong.Text;

        return ReturnStr;
    }
}
}