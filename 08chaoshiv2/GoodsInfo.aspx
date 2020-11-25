<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GoodsInfo.aspx.cs" Inherits="GoodsInfo" ValidateRequest="false" %>

<%@ Register Assembly="wf.WebControls" Namespace="wf.WebPager" TagPrefix="cc1" %>

<%@ Register assembly="DotNetTextBox" namespace="DotNetTextBox" tagprefix="DNTB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
 <asp:Panel ID="Panel3" runat="server" Height="800px">
        <table> 
            <tr>
                <td>
                   <asp:Image ID="Image3" runat="server" Height="31px" ImageUrl="~/images/商品信息.jpg" 
                        Width="583px" />  
                </td>
            </tr>
            <tr>
                <td valign=top> 
        <asp:DataList ID="dlstGoods" runat="server" DataKeyField="GoodsID" 
            Height="402px" RepeatColumns="4" 
            RepeatDirection="Horizontal" Width="567px" onitemcommand="dlstGoods_ItemCommand">
            <ItemTemplate>
                <table cellpadding="0" cellspacing="0" style="border: gray 1px solid;
                                height: 175px; text-align: center">
                    <tr>
                        <td colspan="2" height="100">
                            <asp:Image ID="Image1" runat="server" Height="91px" 
                                ImageUrl='<%# Eval("GoodsPicture") %>' Width="103px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 25px">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("GoodsName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; height: 25px">
                            商品价格：</td>
                        <td style="width: 100px; text-align: left">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            元</td>
                    </tr>
                    <tr>
                        <td style="width: 100px; height: 25px; text-align: left">
                            <asp:LinkButton ID="LinkButton6" runat="server" CommandName="detail">详细信息</asp:LinkButton>
                        </td>
                        <td style="width: 100px; text-align: left">
                            &nbsp;<asp:LinkButton ID="LinkButton5" runat="server" CommandName="buy">购买</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
                    <cc1:webpager id="WebPager1" runat="server" controltopaginate="dlstGoods" onpageindexchanged="WebPager1_PageIndexChanged"
                        pagesize="12"></cc1:webpager>
         </td>
            </tr>
        </table>
        
</asp:Panel>                     
</asp:Content>

