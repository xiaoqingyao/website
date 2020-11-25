<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GatherTypeIndex.ascx.cs" Inherits="UserContral_GatherTypeIndex" %>
<asp:DataList ID="DataList1" runat="server" RepeatColumns="2" Width="100%">
    <ItemTemplate>
        &nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" Height="34px" NavigateUrl='<%# "../List.aspx?gtypeId="+Eval("gTypeId") %>'
            Text='<%# Eval("gTypeName") %>'></asp:HyperLink>
    </ItemTemplate>
    <HeaderTemplate>
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td style="width: 100%; vertical-align: middle; text-align: center; background-image: url(Image/generally_top_bg_1.gif);
                    color: dimgray; height: 30px">
                    <asp:Label ID="Label1" runat="server" ForeColor="#0000C0" Style="font-weight: bold"
                        Text="分类索引"></asp:Label>
                </td>
            </tr>
        </table>
    </HeaderTemplate>
</asp:DataList>
