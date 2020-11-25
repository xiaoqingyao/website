<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GoodsDetail.aspx.cs" Inherits="GoodsDetail" ValidateRequest="false" %>

<%@ Register assembly="DotNetTextBox" namespace="DotNetTextBox" tagprefix="DNTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
   
     <asp:Panel ID="Panel2" runat="server" Height="800px">
           <table >
            <tr>
                <td>
                    <asp:Image ID="Image3" runat="server" Height="31px" ImageUrl="~/images/商品.jpg" 
                        Width="583px" />
                </td>
            </tr>
            <tr>
                <td>
                    <table >
                        <tr>
                            <td align="left" style="width: 93px; height: 23px;">
                                名称：</td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <td align="left" style="width: 93px; height: 23px;">
                                商家：</td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 93px; height: 23px;">
                                库存：</td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 93px; height: 23px;">
                                价格：</td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 93px; height: 23px">
                                类别：</td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                          <td align="left" style="width: 93px; height: 23px;">
                              照片：</td>
                            <td>
                                <asp:Image ID="Image10" runat="server" Width="400" Height="400" />
                            </td>
                        </tr>
                        <tr>
                           <td align="left" style="width: 93px; height: 23px;">
                               简介：</td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="加入购物车" onclick="Button1_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="587px">
             <Columns>
                 <asp:BoundField DataField="UserName" HeaderText="评价人" />
                 <asp:BoundField DataField="PingJia" HeaderText="评价内容" />
                 <asp:BoundField DataField="PingJiaTime" HeaderText="评价时间" />
             </Columns>
         </asp:GridView>
         
                                     </asp:Panel>
                                   
</asp:Content>

