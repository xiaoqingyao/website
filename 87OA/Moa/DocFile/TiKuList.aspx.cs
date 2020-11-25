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

public partial class DocFile_TiKuList : System.Web.UI.Page
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
        DataSet MyDataSet1 = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKuType order by PaiXu asc,ID desc");
        for (int j = 0; j < MyDataSet1.Tables[0].Rows.Count; j++)
        {
            TreeNode MyNode1 = new TreeNode();
            MyNode1.Text = MyDataSet1.Tables[0].Rows[j]["TiKuName"].ToString();
            MyNode1.Value = MyDataSet1.Tables[0].Rows[j]["ID"].ToString();
            MyNode1.ImageUrl = "../images/Dir.gif";
            MyNode1.SelectAction = TreeNodeSelectAction.Expand;
            MyNode1.Expanded = false;
            MyNode1.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode1);

            //~~~~~~~~~~~~~插入表单子节点，判断题、单项选择题、多项选择题、填空题、简答题

            TreeNode MyNode2 = new TreeNode();
            MyNode2.Text = "判断题";
            MyNode2.Value = "判断题";
            MyNode2.ImageUrl = "../images/child.gif";
            MyNode2.NavigateUrl = "TiKu.aspx?TiKuID=" + MyDataSet1.Tables[0].Rows[j]["ID"].ToString() + "&FenLeiStr=判断题";
            MyNode2.Target = "Mid2";
            this.ListTreeView.Nodes[this.ListTreeView.Nodes.Count - 1].ChildNodes.Add(MyNode2);

            TreeNode MyNode3 = new TreeNode();
            MyNode3.Text = "单项选择题";
            MyNode3.Value = "单项选择题";
            MyNode3.ImageUrl = "../images/child.gif";
            MyNode3.NavigateUrl = "TiKu.aspx?TiKuID=" + MyDataSet1.Tables[0].Rows[j]["ID"].ToString() + "&FenLeiStr=单项选择题";
            MyNode3.Target = "Mid2";
            this.ListTreeView.Nodes[this.ListTreeView.Nodes.Count - 1].ChildNodes.Add(MyNode3);

            TreeNode MyNode4 = new TreeNode();
            MyNode4.Text = "多项选择题";
            MyNode4.Value = "多项选择题";
            MyNode4.ImageUrl = "../images/child.gif";
            MyNode4.NavigateUrl = "TiKu.aspx?TiKuID=" + MyDataSet1.Tables[0].Rows[j]["ID"].ToString() + "&FenLeiStr=多项选择题";
            MyNode4.Target = "Mid2";
            this.ListTreeView.Nodes[this.ListTreeView.Nodes.Count - 1].ChildNodes.Add(MyNode4);

            TreeNode MyNode5 = new TreeNode();
            MyNode5.Text = "填空题";
            MyNode5.Value = "填空题";
            MyNode5.ImageUrl = "../images/child.gif";
            MyNode5.NavigateUrl = "TiKu.aspx?TiKuID=" + MyDataSet1.Tables[0].Rows[j]["ID"].ToString() + "&FenLeiStr=填空题";
            MyNode5.Target = "Mid2";
            this.ListTreeView.Nodes[this.ListTreeView.Nodes.Count - 1].ChildNodes.Add(MyNode5);

            TreeNode MyNode6 = new TreeNode();
            MyNode6.Text = "简答题";
            MyNode6.Value = "简答题";
            MyNode6.ImageUrl = "../images/child.gif";
            MyNode6.NavigateUrl = "TiKu.aspx?TiKuID=" + MyDataSet1.Tables[0].Rows[j]["ID"].ToString() + "&FenLeiStr=简答题";
            MyNode6.Target = "Mid2";
            this.ListTreeView.Nodes[this.ListTreeView.Nodes.Count - 1].ChildNodes.Add(MyNode6);

        }
    }
}
