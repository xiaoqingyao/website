<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student_index.aspx.cs" Inherits="teacher_index" %>
<%@ Register Src="../UserControls/fooder2.ascx" TagName="Header2" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/Fooder1.ascx" TagName="Fooder" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
     <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body background="../Image/back_01.gif" style="text-align: center">
    <form id="form1" runat="server">
 <div style="text-align: center">
        <table align="center" bgcolor="#ffffff" border="0" bordercolor="#215dc6" cellpadding="0" cellspacing="0"
            height="278" width="778">
            <tr>
                <td colspan="2" height="54">
                    <uc1:Header2 ID="Header2" runat="server" />
                </td>
            </tr>
            <tr>
                <td height="453" rowspan="2" width="165">
                    &nbsp;<iframe src=Tleft.htm style="width: 229px; height: 453px" frameborder=0 scrolling=no></iframe>
                </td>
                <td bgcolor="#333300" style="text-align: left; height: 26px;">
                    <span style="font-size: 9pt; color: #ffffff">&nbsp;用户ID：</span><asp:Label ID="lblwz" runat="server" Font-Size="9pt" ForeColor="White"></asp:Label>&nbsp;&nbsp;<span
                        style="color: #ffffff">用户姓名：<asp:Label ID="lblname" runat="server" Font-Size="9pt"></asp:Label></span>&nbsp;
                    <span style="color: #ffffff">用户身份：学生 </span>
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" ForeColor="White"
                        OnClick="LinkButton1_Click" Font-Underline="False">【安全退出】</asp:LinkButton></td>
            </tr>
            <tr>
                <td height="155">
                    <iframe name="menu" frameborder=0 scrolling=auto style="width: 596px; height: 422px" src=studentChangePwd.aspx></iframe>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" height="43">
                    <uc2:Fooder ID="Fooder1" runat="server" />
                </td>
            </tr>
        </table>
    
    </div>
        &nbsp;
    </form>
</body>
</html>
