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
 public partial class SelectDanWei: System.Web.UI.Page
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

            string ChildID = FTD.DBUnit.DbHelperSQL.GetSHSLInt("select top 1 ID from ERPBuMen where DirID=" + MyReader["ID"].ToString() + " order by ID asc");
            if (ChildID.Trim() != "0")
            {
                //需要父项目一起选中，如果父项目不需要的话，请不要注释掉下面的行
                //HaveChild = HaveChild + "|" + MyReader["BuMenName"].ToString() + "|";
            }            
            OrganizationNode.ToolTip = MyReader["BuMenName"].ToString();            
            OrganizationNode.Expand();
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
                    result += sb.ToString() + ",";
                }
                else if (node.Checked)
                {
                    result += node.Text + ",";
                }
            }
        }
        FTD.Unit.MessageBox.Show(this, result);
    }
}
}