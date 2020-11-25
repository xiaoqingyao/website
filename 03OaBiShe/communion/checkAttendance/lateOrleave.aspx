<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lateOrleave.aspx.cs" Inherits="checkAttendance_lateOrleave" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../../CSS/CSS.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="refresh" content="5" />
</head>
<body style="background-image: url(../../image/rightFrame.gif)">
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table style="width: 319px; height: 1px" class="css" border="1" align="center">
            <tr>
                <td align="center" class="cssTitle" colspan="3">
                    <asp:Label ID="labTitle" runat="server" Text="上下课考勤" Width="172px"></asp:Label></td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 6px">
                    <asp:Label ID="Label1" runat="server" Text="Label" Width="179px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 83px; height: 14px">
                    上课签到：</td>
                <td style="width: 195px; height: 14px">
                    <asp:Label ID="labSTime" runat="server" Text="2006-2-6 15:42:48" Width="100px"></asp:Label><%#System.DateTime.Now.ToString() %></td>
                <td style="height: 14px">
                    <asp:Button ID="Button1" runat="server" Text="签　到" Width="58px" OnClick="Button1_Click" CssClass="redButtonCss" /></td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 22px">
                    <asp:Label ID="Label2" runat="server" Text="Label" Width="173px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 83px; height: 31px">
                    下课签退：</td>
                <td style="width: 195px; height: 31px">
                    <asp:Label ID="labXTime" runat="server" Text="2006-2-6 15:42:48" Width="100px"></asp:Label></td>
                <td style="height: 31px">
                    &nbsp;<asp:Button ID="Button2" runat="server" Text="签　退" Width="58px" OnClick="Button2_Click" CssClass="redButtonCss" /></td>
            </tr>
            <tr>
                <td align="right" colspan="3" style="height: 16px">
                    **请您自觉遵守考勤制度</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
