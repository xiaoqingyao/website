<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserReg.aspx.cs" Inherits="UserReg" %>
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
<form runat="server" id="aa">
<uc1:Head ID="Head1" runat="server" />

<table width="950" height="273" border="0" align="center" cellpadding="0" cellspacing="0" style="background:#fff;">
  <tr>
    <td align="center" valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="30%" align="left"><br />
            <img src="images/ad.jpg" />
        </td>
        <td align="center" valign="top" style="min-height:300px;background:#f3f3f3;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <tr>
                <td style="border-bottom:#ccc solid 1px;" colspan="2">
                    <div class="aa_1">�û�ע��</div></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">��¼�ʺţ�</td>
                <td align="left"><asp:TextBox ID="txtRegUserName" runat="server" Width="145px" style="font-size:16px;"></asp:TextBox></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">��¼���룺</td>
                <td align="left"><asp:TextBox ID="txtRegUserPwd" runat="server" TextMode="Password" Width="145px" style="font-size:16px;"></asp:TextBox></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">ȷ�����룺</td>
                <td align="left"><asp:TextBox ID="txtRegUserPwd2" runat="server" TextMode="Password" Width="145px" style="font-size:16px;"></asp:TextBox></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">�ǳƣ�</td>
                <td align="left"><asp:TextBox ID="txtRegTitle" runat="server" Width="145px" style="font-size:16px;"></asp:TextBox></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">Email��</td>
                <td align="left"><asp:TextBox ID="txtRegTel" runat="server" Width="145px" style="font-size:16px;"></asp:TextBox></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">�ܱ����⣺</td>
                <td align="left"><asp:TextBox ID="wenti" runat="server" Width="145px" style="font-size:16px;"></asp:TextBox> �һ�����ʱ��</td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">�ܱ��𰸣�</td>
                <td align="left"><asp:TextBox ID="daan" runat="server" Width="145px" style="font-size:16px;"></asp:TextBox> �һ�����ʱ��</td>
            </tr>
            <tr height="40">
                <td align="center" colspan="2">
                    <asp:Button ID="btnReg" runat="server" Text=" �ύע�� " style="font-size:16px;" OnClick="btnReg_Click" />
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