<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left5.ascx.cs" Inherits="left5" %>
<asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" Height="130px"
    Width="100%" ShowHeader="False">
    <Columns>
        <asp:TemplateColumn HeaderText="序号">
            <ItemTemplate>
                <%#Container.ItemIndex+1 %>
            </ItemTemplate>
            <HeaderStyle Width="30px" />
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="网址">
            <ItemTemplate>
                <a href='<%#DataBinder.Eval(Container.DataItem, "url") %>' target=_blank>
                    <%#DataBinder.Eval(Container.DataItem, "mc") %>
                </a>
            </ItemTemplate>
            <HeaderStyle Width="200px" />
        </asp:TemplateColumn>
    </Columns>
</asp:DataGrid>
