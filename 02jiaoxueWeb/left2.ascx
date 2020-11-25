<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left2.ascx.cs" Inherits="left2" %>
<table id="Table5" border="0" cellpadding="0" cellspacing="0" height="183" width="211">
    <tr>
        <td background="qtimages/img_02_01_04_01.gif" height="29" width="211">
            <table align="center" border="0" cellspacing="0" width="88%">
                <tr>
                    <td width="71%">
                        <span class="unnamed2_14 STYLE2" style="font-size: 10pt; color: #ffffff"><strong>友情连接</strong></span></td>
                    <td style="font-weight: bold; font-size: 10pt; color: #ffffff" width="29%">
                        <span class="STYLE4" style="color: #ffffff"></span>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="font-weight: bold; color: #ffffff">
        <td background="qtimages/img_02_01_04_02.gif" height="154" width="211">
            &nbsp;<asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" Height="130px"
                ShowHeader="False" Width="100%">
                <Columns>
                    <asp:TemplateColumn HeaderText="序号">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1 %>
                        </ItemTemplate>
                        <HeaderStyle Width="30px" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="网址">
                        <ItemTemplate>
                            <a href='<%#DataBinder.Eval(Container.DataItem, "url") %>' target="_blank">
                                <%#DataBinder.Eval(Container.DataItem, "mc") %>
                            </a>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" />
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                            Font-Underline="False" HorizontalAlign="Left" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid></td>
    </tr>
</table>
