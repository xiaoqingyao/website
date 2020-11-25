<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginOut.aspx.cs" Inherits="LoginOut" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        .txt{ text-align:right; width:80px; height:40px}
    </style>
</head>
<body style="font-size:12px">
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td colspan="2" align="center">&nbsp;&nbsp;</td></tr>
        
        <tr>
            <td colspan="2" align="center" style=" text-align:center">确定要退出登录吗？</td></tr>
        <tr>
            <td colspan="2" align="center">&nbsp;&nbsp;</td></tr>
        <tr>
            <td colspan="2" align="right">
                <asp:Button ID="BtnOK" runat="server" Text="确 定" onclick="BtnOK_Click" />&nbsp;&nbsp;
            <asp:Button ID="BtnCancel" runat="server" Text="取 消" onclick="BtnCancel_Click" /></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
