<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserXinManage.aspx.cs" Inherits="UserXinManage" %>
<%@ Register src="Controls/Head.ascx" tagname="Head" tagprefix="uc1" %>
<%@ Register src="Controls/Foot.ascx" tagname="Foot" tagprefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���˲���ϵͳ[��ҵ���]</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form runat="server">
<uc1:Head ID="Head1" runat="server" />

<table width="950" height="273" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:10px;">
      <tr>
        <td valign="top" style="width:180px;height:24px; background:url(images/gy.jpg) repeat-x; text-align:center;border:solid 1px #ddd; font-size:14px;">
            <br /><br />
            <a href="usermain.aspx"><font color="#2d7e17">���˻�����Ϣ</font></a><br /><br />
            <a href="userguanzhu.aspx"><font color="#2d7e17">�ҵ��ղ�</font></a><br /><br />
            <a href="userpicoper.aspx"><font color="#2d7e17">�ϴ����</font></a><br /><br />
            <a href="userpicmanage.aspx"><font color="#2d7e17">�ҵ�������</font></a><br /><br />
            <a href="userblogoper.aspx"><font color="#2d7e17">��������</font></a><br /><br />
            <a href="userBlogmanage.aspx"><font color="#2d7e17">�ҵĲ��͹���</font></a><br /><br />
            <a href="userhaoyou.aspx"><font color="#2d7e17">�ҵĺ���</font></a><br /><br />
            <a href="userxinmanage.aspx"><font color="#2d7e17">վ����</font></a><br /><br />
            <a href="userlogout.aspx"><font color="#2d7e17">�˳���¼</font></a><br />
        </td>
        <td align="center" valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td style="width:100%;height:24px; background:url(images/gy.jpg) repeat-x; text-align:center;border:solid 1px #ddd;">
                &nbsp;&nbsp;&nbsp;&nbsp;�ҵ�վ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="userxinoper.aspx">��վ����</a>
                </td>
            </tr>
            <tr>
                <td style="padding:10px 0 10px 10px;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#9FBD65" onmouseover="changeto()"  onmouseout="changeback()" class="tab1">
                            <tr class="top_tr">
                                <td width="5%" align="center">ID</td>
                                <td align="center">��</td>
                                <td align="center">����</td>
                                <td align="center">ʱ��</td>
                                <td width="10%" align="center">����</td>
                            </tr>
                            <asp:Repeater ID="rptList" runat="server"   onitemcommand="rptList_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td align="center"><asp:Label ID="lblId" runat="server" Text='<%#Eval("XinId")%>'></asp:Label></td>
                                        <td align="center"><%#Eval("username").ToString() == username ? ("<font color='blue'>To��" + Eval("tousername") + "</font>") : ("<font color='green'>From��" + Eval("username") + "</font> | <a href='userxinoper.aspx?tousername=" + Eval("username") + "'><font color='red'>����</font></a>")%></td>
                                        <td align="center"><%#Eval("xinname")%></td>
                                        <td align="center"><%#Eval("addtime")%></td>
                                        <td align="center">
                                            <asp:LinkButton ID="LinkButton1"  OnClientClick="JavaScript:return confirm('ȷ��Ҫɾ����')" runat="server" CommandArgument='<%#Eval("XinId") %>' CommandName="del">ɾ��</asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                </td>
            </tr>
        </table>
        </td>
        
      </tr>
    </table></td>
  </tr>
</table>

<uc2:Foot ID="Foot1" runat="server" />
</form>
</body>
</html>