<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Newsdetail.aspx.cs" Inherits="News" ValidateRequest="false" %>

<%@ Register assembly="DotNetTextBox" namespace="DotNetTextBox" tagprefix="DNTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
   
  <asp:Panel ID="Panel1" runat="server" Height=800px ScrollBars=Auto>
   
        <table class="style1">
            <tr>
                <td valign=top>
                    <asp:Image ID="Image3" runat="server" Height="31px" ImageUrl="~/images/新闻.jpg" 
                        Width="583px" />
                </td>
            </tr>
            <tr>
                <td>
                     
                    <table class="style1">
                        <tr>
                            <td align=center>
                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align=center>
                                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                     
                </td>
            </tr>
        </table>
                  </asp:Panel>      
                                   
</asp:Content> 

