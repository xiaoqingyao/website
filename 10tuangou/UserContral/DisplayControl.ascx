<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DisplayControl.ascx.cs" Inherits="UserContral_DisplayControl" %>
<asp:DataList ID="DataList1" runat="server" RepeatColumns="1" Width="100%">
    <ItemTemplate>
        <table>
            <tr>
                <td rowspan="5" style="width: 100px">
                    <a href='<%#"Info.aspx?gid="+Eval("gatherId").ToString()+"&cid="+Eval("companyId")%>'>
                        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("pdPhoto") %>'
                            Width="90px" /></a></td>
                <td style="width: 181px; height: 39px;">
                    <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#FF8000" NavigateUrl='<%# "Info.aspx?gid="+Eval("gatherId").ToString()+"&cid="+Eval("companyId") %>'
                        Style="float: left" Text='<%# Eval("gatherTitle") %>'></asp:HyperLink>
                    &nbsp;
                    <asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="True" ForeColor="Red" NavigateUrl='<%# "../Validate_Info.aspx?gid="+Eval("gatherId")+"&pid="+Eval("productId") %>'>加入团购</asp:HyperLink></td>
                <td rowspan="2" style="width: 100px">
                    <asp:Label ID="Label1" runat="server" BackColor="Yellow" Height="32px" Style="float: right"
                        Text='<%# Eval("number")+"<br>"+"  人已报名" %>' Width="73px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 181px; height: 21px;">
                    <asp:Label ID="Label3" runat="server" Style="float: left" Text='<%# "发布于："+Eval("startTime","{0:yyyy-MM-dd}") %>'></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label4" runat="server" Style="float: left" Text='<%# "产品名："+Eval("productName") %>'></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label5" runat="server" Style="float: left" Text='市场价  ：'></asp:Label>
                    <asp:Label ID="Label6" runat="server" ForeColor="Red" Text='<%# Eval("pdPrice","{0:C}") %>'></asp:Label>
                    <asp:Label ID="Label7" runat="server" Text="团购价  ："></asp:Label>
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("gPrice","{0:C}") %>'></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 21px">
                    <asp:Label ID="Label2" runat="server" Style="float: left" Text='<%# "起始人数要求 ：" %>'></asp:Label>
                    <asp:Label ID="Label9" runat="server" ForeColor="Red" Style="float: left" Text='<%# Eval("gatherNum")+"人"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" %>'></asp:Label>
                    <asp:Label ID="Label10" runat="server" Text='<%# "查看次数："+"&nbsp;&nbsp;" %>'></asp:Label>
                    <asp:Label ID="Label11" runat="server" ForeColor="Red" Text='<%# Eval("heat") %>'></asp:Label></td>
            </tr>
        </table>
    </ItemTemplate>
    <SeparatorTemplate>
        ------------------------------------------------------------ ------
    </SeparatorTemplate>
    <FooterTemplate>
        <table>
            <tr>
                <td style="width: 100px; height: 21px">
                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black" OnClick="LinkButton1_Click"
                        Style="float: right">上一页</asp:LinkButton></td>
                <td style="width: 100px; height: 21px">
                </td>
                <td style="width: 100px; height: 21px">
                    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Black" OnClick="LinkButton2_Click">下一页</asp:LinkButton></td>
            </tr>
        </table>
    </FooterTemplate>
</asp:DataList>
