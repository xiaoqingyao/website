<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="MessageDetial.aspx.cs" Inherits="Admin_MessageDetial" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" bordercolor="#2e90b0" style="width: 713px; font-family: 楷体_GB2312">
        <tr>
            <td style="width: 597px; height: 22px">
                <div align="left">
                    发送人:<asp:Label ID="Label1" runat="server" Font-Size="Small"></asp:Label>[<asp:Label
                        ID="Label2" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>]</div>
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 597px" valign="top">
                内&nbsp; 容:<br />
                <asp:Label ID="Label3" runat="server" BorderStyle="Groove" Font-Size="Small" Height="77px"
                    Style="left: 328px; top: 335px" Width="624px"></asp:Label></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 597px">
                <div align="right">
                    <asp:Label ID="Label4" runat="server" Font-Size="Small" Width="262px"></asp:Label>&nbsp;</div>
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 597px; height: 22px">
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td align="left" style="width: 597px; height: 22px">
                回复:</td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 597px; height: 22px">
                收件人:<asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Small" Text="Label"
                    Width="78px"></asp:Label></td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 597px; height: 22px" valign="top">
                内 容:<br />
                <asp:TextBox ID="TextBox1" runat="server" Height="80px" TextMode="MultiLine" Width="631px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="*" Style="position: absolute"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="font-size: 12pt">
            <td style="width: 597px; height: 22px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="回复" />&nbsp;
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="取消" /></td>
        </tr>
    </table>
</asp:Content>

