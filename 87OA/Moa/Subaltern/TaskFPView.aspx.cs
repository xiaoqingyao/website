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

public partial class Subaltern_TaskFPView : System.Web.UI.Page
{
    public int id = 0;

	protected void Page_Load(object sender, EventArgs e)
	{
        id = int.Parse(Request.QueryString["ID"].ToString());
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPTaskFP Model = new ZWL.BLL.ERPTaskFP();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblTaskTitle.Text=Model.TaskTitle.ToString();
			this.lblTaskContent.Text=Model.TaskContent.ToString();
			this.lblFromUser.Text=Model.FromUser.ToString();
			this.lblToUserList.Text=Model.ToUserList.ToString();
			this.lblXinXiGouTong.Text=Model.XinXiGouTong.ToString();
			this.lblJinDu.Text=Model.JinDu.ToString()+"%";
			this.lblWanCheng.Text=Model.WanCheng.ToString();
			this.lblNowState.Text=Model.NowState.ToString();
            this.Label1.Text = Model.KSSJ.ToString();
            this.Label2.Text = Model.JSSJ.ToString();
            this.Label3.Text = Model.SFFK.ToString();
            this.Label4.Text = Model.FKSJ.ToString();
           
			//дϵͳ��־
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "�û��鿴���������Ϣ(" + this.lblTaskTitle.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
       
	}
    protected void Button1_Click(object sender, EventArgs e)
    {
        string SqlStr = "update ERPTaskFP set JinDu=" + this.txtJinDu.Text.Trim() + ",WanCheng='" + this.txtWanCheng.Text.Trim() + "',XinXiGouTong='" + GetNowString() + "' where ID=" + Request.QueryString["ID"].ToString();

        ZWL.DBUtility.DbHelperSQL.ExecuteSQL(SqlStr);

        //дϵͳ��־
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "�û��㱨����������Ϣ(" + this.lblTaskTitle.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "������������㱨�ɹ���", "Task.aspx");
    }

    public string GetNowString()
    {
        string ReturnStr = "";
        ReturnStr = "�㱨�û���" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "&nbsp;&nbsp;ʱ�䣺" + DateTime.Now.ToString();
        ReturnStr = ReturnStr + "&nbsp;&nbsp;���½��ȣ�" + "<img src=\"../images/vote_bg.gif\" width=" + this.txtJinDu.Text.Trim() + "  height=10 />&nbsp;" + this.txtJinDu.Text.Trim() + "%";
        ReturnStr = ReturnStr + "<br>��������" + this.txtWanCheng.Text.Trim();
        ReturnStr = ReturnStr + "<br>�㱨���ݣ�" + this.TextBox1.Text.Trim() + "<hr style=\"height:1px; color: #006600;\">" + this.lblXinXiGouTong.Text;

        return ReturnStr;
    }
}
