<%@ Page Language="C#" MasterPageFile="~/Teacher/TeacherMasterPage.master" AutoEventWireup="true" CodeFile="ModifyMessage.aspx.cs" Inherits="Teacher_ModifyMessage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" bordercolor="#2e90b0" style=" font-family: 楷体_GB2312; width: 640px;">
        <tr>
            <td bgcolor="#66ffcc" colspan="4">
                <div align="center">
                    教员基本信息查询</div>
            </td>
        </tr>
        <tr>
            <td align="right">
                教师号:</td>
            <td align="left" style="width: 202px">
                &nbsp;<asp:Label ID="lbNum" runat="server" Height="22px" Width="157px"></asp:Label></td>
            <td align="right">
                姓名:</td>
            <td align="left">
                &nbsp;<asp:Label ID="lbName" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right">
                地址:</td>
            <td align="left" style="width: 202px">
                &nbsp;<asp:TextBox ID="textAddress" runat="server"></asp:TextBox></td>
            <td align="right">
                联系电话:</td>
            <td align="left">
                &nbsp;<asp:TextBox ID="textphone" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right">
                邮箱:</td>
            <td align="left" style="width: 202px">
                &nbsp;<asp:TextBox ID="textEmail" runat="server"></asp:TextBox></td>
            <td align="right">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                <asp:Button ID="btnsubmint" runat="server" OnClick="btnsubmint_Click" Text="提交" />&nbsp;
                &nbsp;</td>
            <td align="left" colspan="2">
                &nbsp;&nbsp;
                <asp:Button ID="btnesc" runat="server" OnClick="btnesc_Click" Text="取消" /></td>
        </tr>
    </table>
</asp:Content>

