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
    <div style=" padding:3px; margin:5px;"><a href="NewsClassedit.aspx?ModelID=5204ed1-a0fd-42&action=add" target="_blank">���</a><a href="?Action={e}{[IsCheck](=)(1)}" target="_self">�����</a><a href="?Action={e}{[IsCheck](=)(1)}" target="_self">δ���</a><a href="?" target="_self">Ͷ��</a><a href="?IsLock=1" target="_self">����</a><a href="?IsLock=0" target="_self">����</a><a href="?{IsCommend=1}" target="_self">�Ƽ�</a><a href="?IsTop=1" target="_self">�ö�</a><a href="?IsNew=1" target="_self">����</a><a href="?IsHot=1" target="_self">�ȵ�</a><a href="?" target="_self">�õ�Ƭ</a><a href="?" target="_self">����</a><a href="?" target="_self">ͼƬ</a><a href="?" target="_self">ͷ��</a><a href="?" target="_self">������</a><a href="?" target="_self">δ����</a><a href="?" target="_self">��������</a><a href="?" target="_self">��¼�����Ϣ</a><a href="?" target="_self">�и���</a><a href="?" target="_self">�ݸ�</a><a href="NewsClassedit.aspx?ModelID=5204ed1-a0fd-42&action=add" target="_blank">���</a><a href="?Action={e}{[IsCheck](=)(1)}" target="_self">�����</a><a href="?Action={e}{[IsCheck](=)(1)}" target="_self">δ���</a><a href="?" target="_self">Ͷ��</a><a href="?IsLock=1" target="_self">����</a><a href="?IsLock=0" target="_self">����</a><a href="?{IsCommend=1}" target="_self">�Ƽ�</a><a href="?IsTop=1" target="_self">�ö�</a><a href="?IsNew=1" target="_self">����</a><a href="?IsHot=1" target="_self">�ȵ�</a><a href="?" target="_self">�õ�Ƭ</a><a href="?" target="_self">����</a><a href="?" target="_self">ͼƬ</a><a href="?" target="_self">ͷ��</a><a href="?" target="_self">������</a><a href="?" target="_self">δ����</a><a href="?" target="_self">��������</a><a href="?" target="_self">��¼�����Ϣ</a><a href="?" target="_self">�и���</a><a href="?" target="_self">�ݸ�</a></div>
    <div style=" padding:3px; margin:5px;"><a  onclick="return isSelected(this)"   href="?action={d}" target="_self">ɾ��</a><a  onclick="return isSelected(this)"   href="?action={p}" target="_self">����ɾ��</a><a  onclick="return isSelected(this)"   href="?action={e}{(ischeck)(=)(0 1)}" target="_self">���</a><a  onclick="return isSelected(this)"   href="?action=Lock" target="_self">��</a><a  onclick="return isSelected(this)"   href="?action=" target="_self">�鵵</a><a  onclick="return isSelected(this)"   href="?action=e{isNew}b" target="_self">��</a><a  onclick="return isSelected(this)"   href="?action=e{ishot}b" target="_self">��</a><a  onclick="return isSelected(this)"   href="?action=Top" target="_self">��</a><a  onclick="return isSelected(this)"   href="?action=Commend" target="_self">�Ƽ�</a><a  onclick="return isSelected(this)"   href="?" target="_self">����</a><a  onclick="return isSelected(this)"   href="?" target="_self">ͷ��</a><a  onclick="return isSelected(this)"   href="?action=Copy" target="_self">����</a><a  onclick="return isSelected(this)"   href="?action=Move" target="_self">�ƶ�</a><a  onclick="return isSelected(this)"   href="?action={d}" target="_self">ɾ��</a><a  onclick="return isSelected(this)"   href="?action={p}" target="_self">����ɾ��</a><a  onclick="return isSelected(this)"   href="?action={e}{(ischeck)(=)(0 1)}" target="_self">���</a><a  onclick="return isSelected(this)"   href="?action=Lock" target="_self">��</a><a  onclick="return isSelected(this)"   href="?action=" target="_self">�鵵</a><a  onclick="return isSelected(this)"   href="?action=e{isNew}b" target="_self">��</a><a  onclick="return isSelected(this)"   href="?action=e{ishot}b" target="_self">��</a><a  onclick="return isSelected(this)"   href="?action=Top" target="_self">��</a><a  onclick="return isSelected(this)"   href="?action=Commend" target="_self">�Ƽ�</a><a  onclick="return isSelected(this)"   href="?" target="_self">����</a><a  onclick="return isSelected(this)"   href="?" target="_self">ͷ��</a><a  onclick="return isSelected(this)"   href="?action=Copy" target="_self">����</a><a  onclick="return isSelected(this)"   href="?action=Move" target="_self">�ƶ�</a></div>
    <div>
    <table id="_ListInfoListTable">  
        <tr><td width="20"  align="center" ><input type="checkbox" name="SlectAll" id="SlectAll" /></td><td align="center"  width="20"><a href="javascript:Sort('[ClassName]','3')">��������</a></td><td  align="center">����</td></tr>
        <asp:Repeater ID="rptListInfo" runat="server">
        <ItemTemplate>
        <tr><td align="center" ><input type="checkbox" name="_chkID" value="<%#Eval("ID") %>" /></td><td><%#Eval("ClassName") %></td><td align="center"><a href="NewsClassedit.aspx?actioin={e}{(ModelID)(=)(5204ed1-a0fd-42)}{(ID)(=)(<%#Eval("ID") %>)}" target="_blank">�޸�</a>&nbsp;<a href="?action={d}{(ID)(=)(<%#Eval("ID") %>)}" target="_self">����ɾ��</a>&nbsp;<a href="?action={e}{(IsDel)(1)}{ID=<%#Eval("ID") %>}" target="_self">ɾ��������վ</a></td</tr>
        </ItemTemplate>
        </asp:Repeater>
        
    </table>
    </div>
    <div>
    </div>
    <div>
    <webdiyer:aspnetpager id="Split" runat="server" PageSize="20" AlwaysShow="True" OnPageChanged="Split_PageChanged" ShowCustomInfoSection="Left" CustomInfoSectionWidth="20%" ShowPageIndexBox="always" PageIndexBoxType="DropDownList"
    CustomInfoHTML="��<font color='red'><b>%currentPageIndex%</b></font>ҳ����%PageCount%ҳ��ÿҳ��ʾ%PageSize%����¼"></webdiyer:aspnetpager>
   </div>
   <asp:HiddenField ID="hdnModelID" Value="5204ed1-a0fd-42" runat="server" /><asp:HiddenField ID="hdnTableName" Value="K_U_NewsClass" runat="server" /><asp:HiddenField ID="hdnCustomCol" Value="" runat="server" />
    </form>
    
</body>
</html>