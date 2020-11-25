<%@ Page Language="C#" MasterPageFile="~/Student/StudentMasterPage.master" AutoEventWireup="true" CodeFile="StudentMessage.aspx.cs" Inherits="Student_StudentMessage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" bordercolor="#2e90b0" style="font-family: 楷体_GB2312; width: 637px;">
        <tr>
            <td bgcolor="#66ffcc" colspan="4">
                <div align="center">
                    学生基本信息查询</div>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 103px">
                学号:</td>
            <td align="left" style="width: 151px">
                &nbsp;<asp:Label ID="lbNum" runat="server" Height="22px" Width="123px" style="position: absolute" Font-Size="Small"></asp:Label></td>
            <td align="right" style="width: 134px">
                姓名:</td>
            <td align="left">
                &nbsp;<asp:Label ID="lbName" runat="server" Font-Size="Small"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 103px; height: 6px">
                班级:</td>
            <td align="left" style="width: 151px; height: 6px">
                &nbsp;<asp:Label ID="lbClass" runat="server" Width="153px" Font-Size="Small"></asp:Label></td>
            <td align="right" style="width: 134px; height: 6px">
                地址:</td>
            <td align="left" style="height: 6px">
                &nbsp;<asp:Label ID="lbAddress" runat="server" Font-Size="Small"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 103px">
                邮箱:</td>
            <td align="left" style="width: 151px">
                &nbsp;<asp:Label ID="lbEmail" runat="server" Width="152px" Font-Size="Small"></asp:Label></td>
            <td align="right" style="width: 134px">
                联系电话:</td>
            <td align="left">
                &nbsp;<asp:Label ID="lbPhone" runat="server" Font-Size="Small"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 103px">
                是否选题:</td>
            <td align="left" style="width: 151px">
                &nbsp;<asp:Label ID="lbIsChooseTitle" runat="server" Width="1px" Font-Size="Small"></asp:Label></td>
            <td align="right" style="width: 134px">
                &nbsp;<asp:Label ID="lbTitle" runat="server" Text="标题名称:" Width="91px"></asp:Label></td>
            <td align="left">
                &nbsp;<asp:Label ID="lbTitleName" runat="server" Width="191px" Font-Size="Small"></asp:Label>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="退选" /></td>
        </tr>
    </table>
</asp:Content>

