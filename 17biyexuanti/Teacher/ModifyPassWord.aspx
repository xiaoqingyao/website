<%@ Page Language="C#" MasterPageFile="~/Teacher/TeacherMasterPage.master" AutoEventWireup="true" CodeFile="ModifyPassWord.aspx.cs" Inherits="Teacher_ModifyPassWord" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" style="width: 617px; height: 132px">
        <tr>
            <td bgcolor="#33ffcc" colspan="2" style="height: 23px">
                <div align="center">
                    教员密码修改</div>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 122px">
                <asp:Label ID="Label1" runat="server" Text="原始密码:" Width="86px"></asp:Label></td>
            <td align="left" style="width: 580px">
                <asp:TextBox ID="txtOldPassWord" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPassWord"
                    ErrorMessage="*" Style="position: absolute"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 122px">
                <asp:Label ID="Label2" runat="server" Text="新密码 :" Width="85px"></asp:Label></td>
            <td align="left" style="width: 580px">
                <asp:TextBox ID="txtNewPassWord" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassWord"
                    ErrorMessage="*" Style="position: absolute"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 122px">
                <asp:Label ID="Label3" runat="server" Text="确认密码: " Width="86px"></asp:Label></td>
            <td align="left" style="width: 580px">
                <asp:TextBox ID="txtReNewPassWord" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtReNewPassWord"
                    ErrorMessage="*" Style="position: absolute"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassWord"
                    ControlToValidate="txtReNewPassWord" ErrorMessage="CompareValidator" Style="position: absolute"
                    Width="190px">两次输入的密码不一样</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 122px">
                &nbsp; &nbsp;</td>
            <td align="left" style="width: 580px">
                <asp:Button ID="btnOK" runat="server" OnClick="btnOK_Click" Text="修改" />
                &nbsp;&nbsp; &nbsp;<asp:Button ID="btnEsc" runat="server" OnClick="btnEsc_Click"
                    Text="退出" /></td>
        </tr>
    </table>
</asp:Content>

