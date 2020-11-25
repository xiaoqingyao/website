<%@ Page Language="C#" AutoEventWireup="true" CodeFile="huodongmingxi.aspx.cs" Inherits="huodongmingxi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>活动明细</title>
</head>
<body  style="background-color:#E2F4FC">
    <form id="form1" runat="server">
    <div style="margin-top: 5px; margin-left: 5px;">
        <table>
            <tr>
                <td>
                    活动标题:
                </td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    活动日期：
                </td>
                <td>
                    <input id="txtDate" runat="server" name="txttime1" onclick="getDateString(this,oCalendarChs)"
                        type="text" value="--请选择日期--" />
                </td>
            </tr>
            <tr>
                <td>
                    活动内容：
                </td>
                <td>
                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Width="400" Height="240">
                    
                    </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    赠送积分：
                </td>
                <td>
                    <asp:TextBox ID="txtJfen" runat="server" Text="0">
                    </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    最大人数上限：
                </td>
                <td>
                    <asp:TextBox ID="txtMaxRenShu" runat="server" Text="1">
                    </asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
