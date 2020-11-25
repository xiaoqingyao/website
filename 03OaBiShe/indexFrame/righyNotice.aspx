<%@ Page Language="C#" AutoEventWireup="true" CodeFile="righyNotice.aspx.cs" Inherits="indexFrame_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link rel="stylesheet" type ="text/css" href="../CSS/CSS.css" />
</head>
<body style="background-image: url(../image/rightFrame.jpg)">
    <form id="form1" runat="server" >
    <div>
        &nbsp;</div>
        <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#E7E7FF"
            BorderStyle="None" BorderWidth="0px" CellPadding="3" GridLines="Horizontal" align="center" ForeColor="White">
            <FooterStyle BackColor="Fuchsia" ForeColor="#4A3C8C" />
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <ItemTemplate>
                <table style="width: 670px; height: 80px; background-color: #b1c7fc; color: white;" border="1" class="css">
                    <tr>
                        <td rowspan="3" style="width: 93px; background-color: #ff66ff;">
                            <asp:Image ID="Image1" runat="server" Height="69px" Width="100px" ImageUrl="~/image/dong11.gif" /></td>
                        <td align="center" colspan="2" style="height: 18px; font-size: 10pt; color: #0000cc;">
                            公告标题：<%# DataBinder.Eval(Container.DataItem,"noticeTitle")%></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 22px; color: #6600cc;">
                            公告内容：<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<%# DataBinder.Eval(Container.DataItem,"noticeContent")%>
                            
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 475px; color: #6600cc;" align="right">
                            公告日期：<%# DataBinder.Eval(Container.DataItem,"noticeTime")%></td>
                        <td style="width: 475px; color: #6600cc;" align="center">
                            发布公告人：<%# DataBinder.Eval(Container.DataItem,"noticePerson")%></td>
                    </tr>
                </table>
            </ItemTemplate>
            <AlternatingItemStyle BackColor="#F7F7F7" />
            <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        </asp:DataList>
    </form>
</body>
</html>
