<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlManageList.aspx.cs" Inherits="AllPower.Web.Admin.ModelList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" rel="Stylesheet" href="../css/controlmanagelist.css" />
    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" src="../JS/Common.js"></script>
    <script language="javascript" src="../JS/ControlManageList.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div style=" padding:3px; margin:5px;"><a href="NewsClassedit.aspx?ModelID=5204ed1-a0fd-42&action=add" target="_blank">添加</a><a href="?Action={e}{[IsCheck](=)(1)}" target="_self">已审核</a><a href="?Action={e}{[IsCheck](=)(1)}" target="_self">未审核</a><a href="?" target="_self">投稿</a><a href="?IsLock=1" target="_self">锁定</a><a href="?IsLock=0" target="_self">开放</a><a href="?{IsCommend=1}" target="_self">推荐</a><a href="?IsTop=1" target="_self">置顶</a><a href="?IsNew=1" target="_self">置新</a><a href="?IsHot=1" target="_self">热点</a><a href="?" target="_self">幻灯片</a><a href="?" target="_self">精彩</a><a href="?" target="_self">图片</a><a href="?" target="_self">头条</a><a href="?" target="_self">已生成</a><a href="?" target="_self">未生成</a><a href="?" target="_self">允许评论</a><a href="?" target="_self">我录入的信息</a><a href="?" target="_self">有附件</a><a href="?" target="_self">草稿</a><a href="NewsClassedit.aspx?ModelID=5204ed1-a0fd-42&action=add" target="_blank">添加</a><a href="?Action={e}{[IsCheck](=)(1)}" target="_self">已审核</a><a href="?Action={e}{[IsCheck](=)(1)}" target="_self">未审核</a><a href="?" target="_self">投稿</a><a href="?IsLock=1" target="_self">锁定</a><a href="?IsLock=0" target="_self">开放</a><a href="?{IsCommend=1}" target="_self">推荐</a><a href="?IsTop=1" target="_self">置顶</a><a href="?IsNew=1" target="_self">置新</a><a href="?IsHot=1" target="_self">热点</a><a href="?" target="_self">幻灯片</a><a href="?" target="_self">精彩</a><a href="?" target="_self">图片</a><a href="?" target="_self">头条</a><a href="?" target="_self">已生成</a><a href="?" target="_self">未生成</a><a href="?" target="_self">允许评论</a><a href="?" target="_self">我录入的信息</a><a href="?" target="_self">有附件</a><a href="?" target="_self">草稿</a></div>
    <div style=" padding:3px; margin:5px;"><a  onclick="return isSelected(this)"   href="?action={d}" target="_self">删除</a><a  onclick="return isSelected(this)"   href="?action={p}" target="_self">彻底删除</a><a  onclick="return isSelected(this)"   href="?action={e}{(ischeck)(=)(0 1)}" target="_self">审核</a><a  onclick="return isSelected(this)"   href="?action=Lock" target="_self">锁</a><a  onclick="return isSelected(this)"   href="?action=" target="_self">归档</a><a  onclick="return isSelected(this)"   href="?action=e{isNew}b" target="_self">新</a><a  onclick="return isSelected(this)"   href="?action=e{ishot}b" target="_self">热</a><a  onclick="return isSelected(this)"   href="?action=Top" target="_self">顶</a><a  onclick="return isSelected(this)"   href="?action=Commend" target="_self">推荐</a><a  onclick="return isSelected(this)"   href="?" target="_self">精彩</a><a  onclick="return isSelected(this)"   href="?" target="_self">头条</a><a  onclick="return isSelected(this)"   href="?action=Copy" target="_self">复制</a><a  onclick="return isSelected(this)"   href="?action=Move" target="_self">移动</a><a  onclick="return isSelected(this)"   href="?action={d}" target="_self">删除</a><a  onclick="return isSelected(this)"   href="?action={p}" target="_self">彻底删除</a><a  onclick="return isSelected(this)"   href="?action={e}{(ischeck)(=)(0 1)}" target="_self">审核</a><a  onclick="return isSelected(this)"   href="?action=Lock" target="_self">锁</a><a  onclick="return isSelected(this)"   href="?action=" target="_self">归档</a><a  onclick="return isSelected(this)"   href="?action=e{isNew}b" target="_self">新</a><a  onclick="return isSelected(this)"   href="?action=e{ishot}b" target="_self">热</a><a  onclick="return isSelected(this)"   href="?action=Top" target="_self">顶</a><a  onclick="return isSelected(this)"   href="?action=Commend" target="_self">推荐</a><a  onclick="return isSelected(this)"   href="?" target="_self">精彩</a><a  onclick="return isSelected(this)"   href="?" target="_self">头条</a><a  onclick="return isSelected(this)"   href="?action=Copy" target="_self">复制</a><a  onclick="return isSelected(this)"   href="?action=Move" target="_self">移动</a></div>
    <div>
    <table id="_ListInfoListTable">  
        <tr><td width="20"  align="center" ><input type="checkbox" name="SlectAll" id="SlectAll" /></td><td align="center"  width="20"><a href="javascript:Sort('[ClassName]','3')">类型名称</a></td><td  align="center">操作</td></tr>
        <asp:Repeater ID="rptListInfo" runat="server">
        <ItemTemplate>
        <tr><td align="center" ><input type="checkbox" name="_chkID" value="<%#Eval("ID") %>" /></td><td><%#Eval("ClassName") %></td><td align="center"><a href="NewsClassedit.aspx?actioin={e}{(ModelID)(=)(5204ed1-a0fd-42)}{(ID)(=)(<%#Eval("ID") %>)}" target="_blank">修改</a>&nbsp;<a href="?action={d}{(ID)(=)(<%#Eval("ID") %>)}" target="_self">彻底删除</a>&nbsp;<a href="?action={e}{(IsDel)(1)}{ID=<%#Eval("ID") %>}" target="_self">删除到回收站</a></td</tr>
        </ItemTemplate>
        </asp:Repeater>
        
    </table>
    </div>
    <div>
    </div>
    <div>
    <webdiyer:aspnetpager id="Split" runat="server" PageSize="20" AlwaysShow="True" OnPageChanged="Split_PageChanged" ShowCustomInfoSection="Left" CustomInfoSectionWidth="20%" ShowPageIndexBox="always" PageIndexBoxType="DropDownList"
    CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录"></webdiyer:aspnetpager>
   </div>
   <asp:HiddenField ID="hdnModelID" Value="5204ed1-a0fd-42" runat="server" /><asp:HiddenField ID="hdnTableName" Value="K_U_NewsClass" runat="server" /><asp:HiddenField ID="hdnCustomCol" Value="" runat="server" />
    </form>
    
</body>
</html>