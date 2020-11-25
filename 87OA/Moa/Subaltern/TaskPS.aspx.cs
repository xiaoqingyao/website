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

public partial class Subaltern_TaskHB : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPTaskFP Model = new ZWL.BLL.ERPTaskFP();
            Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.lblTaskTitle.Text = Model.TaskTitle.ToString();
            this.lblTaskContent.Text = Model.TaskContent.ToString();
            this.lblFromUser.Text = Model.FromUser.ToString();
            this.lblToUserList.Text = Model.ToUserList.ToString();
            this.lblXinXiGouTong.Text = Model.XinXiGouTong.ToString();
            this.lblJinDu.Text = Model.JinDu.ToString() + "%";
            this.lblWanCheng.Text = Model.WanCheng.ToString();
            this.lblNowState.Text = Model.NowState.ToString();

            this.DropDownList1.SelectedValue = Model.NowState.ToString();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string SqlStr = "update ERPTaskFP set NowState='" + this.DropDownList1.SelectedValue.Trim() + "',XinXiGouTong='" + GetNowString() + "' where ID=" + Request.QueryString["ID"].ToString();

        ZWL.DBUtility.DbHelperSQL.ExecuteSQL(SqlStr);
        
        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户批示任务信息(" + this.lblTaskTitle.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "任务批示成功！", "TaskFP.aspx");
    }

    public string GetNowString()
    {
        string ReturnStr = "";
        ReturnStr = "批示用户：" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "&nbsp;&nbsp;时间：" + DateTime.Now.ToString() + "&nbsp;&nbsp;任务状态：" + this.DropDownList1.SelectedValue.Trim();        
        ReturnStr =ReturnStr+ "<br>批示内容：" + this.TextBox1.Text.Trim() + "<hr style=\"height:1px; color: #006600;\">" + this.lblXinXiGouTong.Text;

        return ReturnStr;
    }
}
