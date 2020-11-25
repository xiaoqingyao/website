using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FTD.Web.UI.aspx.ProjectM
{
    public partial class UserSetLeft : System.Web.UI.Page
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
            MyNode.Text = "山东赛克赛斯氢能源PEM制氢项目"; 
            MyNode.ToolTip = "山东赛克赛斯氢能源PEM制氢项目";
            MyNode.ImageUrl = "../../images/Dir.gif"; 
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
            MyNode = new TreeNode();
            MyNode.Text = "山东潍坊抽水蓄能电站";
            MyNode.ToolTip = "山东潍坊抽水蓄能电站";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
            MyNode = new TreeNode();
            MyNode.Text = "蓝科途新能源锂电池隔膜项目";
            MyNode.ToolTip = "蓝科途新能源锂电池隔膜项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
            MyNode = new TreeNode();
            MyNode.Text = "泰开集团新能源箱变项目";
            MyNode.ToolTip = "泰开集团新能源箱变项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);

            MyNode = new TreeNode();
            MyNode.Text = "可燃冰勘探开发技术体系和装备体系";
            MyNode.ToolTip = "泰开集团新能源箱变项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);

            MyNode = new TreeNode();
            MyNode.Text = "山东潍坊抽水蓄能电站";
            MyNode.ToolTip = "泰开集团新能源箱变项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
            MyNode = new TreeNode();
            MyNode.Text = "协鑫智慧能源项目";
            MyNode.ToolTip = "泰开集团新能源箱变项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
            MyNode = new TreeNode();
            MyNode.Text = "泰开集团新能源箱变项目";
            MyNode.ToolTip = "泰开集团新能源箱变项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
            MyNode = new TreeNode();
            MyNode.Text = "智能电网及储能";
            MyNode.ToolTip = "泰开集团新能源箱变项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
             MyNode = new TreeNode();
            MyNode.Text = "山东潍坊抽水蓄能电站";
            MyNode.ToolTip = "山东潍坊抽水蓄能电站";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
            MyNode = new TreeNode();
            MyNode.Text = "蓝科途新能源锂电池隔膜项目";
            MyNode.ToolTip = "蓝科途新能源锂电池隔膜项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
            MyNode = new TreeNode();
            MyNode.Text = "泰开集团新能源箱变项目";
            MyNode.ToolTip = "泰开集团新能源箱变项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);

            MyNode = new TreeNode();
            MyNode.Text = "可燃冰勘探开发技术体系和装备体系";
            MyNode.ToolTip = "泰开集团新能源箱变项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);

            MyNode = new TreeNode();
            MyNode.Text = "山东潍坊抽水蓄能电站";
            MyNode.ToolTip = "泰开集团新能源箱变项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
            MyNode = new TreeNode();
            MyNode.Text = "协鑫智慧能源项目";
            MyNode.ToolTip = "泰开集团新能源箱变项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
            MyNode = new TreeNode();
            MyNode.Text = "泰开集团新能源箱变项目";
            MyNode.ToolTip = "泰开集团新能源箱变项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
            MyNode = new TreeNode();
            MyNode.Text = "智能电网及储能";
            MyNode.ToolTip = "泰开集团新能源箱变项目";
            MyNode.ImageUrl = "../../images/Dir.gif";
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
        }
       
    }


}