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

public partial class NWorkFlow_NFormList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindTree();
        }
    }
    private void BindTree()
    {
        //先绑定所有分类，作为根节点
        DataSet MyDataSet1 = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPNFormType order by PaiXuStr asc,ID desc");
        for (int j = 0; j < MyDataSet1.Tables[0].Rows.Count; j++)
        {
            TreeNode MyNode1 = new TreeNode();
            MyNode1.Text = MyDataSet1.Tables[0].Rows[j]["TypeName"].ToString();
            MyNode1.Value = MyDataSet1.Tables[0].Rows[j]["ID"].ToString();
            MyNode1.ToolTip = MyDataSet1.Tables[0].Rows[j]["BackInfo"].ToString();
            MyNode1.ImageUrl = "../images/Dir.gif";
            MyNode1.SelectAction = TreeNodeSelectAction.Expand;
            MyNode1.Expanded = true;
            MyNode1.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode1);

            //~~~~~~~~~~~~~插入表单子节点
            DataSet MyDataSet = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPNForm where TypeID=" + MyDataSet1.Tables[0].Rows[j]["ID"].ToString() + " order by PaiXuStr asc, ID desc");
            for (int jj = 0; jj < MyDataSet.Tables[0].Rows.Count; jj++)
            {
                TreeNode MyNode = new TreeNode();
                MyNode.Text = MyDataSet.Tables[0].Rows[jj]["FormName"].ToString();
                MyNode.Value = MyDataSet.Tables[0].Rows[jj]["ID"].ToString();                
                MyNode.ImageUrl = "../images/child.gif";
                MyNode.NavigateUrl = "NWorkFlow.aspx?FormID=" + MyDataSet.Tables[0].Rows[jj]["ID"].ToString();
                MyNode.Target = "Mid2";
                this.ListTreeView.Nodes[this.ListTreeView.Nodes.Count-1].ChildNodes.Add(MyNode);
            }
        }        
    }
}
