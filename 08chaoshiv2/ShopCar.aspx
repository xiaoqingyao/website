<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShopCar.aspx.cs" Inherits="ShopCar" ValidateRequest="false" %>

<%@ Register assembly="DotNetTextBox" namespace="DotNetTextBox" tagprefix="DNTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        } 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
     <asp:Panel ID="Panel2" runat="server" Height="800px">
         <table class="style1">
             <tr>
                 <td>
                     <asp:Image ID="Image4" runat="server" Height="31px" ImageUrl="~/images/购物.jpg" 
                         Width="583px" />
                 </td>
             </tr>
             <tr>
                 <td>
                      <table border="0"    cellpadding="0" cellspacing="0" style="width: 530px; height: 310px">
            <tr style ="height :20px;">
                <td  style ="text-align :left ;">
                    <asp:Label ID="Label1" runat="server" Text="购物车"></asp:Label>
                </td>
            </tr>
            <tr style ="height :290px;">
                <td   style="vertical-align :top ; text-align :left ; height: 290px;">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 520px">
                        <tr>
                            <td style="width: auto; height: 122px;">
                                <asp:GridView ID="gvShopCar" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="5"  OnPageIndexChanging="gvShopCar_PageIndexChanging" OnRowDeleting="gvShopCar_RowDeleting" OnRowEditing="gvShopCar_RowEditing" OnRowUpdating="gvShopCar_RowUpdating" OnRowDataBound="gvShopCar_RowDataBound" DataKeyNames="BuyID">
                                    <Columns>
                                        <asp:BoundField DataField="GoodsName" HeaderText="商品名称" ReadOnly="True">
                                            <ItemStyle HorizontalAlign="Center" Width="200px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Price" HeaderText="价格（元）" ReadOnly="True">
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Number" HeaderText="数量">
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SumPrice" HeaderText="小计" >
                                         <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                                    Text="删除" OnClientClick="return confirm('您确认删除该记录吗?');">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ShowEditButton="True" ShowCancelButton="False" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: auoto;">
                                <asp:Label ID="lbFlag" runat="server" Text="暂无商品"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: auto; height: 15px;">
                                合计：<asp:Label ID="lbSumPrice" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: auto; height: 18px;">
                                商品数量：<asp:Label ID="lbSumNum" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width:auto; text-align: center;">
                                <asp:LinkButton ID="LinkBtClear" runat="server" OnClick="LinkBtClear_Click">清空购物车</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="LinkBtKeepBuy" runat="server" OnClick="LinkBtKeepBuy_Click">继续购物</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="LinkBtCheck" runat="server" OnClick="LinkBtCheck_Click" OnClientClick="return confirm('如果订单不足30元将增加3元的配送费，请悉知哦');">结账</asp:LinkButton></td>
                        </tr>
                    </table>
                
                </td>
            </tr>
        </table></td>
             </tr>
         </table>
        
     </asp:Panel>
                                   
</asp:Content>

