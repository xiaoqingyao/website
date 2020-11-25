<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" ValidateRequest="false" %>

<%@ Register assembly="DotNetTextBox" namespace="DotNetTextBox" tagprefix="DNTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
   
     <asp:Panel ID="Panel2" runat="server" Height="800px">
        <table class="style1">
            <tr>
                <td>
                    <asp:Image ID="Image3" runat="server" Height="31px" ImageUrl="~/images/新闻.jpg" 
                        Width="583px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="NewsID"  GridLines="None" 
                        ShowHeader="False" Width="580px">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="NewsID" 
                                DataNavigateUrlFormatString="newsdetail.aspx?newsid={0} " 
                                DataTextField="NewsTitle" Target="_blank">
                                <ItemStyle Width="200px" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="NewsDate" DataFormatString="{0:d} " 
                                HeaderText="NewsDate" HtmlEncode="False" SortExpression="NewsDate">
                                <ItemStyle Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NewsID" HeaderText="NewsID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="NewsID" Visible="False" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
                                     </asp:Panel>
                                   
</asp:Content>

