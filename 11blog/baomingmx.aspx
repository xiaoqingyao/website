<%@ Page Language="C#" AutoEventWireup="true" CodeFile="baomingmx.aspx.cs" Inherits="baomingmx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>活动报名明细</title>
    <base target="_self" />
</head>
<body style="background-color: #E2F4FC">
    <form id="form1" runat="server">
    <div style="margin-top: 5px; margin-left: 5px;">
        <table width="90%">
            <tr>
                <td>
                    活动名称：<asp:Label ID="lblname" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblmsg" runat="server" Text="以下是活动报名明细"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="95%" OnRowDataBound="rowdatabind">
                        <Columns>
                            <asp:BoundField HeaderText="序号" DataField="bmid" />
                            <asp:BoundField HeaderText="姓名" DataField="username" />
                            <asp:BoundField HeaderText="性别" DataField="Sex" />
                            <asp:BoundField HeaderText="电话" DataField="Tel" />
                            <asp:BoundField HeaderText="地址" DataField="ADdress" />
                            <asp:BoundField HeaderText="报名日期" DataField="bmdate" />
                            <asp:TemplateField HeaderText="操作">
                                <ItemTemplate>
                                    <asp:Button ID="btnDel" runat="server" Text="删除TA" CommandArgument='<%#Eval("listid") %>'
                                        OnClick="btnDel_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
