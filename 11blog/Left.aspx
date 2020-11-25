<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left.aspx.cs" Inherits="Left" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Left.css" type="text/css" rel="stylesheet" />
    <title>导航页面</title>
</head>
<body>
    <form id="form1" method="post" runat="server">
    <div>
        <asp:TreeView ID="TreeView1" runat="server" ShowLines="True" ExpandDepth="1" Font-Bold="False"
            Font-Names="Agency FB">
            <SelectedNodeStyle BackColor="Transparent" ForeColor="Black" />
            <Nodes>
                <asp:TreeNode Text="系统用户管理" Value="系统用户管理" SelectAction="Expand">
                    <asp:TreeNode NavigateUrl="edituser.aspx" Target="main" Text="用户添加" Value="用户添加">
                    </asp:TreeNode>
                    <asp:TreeNode NavigateUrl="listuser.aspx" Target="main" Text="用户管理" Value="用户管理">
                    </asp:TreeNode>
                    <asp:TreeNode NavigateUrl="listhuiyuan.aspx" Target="main" Text="会员管理" Value="会员管理">
                    </asp:TreeNode>
                </asp:TreeNode>
                <%-- <asp:TreeNode Text="注册用户管理" Value="注册用户管理" SelectAction="Expand">
                        <asp:TreeNode NavigateUrl="user_list.aspx" Target="main" Text="注册用户管理" Value="注册用户管理"></asp:TreeNode>
                        
                        
                    </asp:TreeNode>--%>
                <asp:TreeNode Text="留言板管理" Value="留言板管理" SelectAction="Expand">
                    <asp:TreeNode NavigateUrl="lyb_gl.aspx" Target="main" Text="留言板管理" Value="留言板管理">
                    </asp:TreeNode>
                </asp:TreeNode>
                <%--  <asp:TreeNode Text="论坛管理" Value="论坛管理" SelectAction="Expand">
                        <asp:TreeNode NavigateUrl="luntanbankuai_add.aspx" Target="main" Text="板块添加" Value="板块添加"></asp:TreeNode>
                         <asp:TreeNode NavigateUrl="luntanbankuai_list.aspx" Target="main" Text="板块管理" Value="板块管理"></asp:TreeNode>
                    </asp:TreeNode>--%>
                <asp:TreeNode Text="资讯管理" Value="资讯管理" SelectAction="Expand">
                    <asp:TreeNode NavigateUrl="gg_add.aspx?lb=1" Target="main" Text="资讯添加" Value="资讯添加">
                    </asp:TreeNode>
                    <asp:TreeNode NavigateUrl="gg_list.aspx?lb=1" Target="main" Text="资讯管理" Value="资讯管理">
                    </asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="专辑管理" Value="专辑管理" SelectAction="Expand">
                    <asp:TreeNode NavigateUrl="pro_add.aspx" Target="main" Text="专辑添加" Value="专辑添加">
                    </asp:TreeNode>
                    <asp:TreeNode NavigateUrl="pro_list.aspx" Target="main" Text="专辑管理" Value="专辑管理">
                    </asp:TreeNode>
                </asp:TreeNode>
                <%-- <asp:TreeNode Text="每周时报" Value="每周时报 SelectAction="Expand">
                      <asp:TreeNode NavigateUrl="gg_add.aspx?lb=3" Target="main" Text="每周时报添加" Value="每周时报添加"></asp:TreeNode>
                      <asp:TreeNode NavigateUrl="gg_list.aspx?lb=3" Target="main" Text="每周时报管理" Value="每周时报管理"></asp:TreeNode>
                  </asp:TreeNode>--%>
                <asp:TreeNode Text="友情链接管理" Value="友情链接管理" SelectAction="Expand">
                    <asp:TreeNode NavigateUrl="yqlj_add.aspx" Target="main" Text="友情链接管理" Value="友情链接管理">
                    </asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="像册管理" Value="像册管理" SelectAction="Expand">
                    <asp:TreeNode NavigateUrl="xiangce_add.aspx" Target="main" Text="像册添加" Value="像册添加">
                    </asp:TreeNode>
                    <asp:TreeNode NavigateUrl="xiangce_list.aspx" Target="main" Text="像册管理" Value="像册管理">
                    </asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="活动中心" Value="活动中心" SelectAction="Expand">
                    <asp:TreeNode NavigateUrl="fabuhuodong.aspx" Target="main" Text="发布活动" Value="发布活动"></asp:TreeNode>
                    <asp:TreeNode NavigateUrl="huodongliebiao.aspx" Target="main" Text="活动列表" Value="活动列表"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="个人信息管理" Value="个人信息管理" SelectAction="Expand">
                    <asp:TreeNode NavigateUrl="mod.aspx" Target="main" Text="修改密码" Value="修改密码"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/logout.aspx" Text="退出系统" Value="退出系统" Target="_parent">
                </asp:TreeNode>
            </Nodes>
            <NodeStyle Font-Size="X-Small" ForeColor="Black" />
        </asp:TreeView>
        &nbsp;
    </div>
    </form>
</body>
</html>
