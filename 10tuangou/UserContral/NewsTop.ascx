<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsTop.ascx.cs" Inherits="UserContral_NewsTop" %>
<asp:DataList ID="dlnews" runat="server" Width="100%">
    <ItemTemplate>
        <table style="width: 100%">
            <tr>
                <td style="width: 80px">
                    </td>
                <td style="width: 70%">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "../News.aspx?nid="+Eval("newsId") %>'
                        Style="float: left; color: black;" Text='<%# Eval("newsTitle") %>'></asp:HyperLink></td>
                <td style="width: 100px">
                    <asp:Label ID="Label1" runat="server" Style="float: right; color: darkgray;" Text='<%# Eval("startDate","{0:yyyy-MM-dd}") %>'></asp:Label></td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>