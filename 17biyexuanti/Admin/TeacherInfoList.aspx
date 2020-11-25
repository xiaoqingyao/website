<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="TeacherInfoList.aspx.cs" Inherits="Admin_TeacherInfoList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    教师姓名:<asp:TextBox ID="TextBox1" runat="server" Width="83px"></asp:TextBox>
    <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="Red" Text="(支持模糊查询)"></asp:Label><asp:Button
        ID="Button1" runat="server" BackColor="#C0FFFF" BorderColor="#C0FFFF" OnClick="Button1_Click"
        Text="查询" />&nbsp;
    <asp:Button ID="Button2" runat="server" BackColor="#C0FFFF" BorderColor="#C0FFFF"
        OnClick="Button2_Click" Text="生成Excel" /><br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" ForeColor="#333333"
        GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound"
        PageSize="15" Width="637px">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>

