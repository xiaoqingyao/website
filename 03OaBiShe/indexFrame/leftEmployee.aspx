<%@ Page Language="C#" AutoEventWireup="true" CodeFile="leftEmployee.aspx.cs" Inherits="indexFrame_right" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link rel="stylesheet" type="text/css" href="../CSS/CSS.css" />
</head>
<body style="margin-top: 0px; padding-top: 0px;">
    <form id="form1" runat="server">
        <table style="width: 205px; height: 154px; background-image: url(../image/OA办公自动化系统首页left.gif);" align="center" cellspacing="0">
            <tr>
                <td align="center" style="width: 147px; height: 31px">
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 147px; height: 336px; margin-left: 100px;">
        <asp:DataList ID="DataList1" runat="server" CellPadding="3" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal" Width="185px">
            <ItemTemplate>
                <table style="width: 180px; height: 70px; background-color: #a8bfff;" class="css" border="2" cellspacing="0">
                    <tr>
                        <td rowspan="3" style="width: 1px; margin-left: 0px; margin-right: 0px;">
                            <asp:Image ID="Image1" runat="server" Height="70px" Width="56px" ImageUrl=<%# DataBinder.Eval(Container.DataItem,"photoPath") %> /></td>
                        <td colspan="2" style="width: 107px" align="left">
                            姓名：<%# DataBinder.Eval(Container.DataItem,"name") %></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 107px" align="left">
                            班级：<%# DataBinder.Eval(Container.DataItem,"dept") %></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 107px" align="left">
                            职务：<%# DataBinder.Eval(Container.DataItem,"job") %></td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingItemStyle BackColor="#F7F7F7" />
            <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        </asp:DataList>&nbsp;
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
