<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewDisplayControl2.ascx.cs" Inherits="UserContral_NewDisplayControl2" %>
<asp:DataList ID="dlNewGather" runat="server" Height="293px" RepeatColumns="6" Width="100%">
    <ItemTemplate>
        <table>
            <tr>
                <td style="width: 100px; height: 98px">
                    <a href='<%# "Info.aspx?gid="+Eval("gatherId").ToString()+"&cid="+Eval("companyId") %>'>
                        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("pdPhoto") %>'
                            Width="90px" /></a></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 44px">
                    <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Black" NavigateUrl='<%# "Info.aspx?gid="+Eval("gatherId").ToString()+"&cid="+Eval("companyId") %>'
                        Text='<%# Eval("productName") %>'></asp:HyperLink></td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
