<%@ Page Language="C#" AutoEventWireup="true" CodeFile="New_List.aspx.cs" Inherits="Admin_FenLei_List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style type="text/css">

TD {
	COLOR: #000000; FONT-FAMILY: "Arial", "Helvetica", "sans-serif"; FONT-SIZE: 12px
} 
TH {
	COLOR: #000000; FONT-FAMILY: "Arial", "Helvetica", "sans-serif"; FONT-SIZE: 12px
} 
A:link {
	COLOR: #000000;
	TEXT-DECORATION: none;
} 
            .style1
            {
                font-size: larger;
            } 
    </style>
</head> 
<body>
    <form id="form1" runat="server">
    <div>
    <table   border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
            cellpadding="4" cellspacing="0" style="width: 100%">
            <tr bgcolor="#4296e7">
                <td colspan="1" style="height: 24px"align=center class="style1">                     
                    公告管理</td>
            </tr>
            <tr>
                <td   align="left">
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="830px">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="NewsTitle" HeaderText="标题" />
                            <asp:BoundField DataField="FaBuRen" HeaderText="发布人" />
                            <asp:BoundField DataField="NewsDate" HeaderText="发布时间" />
                            <asp:HyperLinkField DataNavigateUrlFields="NewsID" DataNavigateUrlFormatString="New.aspx?ID={0} "
                                HeaderText="编辑" Text="编辑" />
                            <asp:HyperLinkField DataNavigateUrlFields="NewsID" DataNavigateUrlFormatString="NewD.aspx?ID={0} "
                                HeaderText="删除" Text="删除" />
                        </Columns>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="1">
                    <div align="center">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/New.aspx" Target="_self">添加</asp:HyperLink>&nbsp;</div>
                </td>
            </tr>
            <tr bgcolor="#4296e7">
                <td colspan="1">
                     </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
