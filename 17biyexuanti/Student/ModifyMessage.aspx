<%@ Page Language="C#" MasterPageFile="~/Student/StudentMasterPage.master" AutoEventWireup="true" CodeFile="ModifyMessage.aspx.cs" Inherits="Student_ModifyMessage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" bordercolor="#2e90b0" style=" font-family: 楷体_GB2312;">
        <tr>
            <td bgcolor="#66ffcc" colspan="4">
                <div align="center">
                    学生个人信息修改</div>
            </td>
        </tr>
        <tr>
            <td align="right">
                学号:</td>
            <td align="left" >
                &nbsp;<asp:Label ID="lbNum" runat="server" Height="22px" Width="157px"></asp:Label></td>
            <td align="right">
                姓名:</td>
            <td align="left" >
                &nbsp;<asp:Label ID="lbName" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right">
                班级:</td>
            <td align="left" >
                &nbsp;<asp:Label ID="lbClass" runat="server" Width="153px"></asp:Label></td>
            <td align="right" style="width: 135px">
                地址:</td>
            <td align="left">
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right">
                邮箱:</td>
            <td align="left">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
            <td align="right" style="width: 135px">
                联系电话:</td>
            <td align="left">
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right">
                是否选题:</td>
            <td align="left">
                &nbsp;<asp:Label ID="lbIsChooseTitle" runat="server" Width="147px"></asp:Label></td>
            <td align="right">
                &nbsp;<asp:Label ID="lbTitle" runat="server" Text="标题名称:" Width="113px"></asp:Label></td>
            <td align="left">
                &nbsp;<asp:Label ID="lbTitleName" runat="server" Width="227px"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                <asp:Button ID="BtnOk" runat="server" OnClick="BtnOk_Click" Text="保存" /></td>
            <td align="left" colspan="2">
                <asp:Button ID="BtnReSet" runat="server" OnClick="BtnReSet_Click" Text="重置" /></td>
        </tr>
    </table>
</asp:Content>

