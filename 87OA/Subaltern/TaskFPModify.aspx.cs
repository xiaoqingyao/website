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

public partial class Subaltern_TaskFPModify : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPTaskFP Model = new ZWL.BLL.ERPTaskFP();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtTaskTitle.Text=Model.TaskTitle.ToString();
			this.txtTaskContent.Text=Model.TaskContent.ToString();
			this.txtFromUser.Text=Model.FromUser.ToString();
			this.txtToUserList.Text=Model.ToUserList.ToString();
			this.txtXinXiGouTong.Text=Model.XinXiGouTong.ToString();
			this.txtJinDu.Text=Model.JinDu.ToString();
			this.txtWanCheng.Text=Model.WanCheng.ToString();
			this.DropDownList1.SelectedValue=Model.NowState.ToString();
            this.TextBox2.Text = Model.KSSJ.ToString().Split(' ')[0];
            this.DropDownList2.SelectedValue = DateTime.Parse(Model.KSSJ.ToString()).Hour.ToString("D2");
            this.DropDownList3.SelectedValue = DateTime.Parse(Model.KSSJ.ToString()).Minute.ToString("D2");

            this.TextBox3.Text = Model.JSSJ.ToString().Split(' ')[0];
            this.DropDownList4.SelectedValue = DateTime.Parse(Model.JSSJ.ToString()).Hour.ToString("D2");
            this.DropDownList5.SelectedValue = DateTime.Parse(Model.JSSJ.ToString()).Minute.ToString("D2");

            this.TextBox4.Text = Model.FKSJ.ToString().Split(' ')[0];
            this.DropDownList6.SelectedValue = DateTime.Parse(Model.FKSJ.ToString()).Hour.ToString("D2");
            this.DropDownList7.SelectedValue = DateTime.Parse(Model.FKSJ.ToString()).Minute.ToString("D2");
            this.TX.Value = Model.SFFK;
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPTaskFP Model = new ZWL.BLL.ERPTaskFP();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.TaskTitle=this.txtTaskTitle.Text.ToString();
		Model.TaskContent=this.txtTaskContent.Text.ToString();
		Model.FromUser=this.txtFromUser.Text.ToString();
		Model.ToUserList=this.txtToUserList.Text.ToString();
		Model.XinXiGouTong=this.txtXinXiGouTong.Text.ToString();
		Model.JinDu=decimal.Parse(this.txtJinDu.Text);
		Model.WanCheng=this.txtWanCheng.Text.ToString();
        Model.NowState = this.DropDownList1.SelectedValue.ToString();
        Model.KSSJ = DateTime.Parse(this.TextBox3.Text.Trim() + " " + this.DropDownList2.SelectedItem.Text + ":" + this.DropDownList3.SelectedItem.Text + ":00");
        Model.JSSJ = DateTime.Parse(this.TextBox2.Text.Trim() + " " + this.DropDownList4.SelectedItem.Text + ":" + this.DropDownList5.SelectedItem.Text + ":00");
        Model.FKSJ = DateTime.Parse(this.TextBox4.Text.Trim() + " " + this.DropDownList6.SelectedItem.Text + ":" + this.DropDownList7.SelectedItem.Text + ":00");
        Model.SFFK = this.TX.Value;
		Model.Update();

        //���Ͷ���
        SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "�����µ�������Ҫִ�У�(" + this.txtTaskTitle.Text + ")", this.txtToUserList.Text.Trim());

		//дϵͳ��־
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "�û��޸����������Ϣ(" + this.txtTaskTitle.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		ZWL.Common.MessageBox.ShowAndRedirect(this, "���������Ϣ�޸ĳɹ���", "TaskFP.aspx");
	}
}
