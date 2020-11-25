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
using ZWL.Common;
using System.Data.SqlClient;
using System.Text;

public partial class Main_DingYi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ZWL.Common.PublicMethod.CheckSession();

        //绑定所有s的菜单项目
        BindTree(ListTreeView.Nodes, 0);

        //设置有权限的项才显示
        SetQuanXian();
    }

    /// <summary>
    /// 检测传递进来的URLSTr，加入ValueStr参数
    /// </summary>
    /// <param name="NavStr"></param>
    /// <returns></returns>
    public string CheCKAndSetNavUrl(string NavStr,string ValueStr)
    {
        if (NavStr.Trim().Length > 0)
        {
            if (ZWL.Common.PublicMethod.StrIFIn("?", "NavStr") == true)
            {
                return NavStr + "&ValueStr=" + ValueStr;
            }
            else
            {
                return NavStr + "?ValueStr=" + ValueStr;
            }
        }
        else
        {
            return NavStr;
        }
    }

    private void BindTree(TreeNodeCollection Nds, int IDStr)
    {
        DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTreeList where ParentID=" + IDStr.ToString() + " order by PaiXuStr asc,ID asc");
        for(int i=0;i<MYDT.Tables[0].Rows.Count;i++)
        {
            //if (MYDT.Tables[0].Rows[i]["NavigateUrlStr"].ToString().Trim().Length<=0||ZWL.Common.PublicMethod.StrIFIn("|" + MYDT.Tables[0].Rows[i]["ValueStr"].ToString() + "|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian")) == true)
            //{
                TreeNode MenuNode = new TreeNode();
                MenuNode.Text = MYDT.Tables[0].Rows[i]["TextStr"].ToString();
                MenuNode.Value = MYDT.Tables[0].Rows[i]["ValueStr"].ToString();
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
            //}            
        }
    }

    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
                    if (PublicMethod.StrIFIn("|" + this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].Value + "|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian")) == false)
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
                    if (PublicMethod.StrIFIn("|" + this.ListTreeView.Nodes[i].ChildNodes[j].Value + "|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian")) == false)
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
                if (PublicMethod.StrIFIn("|" + this.ListTreeView.Nodes[i].Value + "|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian")) == false)
                {
                    this.ListTreeView.Nodes.Remove(this.ListTreeView.Nodes[i]);
                    i = -1;
                }
            }
        }
    }
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //将所有的前面的选择框中已经勾选的项，直接组合成一段html代码，存入数据库，Main.aspx页面直接显示这段html代码即可
        //&nbsp; &nbsp;<a class="bai" target="rform" href="../NetMail/NetMailShou.aspx"><img align="absMiddle" height="16" border=0 src="../images/TreeImages/webmail.gif" width="16" />&nbsp;Internet 邮件&nbsp;</a>

        string MyDaoHangList="";
        for (int i = 0; i < this.ListTreeView.Nodes.Count; i++)
        {
            for (int j = 0; j < this.ListTreeView.Nodes[i].ChildNodes.Count; j++)
            {
                if (this.ListTreeView.Nodes[i].ChildNodes[j].Checked == true)
                {
                    //添加进入字符串
                    MyDaoHangList = MyDaoHangList + "&nbsp; &nbsp;<a class=\"bai\" target=\"rform\" href=\"" + this.ListTreeView.Nodes[i].ChildNodes[j].NavigateUrl + "\"><img align=\"absMiddle\" height=\"16\" border=0 src=\"" + this.ListTreeView.Nodes[i].ChildNodes[j].ImageUrl.Replace("~/images", "../images") + "\" width=\"16\" />&nbsp;" + this.ListTreeView.Nodes[i].ChildNodes[j].Text + "&nbsp;</a>";
                }
                else
                {
                    for (int k = 0; k < this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes.Count; k++)
                    {
                        if (this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].Checked == true)
                        {
                            //添加进入字符串
                            MyDaoHangList = MyDaoHangList + "&nbsp; &nbsp;<a class=\"bai\" target=\"rform\" href=\"" + this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].NavigateUrl + "\"><img align=\"absMiddle\" height=\"16\" border=0 src=\"" + this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].ImageUrl.Replace("~/images", "../images") + "\" width=\"16\" />&nbsp;" + this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].Text + "&nbsp;</a>";                
                        }
                    }
                }
            }
        }

        StringBuilder strSql = new StringBuilder();
        strSql.Append("update ERPUser set ");
        strSql.Append("DaoHangList=@DaoHangList");
        strSql.Append(" where UserName=@UserName ");
        SqlParameter[] parameters = {
					new SqlParameter("@UserName", SqlDbType.VarChar,50),
					new SqlParameter("@DaoHangList", SqlDbType.Text)};
        parameters[0].Value = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        parameters[1].Value = MyDaoHangList;
        ZWL.DBUtility.DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);

        Response.Write("<script language=javascript>alert('导航菜单配置完成！');top.location='Main.aspx';</script>");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int PaiXuNum=0;

        string TextStr="";
        string ImageUrlStr = "";
        string ValueStr = "";
        string NavigateUrlStr = "";
        string Target = "rform";
        int ParentID = 0;
        string QuanXianList = "";
        string PaiXuStr = "";
        //开发时使用，将静态菜单写入数据库表中管理
        for (int i = 0; i < this.ListTreeView.Nodes.Count; i++)
        {            
            //添加本节点进入数据库
            TextStr = this.ListTreeView.Nodes[i].Text.ToString();
            ImageUrlStr = this.ListTreeView.Nodes[i].ImageUrl.ToString();
            ValueStr = this.ListTreeView.Nodes[i].Value.ToString();
            NavigateUrlStr = this.ListTreeView.Nodes[i].NavigateUrl.ToString();
            ParentID = 0;
            if (NavigateUrlStr.Trim().Length > 0)
            {
                QuanXianList = ValueStr+"A_添加|"+ValueStr+"M_修改|"+ValueStr+"D_删除|"+ValueStr+"E_导出";
            }
            PaiXuNum=PaiXuNum+1;
            PaiXuStr = PaiXuNum.ToString();
            ZWL.DBUtility.DbHelperSQL.ExecuteSQL("insert into ERPTreeList([TextStr], [ImageUrlStr], [ValueStr], [NavigateUrlStr], [Target], [ParentID], [QuanXianList], [PaiXuStr]) values ('" + TextStr + "','" + ImageUrlStr + "','" + ValueStr + "','" + NavigateUrlStr + "','" + Target + "'," + ParentID + ",'" + QuanXianList + "','" + PaiXuStr + "')");

            //循环此节点下的各个子节点
            for (int j = 0; j < this.ListTreeView.Nodes[i].ChildNodes.Count; j++)
            {
                //添加本节点进入数据库
                TextStr = this.ListTreeView.Nodes[i].ChildNodes[j].Text.ToString();
                ImageUrlStr = this.ListTreeView.Nodes[i].ChildNodes[j].ImageUrl.ToString();
                ValueStr = this.ListTreeView.Nodes[i].ChildNodes[j].Value.ToString();
                NavigateUrlStr = this.ListTreeView.Nodes[i].ChildNodes[j].NavigateUrl.ToString();
                ParentID = int.Parse(ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select top 1 ID from ERPTreeList where TextStr='" + this.ListTreeView.Nodes[i].Text.ToString() + "' order by ID desc"));
                if (NavigateUrlStr.Trim().Length > 0)
                {
                    QuanXianList = ValueStr + "A_添加|" + ValueStr + "M_修改|" + ValueStr + "D_删除|" + ValueStr + "E_导出";
                }
                PaiXuNum = PaiXuNum + 1;
                PaiXuStr = PaiXuNum.ToString();
                ZWL.DBUtility.DbHelperSQL.ExecuteSQL("insert into ERPTreeList([TextStr], [ImageUrlStr], [ValueStr], [NavigateUrlStr], [Target], [ParentID], [QuanXianList], [PaiXuStr]) values ('" + TextStr + "','" + ImageUrlStr + "','" + ValueStr + "','" + NavigateUrlStr + "','" + Target + "'," + ParentID + ",'" + QuanXianList + "','" + PaiXuStr + "')");


                for (int k = 0; k < this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes.Count; k++)
                {
                    //添加本节点进入数据库
                    TextStr = this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].Text.ToString();
                    ImageUrlStr = this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].ImageUrl.ToString();
                    ValueStr = this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].Value.ToString();
                    NavigateUrlStr = this.ListTreeView.Nodes[i].ChildNodes[j].ChildNodes[k].NavigateUrl.ToString();
                    ParentID = int.Parse(ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select top 1 ID from ERPTreeList where TextStr='" + this.ListTreeView.Nodes[i].ChildNodes[j].Text.ToString() + "' order by ID desc"));
                    if (NavigateUrlStr.Trim().Length > 0)
                    {
                        QuanXianList = ValueStr + "A_添加|" + ValueStr + "M_修改|" + ValueStr + "D_删除|" + ValueStr + "E_导出";
                    }
                    PaiXuNum = PaiXuNum + 1;
                    PaiXuStr = PaiXuNum.ToString();
                    ZWL.DBUtility.DbHelperSQL.ExecuteSQL("insert into ERPTreeList([TextStr], [ImageUrlStr], [ValueStr], [NavigateUrlStr], [Target], [ParentID], [QuanXianList], [PaiXuStr]) values ('" + TextStr + "','" + ImageUrlStr + "','" + ValueStr + "','" + NavigateUrlStr + "','" + Target + "'," + ParentID + ",'" + QuanXianList + "','" + PaiXuStr + "')");

                }
            }
        }

        ZWL.Common.MessageBox.Show(this, "OK");
    }
}
