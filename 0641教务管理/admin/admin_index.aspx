<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_index.aspx.cs" Inherits="admin_index" %>
<%@ Register Src="../UserControls/fooder2.ascx" TagName="Header2" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/Fooder1.ascx" TagName="Fooder" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理员主页面</title>
     <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body background="../pic/back_01.gif" style="text-align: center">
    <form id="form1" runat="server">
 <div style="text-align: center">
        <table align="center" bgcolor="#ffffff" border="0" bordercolor="#215dc6" cellpadding="0" cellspacing="0" width="1000" style="text-align: center; table-layout: auto; vertical-align: middle; border-top-style: dotted; border-right-style: dotted; border-left-style: dotted; position: relative; border-bottom-style: dotted; left: 48px; top: 5px; height: 205px;">
            <tr>
                <td colspan="2" style="height: 54px">
                    <uc1:Header2 ID="Header2" runat="server" />
                </td>
            </tr>
            <tr>
                <td height="453" rowspan="2" style="width: 95px">
                    &nbsp;<iframe src=tleft.htm style="width: 165px; height: 453px" frameborder=1 scrolling=auto></iframe>
                </td>
                <td bgcolor="#333300" style="text-align:center; height: 26px; width: 605px;" align="center">
                    <span style="font-size: 9pt; color: #ffffff">&nbsp;用户ID：</span><asp:Label ID="lblwz" runat="server" Font-Size="9pt" ForeColor="White"></asp:Label>&nbsp;&nbsp;<span
                        style="color: #ffffff">用户姓名：<asp:Label ID="lblname" runat="server" Font-Size="9pt"></asp:Label></span>&nbsp;
                    <span style="color: #ffffff">用户身份：管理员 </span>
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" ForeColor="White"
                        OnClick="LinkButton1_Click" Font-Underline="False">【安全退出】</asp:LinkButton></td>
            </tr>
            <tr>
                <td height="155" style="width: 800px" align="center">
                    <iframe name="menu" frameborder=0 scrolling=auto style="width: 800px; height: 422px" src=admin_ChangePwd.aspx></iframe>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="height: 33px">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
        &nbsp;
    </form>
</body>
</html>
