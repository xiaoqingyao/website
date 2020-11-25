<%@ Page Language="C#" MasterPageFile="~/Student/StudentMasterPage.master" AutoEventWireup="true" CodeFile="TitleDetial.aspx.cs" Inherits="Student_TitleDetial" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" bordercolor="#2e90b0" style="width: 495px; font-family: 楷体_GB2312">
        <tr>
            <td bgcolor="#66ffcc" colspan="2" style="height: 22px">
                <div align="center">
                    标题信息</div>
            </td>
        </tr>
        <tr>
            <td style="width: 762px">
                <div align="right">
                    标题名:</div>
            </td>
            <td style="width: 746px">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 762px">
                <div align="right">
                    上传者:</div>
            </td>
            <td style="width: 746px">
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 762px" valign="top">
                <div align="right">
                    描述:</div>
            </td>
            <td style="width: 746px">
                <asp:Label ID="Label8" runat="server" BorderStyle="Groove" Height="80px" Width="320px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 762px" valign="top">
                <div align="right">
                    可选数量:</div>
            </td>
            <td style="width: 746px">
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 762px; height: 22px" valign="top">
                已选数量</td>
            <td style="width: 746px; height: 22px">
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 762px" valign="top">
                &nbsp;<asp:Label ID="Label5" runat="server" Text="指导老师:"></asp:Label></td>
            <td style="width: 746px">
                <asp:Label ID="Label6" runat="server" BorderStyle="None"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 762px; height: 28px" valign="top">
            </td>
            <td style="width: 746px; height: 28px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="选题" /></td>
        </tr>
    </table>
</asp:Content>

