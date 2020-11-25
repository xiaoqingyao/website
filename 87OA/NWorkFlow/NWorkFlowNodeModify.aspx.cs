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

public partial class NWorkFlow_NWorkFlowNodeModify : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPNWorkFlowNode Model = new ZWL.BLL.ERPNWorkFlowNode();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));			
			this.txtNodeSerils.Text=Model.NodeSerils.ToString();
			this.txtNodeName.Text=Model.NodeName.ToString();
			this.DropDownList1.SelectedValue=Model.NodeAddr.ToString();
			this.txtNextNode.Text=Model.NextNode.ToString();
			this.DropDownList2.SelectedValue=Model.IFCanJump.ToString();
            this.DropDownList3.SelectedValue = Model.IFCanView.ToString();
            this.DropDownList4.SelectedValue = Model.IFCanEdit.ToString();
            this.DropDownList5.SelectedValue = Model.IFCanDel.ToString();
			this.txtJieShuHours.Text=Model.JieShuHours.ToString();
            this.DropDownList6.SelectedValue = Model.PSType.ToString();
            this.DropDownList7.SelectedValue = Model.SPType.ToString();
			this.txtSPDefaultList.Text=Model.SPDefaultList.ToString();
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
        //�жϿ�ʼ�����������ڵ��Ψһ�ԣ��м�ڵ����ָ����һ�ڵ�
        if (this.DropDownList1.SelectedItem.Text == "��ʼ")
        {
            string ExsistID = ZWL.DBUtility.DbHelperSQL.GetSHSL("select ID from ERPNWorkFlowNode where WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString() + " and NodeAddr='��ʼ' and ID!="+Request.QueryString["ID"].ToString());
            if (ExsistID.Trim().Length > 0)
            {
                ZWL.Common.MessageBox.Show(this, "�������Ѿ����ڡ���ʼ���ڵ㣬�벻Ҫ�ظ���ӣ�");
                return;
            }
        }
        if (this.DropDownList1.SelectedItem.Text == "����")
        {
            string ExsistID = ZWL.DBUtility.DbHelperSQL.GetSHSL("select ID from ERPNWorkFlowNode where WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString() + " and NodeAddr='����' and ID!=" + Request.QueryString["ID"].ToString());
            if (ExsistID.Trim().Length > 0)
            {
                ZWL.Common.MessageBox.Show(this, "�������Ѿ����ڡ��������ڵ㣬�벻Ҫ�ظ���ӣ�");
                return;
            }
        }

        if (this.DropDownList1.SelectedItem.Text == "�м��" || this.DropDownList1.SelectedItem.Text == "��ʼ")
        {
            string ExsistID = this.txtNextNode.Text.Trim();
            if (ExsistID.Trim().Length <= 0)
            {
                ZWL.Common.MessageBox.Show(this, "�м�κͿ�ʼ�ڵ����ָ����һ�ڵ���ţ�");
                return;
            }
        }
        //�жϽڵ���ŵ�Ψһ��
        string NodeSerils = ZWL.DBUtility.DbHelperSQL.GetSHSL("select ID from ERPNWorkFlowNode where WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString() + " and NodeSerils='" + this.txtNodeSerils.Text.Trim() + "' and ID!=" + Request.QueryString["ID"].ToString());
        if (NodeSerils.Trim().Length > 0)
        {
            ZWL.Common.MessageBox.Show(this, "�ýڵ�����Ѿ����ڣ��벻Ҫ�ظ���ӣ�");
            return;
        }

		ZWL.BLL.ERPNWorkFlowNode Model = new ZWL.BLL.ERPNWorkFlowNode();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
        Model.WorkFlowID = int.Parse(Request.QueryString["WorkFlowID"].ToString());
        Model.NodeSerils = this.txtNodeSerils.Text.ToString().Trim();
        Model.NodeName = this.txtNodeName.Text.ToString().Trim();
        Model.NodeAddr = this.DropDownList1.SelectedItem.Text.ToString();
        Model.NextNode = this.txtNextNode.Text.ToString().Trim();
        Model.IFCanJump = this.DropDownList2.SelectedItem.Text.ToString();
        Model.IFCanView = this.DropDownList3.SelectedItem.Text.ToString();
        Model.IFCanEdit = this.DropDownList4.SelectedItem.Text.ToString();
        Model.IFCanDel = this.DropDownList5.SelectedItem.Text.ToString();
        Model.JieShuHours = int.Parse(this.txtJieShuHours.Text.Trim());
        Model.PSType = this.DropDownList6.SelectedItem.Text.ToString();
        Model.SPType = this.DropDownList7.SelectedItem.Text.ToString();
        Model.SPDefaultList = this.txtSPDefaultList.Text.ToString().Trim();
		
		Model.Update();
		
		//дϵͳ��־
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "�û��޸Ľڵ㶨����Ϣ(" + this.txtNodeName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		ZWL.Common.MessageBox.ShowAndRedirect(this, "�ڵ㶨����Ϣ�޸ĳɹ���", "NWorkFlowNode.aspx?WorkFlowID="+Request.QueryString["WorkFLowID"].ToString());
	}
}
