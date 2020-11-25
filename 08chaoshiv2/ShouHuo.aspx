<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShouHuo.aspx.cs" Inherits="ShouHuo" ValidateRequest="false" %>

<%@ Register assembly="DotNetTextBox" namespace="DotNetTextBox" tagprefix="DNTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
  <asp:Panel ID="Panel3" runat="server" Height="800px" Width="450px"  >
    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 450px">
            <tr>
                <td align="center" style="height: 15px; text-align: left; width: 450px;">
                    <strong>确定收货</strong></td>
            </tr>
            <tr>
                <td align="center" style="height: 13px; text-align: left; width: 450px;">
                    评价：</td>
            </tr>
            <tr>
                <td style="height: 23px; text-align: left; width: 450px;">
                   
                    <asp:DataList ID="DataList3" runat="server" DataKeyField="GoodsID"   RepeatColumns="1"
                        Width="471px">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                                border-left: gray 1px solid; border-bottom: gray 1px solid; height: 175px; text-align: center">
                                <tr>
                                    <td colspan="2" height="100">
                                        <asp:Image ID="Image1" runat="server" Height="91px" ImageUrl='<%# Eval("GoodsPicture") %>'
                                            Width="103px" /></td>
                                    <td colspan="1" height="100" style="width: 376px">
                                     <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="136px" Width="369px"></asp:TextBox></td>
                                    <td colspan="1" height="100">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height: 25px">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("GoodsName") %>'></asp:Label></td>
                                    <td colspan="1" style="height: 25px; width: 376px;">
                                     </td>
                                   
                                </tr>
                            </table>
                           
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:Button ID="Button1" runat="server" Text="确定评价" OnClick="Button1_Click1" /></td>
            </tr>
        </table>
      
</asp:Panel>                                   
</asp:Content>

