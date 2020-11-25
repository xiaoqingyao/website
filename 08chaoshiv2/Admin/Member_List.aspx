<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Member_List.aspx.cs" Inherits="Admin_FenLei_List" %>

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
                    会员管理</td>
            </tr>
            <tr>
                <td   align="left">
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="830px">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="MemberName" HeaderText="会员名" />
                            <asp:BoundField DataField="Sex" HeaderText="性别" />
                            <asp:BoundField DataField="RealName" HeaderText="真实姓名" />
                            <asp:BoundField DataField="MobileTel" HeaderText="电话" />
                            <asp:BoundField DataField="Email" HeaderText="邮箱" />
                            <asp:BoundField DataField="Address" HeaderText="地址" />
                            <asp:BoundField DataField="Code" HeaderText="邮政编码" />
                            <asp:HyperLinkField DataNavigateUrlFields="MemberID" 
                                DataNavigateUrlFormatString="MemberD.aspx?ID={0} " HeaderText="删除" 
                                Text="删除" />
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
                       </div>
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
