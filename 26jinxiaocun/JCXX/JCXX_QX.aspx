<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="JCXX_QX.aspx.cs" Inherits="JCXX_JCXX_QX" Title="某进销存管理系统--权限设置" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div><strong style="color:Red;">权限设置</strong><br />
    <asp:GridView ID="gvQx" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" PageSize="15" OnPageIndexChanging="gvQx_PageIndexChanging" OnRowCommand="gvQx_RowCommand" OnRowDataBound="gvQx_RowDataBound"  >
        <Columns>
        
            <asp:BoundField DataField="qxbh" HeaderText="qxbh" Visible="False" />
            <asp:BoundField HeaderText="权限名称" DataField="qxmc" />
            <asp:BoundField HeaderText="权限转向" DataField="qxurl" />
            <asp:BoundField HeaderText="备注" DataField="qxbz" />
            <asp:TemplateField HeaderText="编辑">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Ed" CommandArgument='<%# Eval("qxbh")%>' >编辑</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" ForeColor="#996600" CommandName="De" CommandArgument='<%# Eval("qxbh")%>' >删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>

    <div style="text-align: left;">
        权限名称:<asp:TextBox ID="txtbqxmcgx" runat="server"></asp:TextBox>
        权限转向:<asp:TextBox ID="txtbqxurlgx" runat="server"></asp:TextBox>
        备注:<asp:TextBox ID="txtbbzgx" runat="server" Height="16px" TextMode="MultiLine"></asp:TextBox>
        <asp:Button ID="btngx" runat="server" Text="更新" OnClick="btngx_Click" />
        <asp:Label ID="lblgxmassage" runat="server" Height="21px" Width="85px" ForeColor="Red"></asp:Label><br />
       权限名称:<asp:TextBox ID="txtbqxmctj" runat="server"></asp:TextBox>
        权限转向:<asp:TextBox ID="txtbqxurltj" runat="server"></asp:TextBox>
        备注:<asp:TextBox ID="txtbbztj" runat="server" Height="16px" TextMode="MultiLine"></asp:TextBox>
        <asp:Button ID="btntj" runat="server" Text="添加" OnClick="btntj_Click" />
        <asp:Label ID="lbltjmassage" runat="server" Height="21px" Width="85px" ForeColor="Red"></asp:Label>
        </div>
 </div>
</asp:Content>

