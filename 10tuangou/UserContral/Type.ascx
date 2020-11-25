<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Type.ascx.cs" Inherits="UserContral_Type" %>
<asp:DataList ID="DataList1" runat="server" OnItemDataBound="DataList1_ItemDataBound"
    Width="100%">
    <ItemTemplate>
        <table>
            <tr>
                <td style="width: 284px; height: 21px">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("gTypeName") %>' Width="104px"></asp:Label></td>
                <td style="width: 100px; height: 21px">
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "../List.aspx?gtypeId="+Eval("gTypeId") %>'
                        Style="float: right">更多</asp:HyperLink></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 99px">
                    <asp:DataList ID="DataList2" runat="server" RepeatColumns="6">
                        <ItemTemplate>
                            <br />
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        &nbsp;<a href='<%# "Info.aspx?gid="+DataBinder.Eval(Container.DataItem,"gatherId").ToString()+"&"+"cid="+Eval("companyId") %>'><asp:Image
                                            ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("productPhoto") %>'
                                            Width="90px" /></a>
                                    </td>
                                    <td style="width: 70px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 19px">
                                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# "../Info.aspx?gid="+DataBinder.Eval(Container.DataItem,"gatherId").ToString()+"&"+"cid="+Eval("companyId") %>'
                                            Text='<%# Eval("productName") %>'></asp:HyperLink>
                                    </td>
                                    <td style="width: 70px; height: 19px;">
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList></td>
            </tr>
        </table>
    </ItemTemplate>
    <SeparatorTemplate>
        <asp:Label ID="Label2" runat="server" ForeColor="#E0E0E0" Width="100%">---------------------------------------------------------------------</asp:Label>
    </SeparatorTemplate>
</asp:DataList>
