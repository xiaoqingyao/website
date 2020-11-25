<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="TitleInfoList.aspx.cs" Inherits="Admin_TitleInfoList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    选题情况:<asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>--选择--</asp:ListItem>
        <asp:ListItem>已满</asp:ListItem>
        <asp:ListItem>未满</asp:ListItem>
    </asp:DropDownList>
    审核状态:<asp:DropDownList ID="DropDownList2" runat="server">
        <asp:ListItem>--选择--</asp:ListItem>
        <asp:ListItem>通过</asp:ListItem>
        <asp:ListItem>未通过</asp:ListItem>
    </asp:DropDownList>
    指导老师:<asp:TextBox ID="TextBox1" runat="server" Width="111px"></asp:TextBox>
    <asp:Label ID="Label1" runat="server" Font-Size="Small" ForeColor="Red" Text="(支持模糊查询)"></asp:Label>
    <asp:Button ID="Button1" runat="server" BackColor="#C0FFFF" BorderColor="#C0FFFF"
        OnClick="Button1_Click" Text="查询" />&nbsp;<asp:Button ID="Button2" runat="server"
            BackColor="#C0FFFF" BorderColor="#C0FFFF" OnClick="Button2_Click" Text="生成Excel" /><br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" ForeColor="#333333"
        GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound"
        PageSize="15" Width="639px">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>

