<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DetailControl.ascx.cs" Inherits="UserContral_DetailControl" %>
<asp:DataList ID="DataList1" runat="server" OnItemDataBound="DataList1_ItemDataBound"
    OnSelectedIndexChanged="DataList1_SelectedIndexChanged" Width="100%">
    <ItemTemplate>
        <table style="width: 425px">
            <tr>
                <td rowspan="4" style="width: 100px">
                    <asp:Image ID="Image1" runat="server" Height="120px" ImageUrl='<%# Eval("pdPhoto") %>'
                        Width="100px" /></td>
                <td style="width: 243px; height: 21px">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Navy" Text='<%# Eval("gatherTitle") %>'></asp:Label>&nbsp;
                    <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Fuchsia" Style="float: right"
                        Text='<%# "&nbsp;&nbsp;&nbsp;"+Eval("heat") %>'></asp:Label>
                    <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Image/guanzhudu.gif" Style="float: right">HyperLink</asp:HyperLink></td>
                <td rowspan="3" style="width: 63px">
                    &nbsp;<asp:Label ID="Label1" runat="server" BackColor="Yellow" BorderColor="Ivory"
                        Height="20px" Style="float: right" Text='<%# Eval("number")+"<br>"+"人已报名" %>'
                        Width="55px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 243px">
                    <asp:Label ID="Label3" runat="server" Text='<%# "产品名："+Eval("productName") %>'></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 243px; height: 21px">
                    <asp:Label ID="Label4" runat="server" Text='<%# "市场价　："+Eval("pdPrice","{0:C}")+"团购人数　："+Eval("gatherNum") %>'></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 21px">
                    <asp:Label ID="Label5" runat="server" Text="团购价:"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("gPrice","{0:C}") %>'></asp:Label>
                    <asp:Label ID="Label7" runat="server" Text='<%# "加入时间："+Eval("startTime","{0:yyyy-MM-dd}") %>'></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 21px;">
                    <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="../Image/jc2-1.gif" 
                        NavigateUrl='<%# Eval("pdPhoto") %>'>HyperLink</asp:HyperLink></td>
                <td colspan="2" style="height: 21px">
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="../Image/joinin.gif"
                        NavigateUrl='<%# "../Validate_Info.aspx?gid="+Eval("gatherId")+"&pid="+Eval("productId") %>'
                        Style="float: left">HyperLink</asp:HyperLink>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("productId") %>' />
              
                </td>
            </tr>
            <tr>
                <td colspan="3" style="height: 21px;">
                    <asp:Label ID="Label8" runat="server" Text="产品简介："></asp:Label><br />
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("productDesc") %>'></asp:Label></td>
            </tr>
            <tr>
                <td colspan="3" style="height: 21px">
                    <asp:DataList ID="DataList2" runat="server">
                        <ItemTemplate>
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("picture") %>' Style="vertical-align: middle;
                                text-align: center" Visible='<%# Eval("picture")==""? false:true %>' Width="400px" />
                        </ItemTemplate>
                    </asp:DataList></td>
            </tr>
            <tr>
                <td colspan="3" style="height: 21px">
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("productDesc") %>'></asp:Label></td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
