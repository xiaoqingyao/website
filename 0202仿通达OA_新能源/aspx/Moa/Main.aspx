<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="OA.aspx.Moa.Main.Main" %>

<%@ Register Src="~/Moa/NWorkFlow/NowWorkFlow.ascx" TagName="NowWork" TagPrefix="c1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>金码铺移动办公平台 </title>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />
    <script src="JS/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="Style/Mobile/css/Style.css" rel="stylesheet" media="screen" type="text/css" />
    <script src="Style/Mobile/javascript/functions.js" type="text/javascript"></script>
    <link href="Style/Mobile/pics/startup.png" rel="apple-touch-startup-image" />
</head>
<body>
    <form id="main" method="post" runat="server">
    <div id="topbar">
        <div id="title">
            金码铺移动办公平台</div>
        <div id="leftbutton">
            <a href="#" class="noeffect">主页</a>
        </div>
        <div id="rightbutton">
            <a href="Default.aspx" class="noeffect">退出</a>
        </div>
    </div>
    <div id="content">
        <span class="graytitle">基本菜单</span>
        <ul class="pageitem">
            <li class="textbox"><span class="header">欢迎,<%= FTD.Unit.PublicMethod.GetSessionValue("UserName")%></span><p>
                欢迎来到金码铺移动办公平台（手机版）</p>
            </li>
            <%=menus %>
        </ul>
        <span class="graytitle">待办事项</span>
        <div id="divResult">
            <c1:NowWork runat="server" ID="UC" />
        </div>
    </div>
    <div id="footer">
        <a href="http://jinmapu.taobao.com" target="_blank">Powered by 金码铺</a></div>
    <div style="display: none;">
        <asp:TreeView ID="ListTreeView" runat="server" ExpandDepth="0" ShowLines="True" ForeColor="Black">
            <ParentNodeStyle HorizontalPadding="2px" />
            <RootNodeStyle HorizontalPadding="2px" />
            <LeafNodeStyle HorizontalPadding="2px" />
            <Nodes>
                <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/plugin.png" Text="我的办公桌" Value="F001"
                    NavigateUrl="Main.aspx?param=F001" SelectAction="Expand">
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/rmail.png" Text="内部邮件" Value="F001M001"
                        NavigateUrl="Main.aspx?param=F001M001" SelectAction="Expand">
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/plugin.png" Text="收件箱" Value="001"
                            NavigateUrl="LanEmail/LanEmailShou.aspx" Target="rform"></asp:TreeNode>
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/messages.png" Text="草稿箱" Value="002"
                            NavigateUrl="LanEmail/LanEmailCao.aspx" Target="rform"></asp:TreeNode>
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/rmail.png" Text="已发送" Value="003"
                            NavigateUrl="LanEmail/LanEmailYiFa.aspx" Target="rform"></asp:TreeNode>
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/accessibility.png" Text="已删除" Value="004"
                            NavigateUrl="LanEmail/LanEmailYiDel.aspx" Target="rform"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/mail.png" Text="Internet邮件" Value="F001M002"
                        NavigateUrl="Main.aspx?param=F001M002" SelectAction="Expand">
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/mail.png" Text="收件箱" Value="005"
                            NavigateUrl="NetMail/NetMailShou.aspx" Target="rform"></asp:TreeNode>
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/messages.png" Text="草稿箱" Value="006"
                            NavigateUrl="NetMail/NetMailCao.aspx" Target="rform"></asp:TreeNode>
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/rmail.png" Text="已发送" Value="007"
                            NavigateUrl="NetMail/NetMailYiFa.aspx" Target="rform"></asp:TreeNode>
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/accessibility.png" Text="已删除" Value="008"
                            NavigateUrl="NetMail/NetMailYiDel.aspx" Target="rform"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/telephone.png" Text="手机短信" Value="009"
                        NavigateUrl="Mobile/MobileSms.aspx" Target="rform"></asp:TreeNode>
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/messages.png" Text="公告通知" Value="F001M003"
                        NavigateUrl="Main.aspx?param=F001M003" SelectAction="Expand">
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/start.png" Text="单位公告通知" Value="010"
                            NavigateUrl="GongGao/GongGao.aspx?Type=单位" Target="rform"></asp:TreeNode>
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/basics.png" Text="部门公告通知" Value="011"
                            NavigateUrl="GongGao/GongGao.aspx?Type=部门" Target="rform"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/wordpress.png" Text="投票" Value="012"
                        NavigateUrl="GongGao/Vote.aspx" Target="rform"></asp:TreeNode>
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/accessibility.png" Text="工作日志" Value="014"
                        NavigateUrl="Work/WorkRiZhi.aspx" Target="rform"></asp:TreeNode>
                          <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/wordpress.png" Text="通讯簿"  Value="F001M004" SelectAction="Expand" NavigateUrl="Main.aspx?param=F001M004">
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/wordpress.png" Text="公共通讯簿" Value="015"
                            NavigateUrl="Work/TongXunLu.aspx?TypeStr=公共通讯簿" Target="rform"></asp:TreeNode>
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/wordpress.png" Text="共享通讯簿" Value="016"
                            NavigateUrl="Work/TongXunLu.aspx?TypeStr=共享通讯簿" Target="rform"></asp:TreeNode>
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/wordpress.png" Text="个人通讯簿" Value="017"
                            NavigateUrl="Work/TongXunLu.aspx?TypeStr=个人通讯簿" Target="rform"></asp:TreeNode>
                    </asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/weather.png" Text="工作管理" Value="F004"
                    NavigateUrl="Main.aspx?param=F004" SelectAction="Expand">
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/appstore.png" Text="我的计划" Value="027"
                        NavigateUrl="WorkPlan/MyWorkPlan.aspx" Target="rform"></asp:TreeNode>
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/start.png" Text="计划管理" Value="028"
                        NavigateUrl="WorkPlan/ManageWorkPlan.aspx" Target="rform"></asp:TreeNode>
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/sketches.png" Text="我的汇报" Value="A001"
                        NavigateUrl="WorkPlan/HuiBao.aspx" Target="rform"></asp:TreeNode>
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/photos.png" Text="汇报管理" Value="A002"
                        NavigateUrl="WorkPlan/HuiBaoOK.aspx" Target="rform"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/stocks.png" Text="下属任务" Value="F005"
                    NavigateUrl="Main.aspx?param=F005" SelectAction="Expand">
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/otherapps.png" Text="我的任务" Value="029"
                        NavigateUrl="Subaltern/Task.aspx" Target="rform"></asp:TreeNode>
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/other.png" Text="任务分配" Value="030"
                        NavigateUrl="Subaltern/TaskFP.aspx" Target="rform"></asp:TreeNode>
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/other.png" Text="下属日志" Value="040"
                        NavigateUrl="Subaltern/SubRiZhi.aspx" Target="rform"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/stocks.png" Text="知识文档" Value="F006"
                    NavigateUrl="Main.aspx?param=F006" SelectAction="Expand">
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/otherapps.png" Text="单位文件" Value="041"
                        NavigateUrl="DocCenter/DocCenter.aspx?Type=单位文件&DirID=0" Target="rform"></asp:TreeNode>
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/other.png" Text="知识库" Value="042"
                        NavigateUrl="DocCenter/DocCenter.aspx?Type=知识库&DirID=0" Target="rform"></asp:TreeNode>
                         <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/other.png" Text="共享文件" Value="043"
                        NavigateUrl="DocCenter/DocCenter.aspx?Type=共享文件&DirID=0" Target="rform"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/stocks.png" Text="培训管理" Value="F007"
                    NavigateUrl="Main.aspx?param=F007" SelectAction="Expand">
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/otherapps.png" Text="培训信息" Value="051"
                        NavigateUrl="DocFile/PeiXun.aspx" Target="rform"></asp:TreeNode>
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/other.png" Text="培训日志" Value="052"
                        NavigateUrl="DocFile/PeiXunRiJi.aspx?PeiXunName=" Target="rform"></asp:TreeNode>
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/otherapps.png" Text="效果评估" Value="053"
                        NavigateUrl="DocFile/PeiXunXiaoGuo.aspx?PeiXunName=" Target="rform"></asp:TreeNode>
                </asp:TreeNode>
                 <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/stocks.png" Text="考试管理" Value="F008"
                    NavigateUrl="Main.aspx?param=F008" SelectAction="Expand">
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/otherapps.png" Text="在线考试" Value="061"
                        NavigateUrl="DocFile/TiKuKaoShi.aspx" Target="rform"></asp:TreeNode>
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/other.png" Text="考试结果" Value="062"
                        NavigateUrl="DocFile/TiKuKaoShiOK.aspx" Target="rform"></asp:TreeNode>
                </asp:TreeNode>
                 <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/stocks.png" Text="学习管理" Value="F009"
                    NavigateUrl="Main.aspx?param=F009" SelectAction="Expand">
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/otherapps.png" Text="在线学习" Value="071"
                        NavigateUrl="DocFile/XueXi.aspx" Target="rform"></asp:TreeNode>
                    <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/other.png" Text="学习心得" Value="072"
                        NavigateUrl="DocFile/XueXiXinDe.aspx" Target="rform"></asp:TreeNode>
                        <asp:TreeNode ImageUrl="../../Style/Mobile/thumbs/otherapps.png" Text="心得管理" Value="073"
                        NavigateUrl="DocFile/XueXiXinDeOK.aspx" Target="rform"></asp:TreeNode>
                </asp:TreeNode>
            </Nodes>
        </asp:TreeView>
    </div>
    </form>
</body>
</html>
