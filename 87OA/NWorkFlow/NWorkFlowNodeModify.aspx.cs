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
        //判断开始、结束两个节点的唯一性，中间节点必须指定下一节点
        if (this.DropDownList1.SelectedItem.Text == "开始")
        {
            string ExsistID = ZWL.DBUtility.DbHelperSQL.GetSHSL("select ID from ERPNWorkFlowNode where WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString() + " and NodeAddr='开始' and ID!="+Request.QueryString["ID"].ToString());
            if (ExsistID.Trim().Length > 0)
            {
                ZWL.Common.MessageBox.Show(this, "该流程已经存在“开始”节点，请不要重复添加！");
                return;
            }
        }
        if (this.DropDownList1.SelectedItem.Text == "结束")
        {
            string ExsistID = ZWL.DBUtility.DbHelperSQL.GetSHSL("select ID from ERPNWorkFlowNode where WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString() + " and NodeAddr='结束' and ID!=" + Request.QueryString["ID"].ToString());
            if (ExsistID.Trim().Length > 0)
            {
                ZWL.Common.MessageBox.Show(this, "该流程已经存在“结束”节点，请不要重复添加！");
                return;
            }
        }

        if (this.DropDownList1.SelectedItem.Text == "中间段" || this.DropDownList1.SelectedItem.Text == "开始")
        {
            string ExsistID = this.txtNextNode.Text.Trim();
            if (ExsistID.Trim().Length <= 0)
            {
                ZWL.Common.MessageBox.Show(this, "中间段和开始节点必须指定下一节点序号！");
                return;
            }
        }
        //判断节点序号的唯一性
        string NodeSerils = ZWL.DBUtility.DbHelperSQL.GetSHSL("select ID from ERPNWorkFlowNode where WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString() + " and NodeSerils='" + this.txtNodeSerils.Text.Trim() + "' and ID!=" + Request.QueryString["ID"].ToString());
        if (NodeSerils.Trim().Length > 0)
        {
            ZWL.Common.MessageBox.Show(this, "该节点序号已经存在，请不要重复添加！");
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
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改节点定义信息(" + this.txtNodeName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		ZWL.Common.MessageBox.ShowAndRedirect(this, "节点定义信息修改成功！", "NWorkFlowNode.aspx?WorkFlowID="+Request.QueryString["WorkFLowID"].ToString());
	}
}
