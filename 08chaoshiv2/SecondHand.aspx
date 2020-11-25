<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SecondHand.aspx.cs" Inherits="SecondHand" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">

    <asp:Panel ID="Panel2" runat="server" Height="800px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="587px">
            <Columns>

                <asp:BoundField DataField="Title" HeaderText="标题" />
                <asp:BoundField DataField="Content" HeaderText="发布内容" />
                <asp:BoundField DataField="price" HeaderText="价格" />
                <asp:BoundField DataField="CreateUser" HeaderText="发布人" />
                <asp:BoundField DataField="CreateDate" HeaderText="发布时间" />
                <asp:BoundField DataField="Phone" HeaderText="联系方式" />
                <asp:BoundField DataField="Address" HeaderText="交易地址" />

            </Columns>
        </asp:GridView>
        <table>

            <tr>
                <td>
                    <table>
                        <tr>
                            <td align="left" style="width: 93px; height: 23px;">标题：</td>
                            <td>
                                <asp:TextBox ID="tTitle" runat="server" Text=""></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 93px; height: 23px;">发布内容：</td>
                            <td>
                                <asp:TextBox ID="Content" runat="server" Text=""></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 93px; height: 23px;">价格：</td>
                            <td>
                                <asp:TextBox ID="price" runat="server" Text=""></asp:TextBox>
                            </td>
                        </tr>
                       
                       
                        <tr>
                            <td align="left" style="width: 93px; height: 23px;">联系方式：</td>
                            <td>
                                <asp:TextBox ID="Phone" runat="server" Text=""></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 93px; height: 23px;">交易地址：</td>
                            <td>
                                <asp:TextBox ID="Address" runat="server" Text=""></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="发布" OnClick="Button1_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>


    </asp:Panel>

</asp:Content>

