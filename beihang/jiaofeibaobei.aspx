<%@ Page Title="缴费报备" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="jiaofeibaobei.aspx.cs" Inherits="WebApplication2.jiaofeibaobei" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table>
        <tr>
            <td>1.请先输入你的学号：<asp:TextBox runat="server" ID="xh">618231</asp:TextBox></td>
           
        </tr>
        <tr>
        <td>2.缴费后点击按钮：<asp:Button runat="server" ID="sure" OnClick="sure_Click" Text="我已经缴费完成" /></td>
        </tr>
        <tr>
            <td style="height:30px;"></td>
        </tr>
        <tr>
            <td style="color:red">
                【友情提醒】：请先缴费后再来进行报备，白老师会一一确认，谢谢大家配合。
            </td>
        </tr>
       
    </table>
</asp:Content>
