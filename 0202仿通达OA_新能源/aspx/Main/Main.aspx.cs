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
using System.Web.Script.Serialization;
using FTD.Unit;
using FTD.DBUnit;
using System.Collections.Generic;

namespace OA.aspx.Main{ 
 public partial class Main: System.Web.UI.Page
{
    public string res = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PublicMethod.CheckSession();
            //Response.Write(FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));

            //显示自定义导航快捷菜单
            //  this.Label3.Text = FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 DaoHangList from ERPUser where UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "'");

            //绑定所有s的菜单项目
            BindTree(ListTreeView.Nodes, 0);
            //设置有权限的项才显示
            SetQuanXian();
            if (Request.Params["method"] != null)
            {
                IndexInfo(this.ListTreeView.Nodes);
            }
            if (Request.Params["node"] != null)
            {
                GetChild(Request.Params["node"]);
            }
            //显示授权信息文字
            //this.Label1.Text = FTD.Unit.DEncrypt.DESEncrypt.Decrypt(FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 DanWeiStr from ERPSerils"), "www.cnsoftweb.com-13696432490");

            //try
            //{
            //    this.ListTreeView.Nodes[0].Expanded = true;
            //}
            //catch
            //{ }
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

    public void IndexInfo(TreeNodeCollection nodeCollection)
    {
        JavaScriptSerializer jss = new JavaScriptSerializer();
        List<ExtTreeNode> nodes = new List<ExtTreeNode>();

        try
        {
            foreach (TreeNode row in nodeCollection)
            {
                ExtTreeNode node = new ExtTreeNode();
                node.id = row.Value;
                node.IsRoot = false;
                node.icon = row.ImageUrl.Replace("~","..");
                node.iconCls = row.ImageToolTip;
                if (row.Parent == null)
                {
                    node.leaf = false;
                    node.PID = "";
                }
                else
                {
                    node.leaf = true;
                    node.PID = row.Parent.ImageToolTip;
                }
                node.draggable = true;
                node.text = row.Text;
                node.TypeID = row.Value;
                node.TypeTitle = row.Text;
                node.TypeEName = row.Text;
                node.action = row.NavigateUrl;
                nodes.Add(node);
            }
            res = jss.Serialize(nodes);
        }
        catch (Exception ee)
        {
            string error = ee.Message;
        }
        Response.Write(res);
        Response.End();
    }

    public void GetChild(string id)
    {
        JavaScriptSerializer jss = new JavaScriptSerializer();
        List<ExtTreeNode> nodes = new List<ExtTreeNode>();
        TreeNode nodess = this.ListTreeView.FindNode(id);
        try
        {
            foreach (TreeNode row in nodess.ChildNodes)
            {
                ExtTreeNode node = new ExtTreeNode();
                node.id = row.ValuePath;
                node.IsRoot = false;
                node.icon = row.ImageUrl.Replace("~", "..");
                if (row.ChildNodes.Count==0)
                {
                    node.leaf = true;
                    node.PID = row.Parent.ImageToolTip;
                }
                node.draggable = true;
                node.text = row.Text;
                node.TypeID = row.Value;
                node.TypeTitle = row.Text;
                node.TypeEName = row.Text;
                node.action = row.NavigateUrl;
                nodes.Add(node);
            }
            res = jss.Serialize(nodes);
        }
        catch (Exception ee)
        {
            string error = ee.Message;
        }
        Response.Write(res);
        Response.End();
    }

    public TreeNode GetNode(string id)
    {
        foreach (TreeNode item in this.ListTreeView.Nodes)
        {
            if(item.ImageToolTip==id)
            {
                return item;
            }
        }
        return null;
    }

}

public class ExtTreeNode
{
    // Fields
    private string _cls;
    private bool _draggable;
    private string _href;
    private string _hrefTarget;
    private string _icon;
    private string _id;
    private bool _IsChecked;
    private bool _IsRoot;
    private bool _leaf;
    private string _NodeType;
    private string _parentNodeId;
    private string _text;
    private string _iconCls;
    private DateTime addDate;
    private bool delFlag;
    private string description;
    private string pID;
    private string typeEName;
    private string typeID;
    private string typeTitle;
    private string _action;

    // Properties
    public DateTime AddDate
    {
        get
        {
            return this.addDate;
        }
        set
        {
            this.addDate = value;
        }
    }

    public string cls
    {
        get
        {
            return this._cls;
        }
        set
        {
            this._cls = value;
        }
    }
    public string action
    {
        get
        {
            return this._action;
        }
        set
        {
            this._action = value;
        }
    }

    public string iconCls
    {
        get
        {
            return this._iconCls;
        }
        set
        {
            this._iconCls = value;
        }
    }

    public bool DelFlag
    {
        get
        {
            return this.delFlag;
        }
        set
        {
            this.delFlag = value;
        }
    }

    public string Description
    {
        get
        {
            return this.description;
        }
        set
        {
            this.description = value;
        }
    }

    public bool draggable
    {
        get
        {
            return this._draggable;
        }
        set
        {
            this._draggable = value;
        }
    }

    public string href
    {
        get
        {
            return this._href;
        }
        set
        {
            this._href = value;
        }
    }

    public string hrefTarget
    {
        get
        {
            return this._hrefTarget;
        }
        set
        {
            this._hrefTarget = value;
        }
    }

    public string icon
    {
        get
        {
            return this._icon;
        }
        set
        {
            this._icon = value;
        }
    }

    public string id
    {
        get
        {
            return this._id;
        }
        set
        {
            this._id = value;
        }
    }

    public bool IsChecked
    {
        get
        {
            return this._IsChecked;
        }
        set
        {
            this._IsChecked = value;
        }
    }

    public bool IsRoot
    {
        get
        {
            return this._IsRoot;
        }
        set
        {
            this._IsRoot = value;
        }
    }

    public bool leaf
    {
        get
        {
            return this._leaf;
        }
        set
        {
            this._leaf = value;
        }
    }

    public string NodeType
    {
        get
        {
            return this._NodeType;
        }
        set
        {
            this._NodeType = value;
        }
    }

    public string parentNodeId
    {
        get
        {
            return this._parentNodeId;
        }
        set
        {
            this._parentNodeId = value;
        }
    }

    public string PID
    {
        get
        {
            return this.pID;
        }
        set
        {
            this.pID = value;
        }
    }

    public string text
    {
        get
        {
            return this._text;
        }
        set
        {
            this._text = value;
        }
    }

    public string TypeEName
    {
        get
        {
            return this.typeEName;
        }
        set
        {
            this.typeEName = value;
        }
    }

    public string TypeID
    {
        get
        {
            return this.typeID;
        }
        set
        {
            this.typeID = value;
        }
    }

    public string TypeTitle
    {
        get
        {
            return this.typeTitle;
        }
        set
        {
            this.typeTitle = value;
        }
    }
}
}