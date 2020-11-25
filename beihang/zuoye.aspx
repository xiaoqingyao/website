<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="zuoye.aspx.cs" Inherits="WebApplication2.zuoye" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table>
        <tr>
            <td>学号：</td>
            <td><asp:TextBox runat="server" ID="xh">618231</asp:TextBox></td>
        </tr>
        <tr>
            <td>
                第1次作业：
            </td>
            <td>
                <asp:FileUpload ID="fu1" runat="server" />
            </td>
        </tr>
         <tr>
            <td>
                第2次作业：
            </td>
            <td>
                <asp:FileUpload ID="fu2" runat="server" />
            </td>
        </tr>
         <tr>
            <td>
                第3次作业：
            </td>
            <td>
                <asp:FileUpload ID="fu3" runat="server" />
            </td>
        </tr>
         <tr>
            <td>
                第4次作业：
            </td>
            <td>
                <asp:FileUpload ID="fu4" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button runat="server" ID="sure" OnClick="sure_Click"  Text="提交"/>
            </td>
        </tr>
    </table>
</asp:Content>
