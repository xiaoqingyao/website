<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="StudentInfoList.aspx.cs" Inherits="Admin_AdminTest" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" bordercolor="#2e90b0" style=" font-family: 楷体_GB2312; width: 640px;">
        <tr>
            <td colspan="2" style="height: 23px">
                班级:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataValueField="StudentClass" DataTextField="StudentClass">
                </asp:DropDownList>&nbsp;&nbsp; 是否选题:<asp:RadioButton ID="RadioButton1" runat="server" GroupName="btn" Text="已选" />&nbsp;<asp:RadioButton
                    ID="RadioButton2" runat="server" GroupName="btn" Text="未选" />
                <asp:Button ID="Button2" runat="server" BackColor="#C0FFFF" BorderColor="#C0FFFF"
                    BorderStyle="Ridge" Text="查询" OnClick="Button2_Click" />
                <asp:Button ID="Button3" runat="server" BackColor="#C0FFFF" BorderColor="#C0FFFF"
                    BorderStyle="Ridge" Text="生成Excel" OnClick="Button3_Click" /></td>
        </tr>
        <tr>
            <td colspan="2" height="23">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="ObjectDataSource2"
                    ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound"
                    Width="630px" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="20">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

