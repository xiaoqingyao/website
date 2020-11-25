<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="toupiao.aspx.cs" Inherits="WebApplication2.toupiao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>1.请先输入你的学号：<asp:TextBox runat="server" ID="xh">618231</asp:TextBox></td>
           
        </tr>
        <tr>
        <td>2.确认学号无误后点击按钮：<asp:Button runat="server" ID="sure" OnClick="sure_Click" Text="我已经做过5科老师的评价" /></td>
        </tr>
        <tr>
            <td style="height:30px;"></td>
        </tr>
        <tr>
            <td style="color:red">
                【友情提醒】：请先扫描二维码后评价之后再来做信息提交，白老师会一一确认。
            </td>
        </tr>
        <tr>
            <td>
                附：评价二维码
            </td>
        </tr>
        <tr>
            <td>
                <img src="pj.jpg" />
            </td>
        </tr>
    </table>


</asp:Content>
