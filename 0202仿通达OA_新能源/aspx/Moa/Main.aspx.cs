using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FTD.Unit;
using System.Data;
using System.Text;

namespace OA.aspx.Moa.Main{ 
 public partial class Main: System.Web.UI.Page
{
    public string menus = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PublicMethod.CheckSession();
            //Response.Write(FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
            //设置有权限的项才显示
            //设置有权限的项才显示
            SetQuanXian();
            string param = Request.Params["param"];
            if (string.IsNullOrEmpty(param))
            {
                Render();
            }
            else if (param.Contains("M"))
            {
                menus = GetChild2(param);
            }
            else
            {
                menus = GetChild1(param);
            }
        }
    }

    private void BindTree(TreeNodeCollection Nds, int IDStr)
    {
        DataSet MYDT = FTD.DBUnit.DbHelperSQL.GetDataSet("select * from ERPTreeList where ParentID=" + IDStr.ToString() + " order by PaiXuStr asc,ID asc");
        for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
        {

            TreeNode MenuNode = new TreeNode();
            MenuNode.Text = MYDT.Tables[0].Rows[i]["TextStr"].ToString();
            MenuNode.Value = MYDT.Tables[0].Rows[i]["ValueStr"].ToString();
            MenuNode.ImageToolTip = MYDT.Tables[0].Rows[i]["ParentClass"].ToString();
            int strId = int.Parse(MYDT.Tables[0].Rows[i]["ID"].ToString());
            MenuNode.ImageUrl = MYDT.Tables[0].Rows[i]["ImageUrlStr"].ToString();

            if (MYDT.Tables[0].Rows[i]["NavigateUrlStr"].ToString().Trim().Length <= 0)
            {
                MenuNode.SelectAction = TreeNodeSelectAction.Expand;
            }
            else
            {
                MenuNode.NavigateUrl = MYDT.Tables[0].Rows[i]["NavigateUrlStr"].ToString();
                MenuNode.Target = MYDT.Tables[0].Rows[i]["Target"].ToString();
            }
            Nds.Add(MenuNode);
            BindTree(Nds[Nds.Count - 1].ChildNodes, strId);
        }
    }

    public void SetQuanXian()
    {
        //判断权限分配
        for (int i = 0; i < this.ListTreeView.Nodes.Count; i++)
        {
            for (int j = 0; j < this.ListTreeView.Nodes[i].ChildNodes.Count; j++)
            {
                //删除子菜单中的不在权限中的项
                for (int k = 0; k < this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes.Count; k++)
                {
                    if (PublicMethod.StrIFIn("|" + this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].Value + "|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian")) == false)
                    {
                        this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes.Remove(this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k]);
                        k = -1;
                    }
                }
                //判断是父节点还是子节点
                if (this.ListTreeView.Nodes[i].ChildNodes[j].SelectAction == TreeNodeSelectAction.Expand)
                {
                    if (this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes.Count <= 0)
                    {
                        this.ListTreeView.Nodes[i].ChildNodes.Remove(this.ListTreeView.Nodes[i].ChildNodes[j]);
                        j = -1;
                    }
                }
                else
                {
                    if (PublicMethod.StrIFIn("|" + this.ListTreeView.Nodes[i].ChildNodes[j].Value + "|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian")) == false)
                    {
                        this.ListTreeView.Nodes[i].ChildNodes.Remove(this.ListTreeView.Nodes[i].ChildNodes[j]);
                        j = -1;
                    }
                }
            }
            //判断是父节点还是子节点
            if (this.ListTreeView.Nodes[i].SelectAction == TreeNodeSelectAction.Expand)
            {
                if (this.ListTreeView.Nodes[i].ChildNodes.Count <= 0)
                {
                    this.ListTreeView.Nodes.Remove(this.ListTreeView.Nodes[i]);
                    i = -1;
                }
            }
            else
            {
                if (PublicMethod.StrIFIn("|" + this.ListTreeView.Nodes[i].Value + "|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian")) == false)
                {
                    this.ListTreeView.Nodes.Remove(this.ListTreeView.Nodes[i]);
                    i = -1;
                }
            }
        }
    }

    string GetChild1(string param)
    {
        StringBuilder sb = new StringBuilder();
        foreach (TreeNode node in this.ListTreeView.Nodes)
        {
            if (node.Value.ToString() == param)
            {
                if (node.ChildNodes.Count > 0)
                {
                    sb.Append(RenderChild2(node.ChildNodes));
                }
                break;
            }
        }
        return sb.ToString();
    }

    string GetChild2(string param)
    {
        StringBuilder sb = new StringBuilder();
        foreach (TreeNode node in this.ListTreeView.Nodes)
        {
            foreach (TreeNode nodes in node.ChildNodes)
            {
                if (nodes.Value.ToString() == param)
                {
                    if (nodes.ChildNodes.Count > 0)
                    {
                        sb.Append(RenderChild3(nodes.ChildNodes));
                    }
                    return sb.ToString();
                }
            }

        }
        return sb.ToString();
    }

    protected void Render()
    {
        StringBuilder sb = new StringBuilder();
        sb.Append(RenderChild1(this.ListTreeView.Nodes));
        menus = sb.ToString();
    }

    string RenderChild1(TreeNodeCollection nodes)
    {
        StringBuilder sb = new StringBuilder();
        foreach (TreeNode node in nodes)
        {
            //width=\"16\"  height=\"16\"
            sb.Append("<li class=\"menu\">");
            sb.Append("<a href=\"" + node.NavigateUrl + "\" id=\"" + node.Value + "\">");
            sb.Append("<img  src=\"" + node.ImageUrl + "\"/><span  class=\"name\">" + node.Text + "</span><span class=\"arrow\"></span>");
            sb.Append("</a>");
            sb.Append("</li>");
            //if (node.ChildNodes.Count > 0)
            //{

            //    sb.Append("<ul id=\"m" + node.Value + "d\" style=\"display: none;\" class=\"U1\">\n");
            //    sb.Append(RenderChild2(node.ChildNodes));
            //    sb.Append("</ul>\n");

            //}
        }
        return sb.ToString();
    }

    string RenderChild2(TreeNodeCollection nodes)
    {
        StringBuilder sb = new StringBuilder();
        foreach (TreeNode node in nodes)
        {

            if (node.ChildNodes.Count == 0)
            {
                sb.Append("<li class=\"menu\">");
                sb.Append("<a href=\"" + node.NavigateUrl + "\" id=\"" + node.Value + "\">");
                sb.Append("<img  src=\"" + node.ImageUrl + "\"/><span  class=\"name\">" + node.Text + "</span><span class=\"arrow\"></span>");
                sb.Append("</a>");
                sb.Append("</li>");
            }
            else
            {
                sb.Append("<li class=\"menu\">");
                sb.Append("<a href=\"" + node.NavigateUrl + "\" id=\"" + node.Value + "\">");
                sb.Append("<img  src=\"" + node.ImageUrl + "\"/><span  class=\"name\">" + node.Text + "</span><span class=\"arrow\"></span>");
                sb.Append("</a>");
                sb.Append("</li>");
                sb.Append("<ul id=\"f" + node.Value + "d\" style=\"display: none;\" >\n");
                sb.Append(RenderChild3(node.ChildNodes));
                sb.Append("</ul>\n");

            }
        }
        return sb.ToString();
    }

    string RenderChild3(TreeNodeCollection nodes)
    {
        StringBuilder sb = new StringBuilder();
        foreach (TreeNode node in nodes)
        {
            sb.Append("<li class=\"menu\">");
            sb.Append("<a href=\"" + node.NavigateUrl + "\" id=\"" + node.Value + "\">");
            sb.Append("<img  src=\"" + node.ImageUrl + "\"/><span  class=\"name\">" + node.Text + "</span><span class=\"arrow\"></span>");
            sb.Append("</a>");
            sb.Append("</li>");

        }
        return sb.ToString();
    }
}}