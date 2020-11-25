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

namespace OA.aspx.NWorkFlow{ 
 public partial class NWorkToDoSelect: System.Web.UI.Page
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
        DataSet MyDataSet1 = FTD.DBUnit.DbHelperSQL.GetDataSet("select * from ERPNFormType order by PaiXuStr asc,ID desc");
        for (int j = 0; j < MyDataSet1.Tables[0].Rows.Count; j++)
        {
            TreeNode MyNode1 = new TreeNode();
            MyNode1.Text = MyDataSet1.Tables[0].Rows[j]["TypeName"].ToString();
            MyNode1.Value = MyDataSet1.Tables[0].Rows[j]["ID"].ToString();
            MyNode1.ToolTip = MyDataSet1.Tables[0].Rows[j]["BackInfo"].ToString();
            MyNode1.ImageUrl = "../../images/Dir.gif";
            MyNode1.SelectAction = TreeNodeSelectAction.Expand;
            MyNode1.Expanded = true;
            //MyNode1.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode1);

            //~~~~~~~~~~~~~插入表单子节点
            DataSet MyDataSet = FTD.DBUnit.DbHelperSQL.GetDataSet("select * from ERPNForm where IFOK='是' and TypeID=" + MyDataSet1.Tables[0].Rows[j]["ID"].ToString() + " order by PaiXuStr asc, ID desc");
            for (int jj = 0; jj < MyDataSet.Tables[0].Rows.Count; jj++)
            {
                if (CheckIFOK(MyDataSet.Tables[0].Rows[jj]["UserListOK"].ToString(), MyDataSet.Tables[0].Rows[jj]["DepListOK"].ToString(), MyDataSet.Tables[0].Rows[jj]["JiaoSeListOK"].ToString()) == true)
                {
                    TreeNode MyNode = new TreeNode();
                    MyNode.Text = MyDataSet.Tables[0].Rows[jj]["FormName"].ToString();
                    MyNode.Value = MyDataSet.Tables[0].Rows[jj]["ID"].ToString();
                    MyNode.ImageUrl = "../../images/Dir.gif";
                    MyNode.SelectAction = TreeNodeSelectAction.Expand;
                    MyNode.Expanded = true;
                    //MyNode.Target = "Mid2";
                    this.ListTreeView.Nodes[this.ListTreeView.Nodes.Count - 1].ChildNodes.Add(MyNode);

                    DataSet MyDataSetWorkFlow = FTD.DBUnit.DbHelperSQL.GetDataSet("select * from ERPNWorkFlow where IFOK='是' and  FormID=" + MyDataSet.Tables[0].Rows[jj]["ID"].ToString() + " order by PaiXuStr asc, ID desc");
                    for (int k = 0; k < MyDataSetWorkFlow.Tables[0].Rows.Count; k++)
                    {
                        if (CheckIFOK(MyDataSetWorkFlow.Tables[0].Rows[k]["UserListOK"].ToString(), MyDataSetWorkFlow.Tables[0].Rows[k]["DepListOK"].ToString(), MyDataSetWorkFlow.Tables[0].Rows[k]["JiaoSeListOK"].ToString()) == true)
                        {
                            TreeNode MyNode2 = new TreeNode();
                            MyNode2.Text = MyDataSetWorkFlow.Tables[0].Rows[k]["WorkFlowName"].ToString() + "&nbsp;&nbsp;<a class=\"BlueCss\" href=NWorkToDoAdd.aspx?FormID=" + MyDataSet.Tables[0].Rows[jj]["ID"].ToString() + "&WorkFlowID=" + MyDataSetWorkFlow.Tables[0].Rows[k]["ID"].ToString() + ">[点此新建工作]</a>";
                            MyNode2.Value = MyDataSetWorkFlow.Tables[0].Rows[k]["ID"].ToString();
                            MyNode2.ImageUrl = "../../images/TreeImages/workflow.gif";
                            MyNode2.NavigateUrl = "NWorkToDoAdd.aspx?FormID=" + MyDataSet.Tables[0].Rows[jj]["ID"].ToString() + "&WorkFlowID=" + MyDataSetWorkFlow.Tables[0].Rows[k]["ID"].ToString();
                            //MyNode2.Target = "Mid2";
                            this.ListTreeView.Nodes[this.ListTreeView.Nodes.Count - 1].ChildNodes[this.ListTreeView.Nodes[this.ListTreeView.Nodes.Count - 1].ChildNodes.Count - 1].ChildNodes.Add(MyNode2);
                        }
                    }
                }
            }
        }
    }

    public bool CheckIFOK(string YunXuUser,string YunXuBuMen, string YunXuJiaoSe)
    {
        //admin      超级管理员,外部企业      admin,,zzz    超级管理员,外部企业,一般员工        
        if (YunXuUser == "全部" || YunXuBuMen == "全部" || YunXuJiaoSe=="全部")
        {
            //在允许字段中
            return true;
        }
        else if (FTD.Unit.PublicMethod.StrIFIn("," + FTD.Unit.PublicMethod.GetSessionValue("UserName") + ",", "," + YunXuUser + ",") == true)
        {
            //在允许字段中
            return true;
        }
        else
        {
            string[] JiaoSeArray = FTD.Unit.PublicMethod.GetSessionValue("JiaoSe").Split(',');
            for (int jk = 0; jk < JiaoSeArray.Length; jk++)
            {
                if (FTD.Unit.PublicMethod.StrIFIn("," + JiaoSeArray[jk] + ",", "," + YunXuJiaoSe + ",") == true)
                {
                    return true;
                }
            }

            string[] BuMenArray = FTD.Unit.PublicMethod.GetSessionValue("Department").Split(',');
            for (int jk = 0; jk < JiaoSeArray.Length; jk++)
            {
                if (FTD.Unit.PublicMethod.StrIFIn("," + BuMenArray[jk] + ",", "," + YunXuBuMen + ",") == true)
                {
                    return true;
                }
            }

            return false;
        }
    }
}
}