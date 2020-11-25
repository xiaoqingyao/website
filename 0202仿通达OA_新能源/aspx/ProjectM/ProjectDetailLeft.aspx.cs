using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FTD.Web.UI.aspx.ProjectM
{
    public partial class ProjectDetailLeft : System.Web.UI.Page
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

            TreeNode MyNode = new TreeNode();
            MyNode.Text = "新能源汽车";
            MyNode.ToolTip = "新能源汽车";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);

            MyNode = new TreeNode();
            MyNode.Text = "核电";
            MyNode.ToolTip = "核电";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);

            MyNode = new TreeNode();
            MyNode.Text = "智能电网与储能";
            MyNode.ToolTip = "智能电网与储能";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);

            MyNode = new TreeNode();
            MyNode.Text = "氢能";
            MyNode.ToolTip = "氢能";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);

            MyNode = new TreeNode();
            MyNode.Text = "可燃冰";
            MyNode.ToolTip = "可燃冰";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);

            MyNode = new TreeNode();
            MyNode.Text = "海洋能";
            MyNode.ToolTip = "海洋能";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);

            MyNode = new TreeNode();
            MyNode.Text = "风电";
            MyNode.ToolTip = "风电";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
        }

    }
}