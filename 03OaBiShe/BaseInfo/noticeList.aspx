<%@ Page Language="C#" AutoEventWireup="true" CodeFile="noticeList.aspx.cs" Inherits="BaseInfo_noticeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css">
</head>
<body class="css" style="background-image: url(../image/rightFrame.gif);background-size: cover;">
    <form id="form1" runat="server">
    <div>
        <table style="width: 600px; height: 301px" class="css" align="center">
            <tr>
                <td style="width: 38px; height: 17px;">
                </td>
                <td style="width: 470px; height: 17px;">
                </td>
                <td style="height: 17px">
                </td>
            </tr>
            <tr>
                <td style="width: 38px">
                </td>
                <td style="width: 470px">
                    <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnDeleteCommand="DataList1_DeleteCommand" >
                        <ItemTemplate>
                            <table border="1" style="width: 500px; height: 0px" class="css">
                                <tr>
                                    <td rowspan="3" style="width: 55px">
                                        <asp:Image ID="Image1" runat="server" Height="64px" Width="64px" ImageUrl="~/image/dong9.gif" /></td>
                                    <td style="width: 690px">
                                        标题：<%# DataBinder.Eval(Container.DataItem,"noticeTitle") %></td>
                                    <td align="center" style="width: 266px">
                                        <asp:Button ID="btnDel" runat="server" Text="删　除" CommandName="delete" CssClass="blueButtonCss" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height: 40px">
                                    <%# DataBinder.Eval(Container.DataItem,"noticeContent") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 690px">
                                        时间：<%# DataBinder.Eval(Container.DataItem,"noticeTime","{0:yyyy-MM-dd}") %></td>
                                    <td style="width: 266px">
                                        发布人：<%# DataBinder.Eval(Container.DataItem,"noticePerson") %></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <AlternatingItemStyle BackColor="#F7F7F7" />
                        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    </asp:DataList></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 38px">
                </td>
                <td style="width: 470px">
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
