<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
                                       <asp:Image ID="Image7" runat="server" ImageUrl="~/images/热卖.jpg" Width="600px" /><br />
                                
                                <asp:DataList ID="dlstGoods" runat="server" DataKeyField="GoodsID" OnItemCommand="dlstGoods_ItemCommand" RepeatColumns="4" RepeatDirection="Horizontal"
                                    Width="591px">
                                    <ItemTemplate>
                                        <table cellpadding="0" cellspacing="0" style="border: gray 1px solid; height: 175px;
                                            text-align: center">
                                            <tr>
                                                <td colspan="2" height="100">
                                                    <asp:Image ID="Image1" runat="server" Height="91px" ImageUrl='<%# Eval("GoodsPicture") %>'
                                                        Width="103px" /></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height: 25px">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("GoodsName") %>'></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px; height: 25px">
                                                    商品价格：</td>
                                                <td style="width: 100px; text-align: left">
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label>元</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px; height: 25px; text-align: left">
                                                    <asp:LinkButton ID="LinkButton6" runat="server" CommandName="detail" >详细信息</asp:LinkButton></td>
                                                <td style="width: 100px; text-align: left">
                                                    &nbsp;<asp:LinkButton ID="LinkButton5" runat="server" CommandName="buy">购买</asp:LinkButton></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>&nbsp;
</asp:Content>

