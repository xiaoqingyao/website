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
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace OA.aspx.Main{ 
 public partial class SelectUser: System.Web.UI.Page
{
    public string HaveChild = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            BindTree(this.ListTreeView.Nodes, 0);
        }
    }

    private void BindTree(TreeNodeCollection Nds, int IDStr)
    {

        SqlConnection Conn = new SqlConnection(ConfigurationManager.AppSettings["SQLConnectionString"].ToString());


        //SqlConnection Conn = new SqlConnection(ConfigurationManager.AppSettings["SQLConnectionString"].ToString());
        Conn.Open();
        SqlCommand MyCmd = new SqlCommand("select * from ERPBuMen where DirID=" + IDStr.ToString() + " order by ID asc", Conn);
        SqlDataReader MyReader = MyCmd.ExecuteReader();
        while (MyReader.Read())
        {
            TreeNode OrganizationNode = new TreeNode();
            OrganizationNode.Text = MyReader["BuMenName"].ToString();
            OrganizationNode.Value = MyReader["ID"].ToString();
            int strId = int.Parse(MyReader["ID"].ToString());
            OrganizationNode.ImageUrl = "~/images/user_group.gif";
            OrganizationNode.SelectAction =  TreeNodeSelectAction.Expand ;
            //OrganizationNode.Expanded = true;
            //string ChildID = FTD.DBUnit.DbHelperSQL.GetSHSLInt("select top 1 ID from ERPBuMen where DirID=" + MyReader["ID"].ToString() + " order by ID asc");
            //if (ChildID.Trim() != "0")
            //{
                HaveChild = HaveChild + "|" + MyReader["BuMenName"].ToString() + "|";
            //}            
            OrganizationNode.ToolTip = MyReader["BuMenName"].ToString();
            //OrganizationNode.Collapse();

            /////////////////////////////////////////////////////////////////////////////////////////////////////
            //在当前节点下加入用户    
            //SqlConnection Conn1 = new SqlConnection(ConfigurationManager.AppSettings["SQLConnectionString"].ToString());
            SqlConnection Conn1 = new SqlConnection(ConfigurationManager.AppSettings["SQLConnectionString"].ToString());
            Conn1.Open();
            SqlCommand MyCmd1 = new SqlCommand("select * from ERPUser where Department='" + MyReader["BuMenName"].ToString() + "' order by ID asc", Conn1);
            SqlDataReader MyReader1 = MyCmd1.ExecuteReader();
            while (MyReader1.Read())
            {
                TreeNode UserNode = new TreeNode();
                UserNode.Text = MyReader1["UserName"].ToString();
                UserNode.Value = MyReader1["ID"].ToString();
                UserNode.ImageUrl = OnLinePic(MyReader1["ID"].ToString());
                UserNode.ToolTip = MyReader1["UserName"].ToString();
                UserNode.SelectAction = TreeNodeSelectAction.Expand;
                OrganizationNode.ChildNodes.Add(UserNode);
            }
            
            MyReader1.Close();
            Conn1.Close();


            /////////////////////////////////////////////////////////////////////////////////////////////////////



            Nds.Add(OrganizationNode);
            //递归循环
            BindTree(Nds[Nds.Count - 1].ChildNodes, strId);
        }
        MyReader.Close();
        Conn.Close(); 
    }



    protected void btnSelect_Click(object sender, EventArgs e)
    {
        string result = "";
        foreach (TreeNode parent in this.ListTreeView.Nodes)
        {
            foreach (TreeNode node in parent.ChildNodes)
            {
                StringBuilder sb = new StringBuilder();
                foreach (TreeNode subNode in node.ChildNodes)
                {
                    if (subNode.Checked)
                    {
                        sb.AppendFormat("{0},", subNode.Text);
                    }
                }
                if (sb.Length > 0)
                {
                    //sb.Insert(0, string.Format("{0}(", node.Text));
                    //sb.Append(")");
                    //result += sb.ToString().Repla + "," ce(",)", ")") + ";";
                    result += sb.ToString() + ",";
                }
                else if (node.Checked)
                {
                    //result += node.Text ;
                    result += node.Text + ",";
                }
            }
        }
        //TextBox4.Text = result;
        //Response.Write("window.opener=null;window.close()");

        FTD.Unit.MessageBox.Show(this, result);
        //Helper.CloseWin(this, result.Trim(';'));
    }

    private string OnLinePic(string IDStr)
    {
        string ReturnStr = "~/images/U01.gif";
        //判断是否在线
        string OnlineUserName = FTD.DBUnit.DbHelperSQL.GetSHSL("select UserName from ERPUser where ID=" + IDStr + " and datediff(minute,ActiveTime,getdate()) < 10");
        if (OnlineUserName.Trim().Length > 0)
        {
            ReturnStr = "~/images/U01.gif";
        }
        else
        {
            ReturnStr = "~/images/U02.gif";
        }
        return ReturnStr;
    }

    /*
 protected void ListTreeView_TreeNodeExpanded(object sender, TreeNodeEventArgs e)
 {
         //同级只展开一个使用下列程序
         //TreeNodeCollection ts = null;
         if (e.Node.Parent == null)
         {
             ts = ((TreeView)sender).Nodes;
         }
         else
             ts = e.Node.Parent.ChildNodes;
         foreach (TreeNode node in ts)
         {
             if (node != e.Node)
             {
                 node.Collapse();
             }
         } 
         //只展开一个第一级使用下列程序
         TreeNodeCollection ts = null;
         if (e.Node.Parent == null)
         {
             ts = ((TreeView)sender).Nodes;
             foreach (TreeNode node in ts)
             {
                 if (node != e.Node)
                 {
                     node.Collapse();
                 }
             }
         }
 }
 protected void ListTreeView_SelectedNodeChanged(object sender, EventArgs e)
 {
     for (int i = 0; i < this.ListTreeView.Nodes.Count; i++ )
     {
         if (this.ListTreeView.SelectedValue == this.ListTreeView.Nodes[i].Value)
         {
             this.ListTreeView.SelectedNode.Expanded = true;
         }
         else 
         {
             for (int j = 0; j < this.ListTreeView.SelectedNode.Parent.ChildNodes.Count;j++ )
             {
                 this.ListTreeView.SelectedNode.Parent.ChildNodes[j].CollapseAll();

             }
             this.ListTreeView.SelectedNode.Parent.Expanded = true;
             this.ListTreeView.SelectedNode.Expanded  = true;
         }
     }
 }

*/

    protected void Button1_Click(object sender, EventArgs e)
    {
        //string ReturnStr = "";
        

        //Response.Write("<script language=javascript>window.returnValue =\"\";window.close();</script>");
    }
}
}