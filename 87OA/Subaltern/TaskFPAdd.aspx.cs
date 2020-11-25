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

public partial class Subaltern_TaskFPAdd : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			//�����ϴ��ĸ���Ϊ��
			 ZWL.Common.PublicMethod.SetSessionValue("WenJianList", "");
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPTaskFP Model = new ZWL.BLL.ERPTaskFP();
		
		Model.TaskTitle=this.txtTaskTitle.Text.ToString();
		Model.TaskContent=this.txtTaskContent.Text.ToString();
		Model.FromUser=ZWL.Common.PublicMethod.GetSessionValue("UserName");
		Model.ToUserList=this.txtToUserList.Text.ToString();
		Model.XinXiGouTong="";
		Model.JinDu=decimal.Parse("0");
		Model.WanCheng="����";
		Model.NowState="�������";
        Model.KSSJ = DateTime.Parse(this.TextBox3.Text.Trim() + " " + this.DropDownList1.SelectedItem.Text + ":" + this.DropDownList2.SelectedItem.Text + ":00");
        Model.JSSJ = DateTime.Parse(this.TextBox2.Text.Trim() + " " + this.DropDownList3.SelectedItem.Text + ":" + this.DropDownList4.SelectedItem.Text + ":00");
        Model.FKSJ = DateTime.Parse(this.TextBox4.Text.Trim() + " " + this.DropDownList5.SelectedItem.Text + ":" + this.DropDownList6.SelectedItem.Text + ":00");
        Model.SFFK = this.TX.Value;
		Model.Add();

        //���Ͷ���
        SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "�����µ�������Ҫִ�У�(" + this.txtTaskTitle.Text + ")", this.txtToUserList.Text.Trim());

		//дϵͳ��־
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "�û�������������Ϣ(" + this.txtTaskTitle.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		ZWL.Common.MessageBox.ShowAndRedirect(this, "���������Ϣ��ӳɹ���", "TaskFP.aspx");
	}
}
