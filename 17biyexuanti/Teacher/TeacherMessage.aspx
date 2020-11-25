<%@ Page Language="C#" MasterPageFile="~/Teacher/TeacherMasterPage.master" AutoEventWireup="true" CodeFile="TeacherMessage.aspx.cs" Inherits="Teacher_TeacherMessage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" bordercolor="#2e90b0" style=" font-family: 楷体_GB2312;
        width: 626px;">
        <tr>
            <td bgcolor="#66ffcc" colspan="4">
                <div align="center">
                    教员基本信息查询</div>
            </td>
        </tr>
        <tr>
            <td align="right">
                教师号:</td>
            <td align="left" style="width: 195px">
                &nbsp;<asp:Label ID="lbNum" runat="server" Height="22px" Width="157px"></asp:Label></td>
            <td align="right">
                姓名:</td>
            <td align="left">
                &nbsp;<asp:Label ID="lbName" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right">
                地址:</td>
            <td align="left" style="width: 195px">
                &nbsp;<asp:Label ID="lbAddress" runat="server"></asp:Label></td>
            <td align="right">
                联系电话:</td>
            <td align="left">
                &nbsp;<asp:Label ID="lbPhone" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="height: 11px">
                邮箱:</td>
            <td align="left" style="width: 195px; height: 11px">
                &nbsp;<asp:Label ID="lbEmail" runat="server" Width="152px"></asp:Label></td>
            <td align="right" style="height: 11px">&nbsp;
            </td>
            <td align="left" style="height: 11px">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

