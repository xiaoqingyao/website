<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="JCXX_JS.aspx.cs" Inherits="JCXX_JCXX_JS" Title="某进销存管理系统--角色信息设置" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div><strong style="color:Red;"> 角色信息设置</strong><br />
    <asp:GridView ID="gvJs" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" PageSize="15" OnPageIndexChanging="gvJs_PageIndexChanging" OnRowCommand="gvJs_RowCommand" OnRowDataBound="gvJs_RowDataBound"  >
        <Columns>
            <asp:BoundField DataField="jsbh" HeaderText="编号" Visible="False" />
            <asp:BoundField DataField="jsmc" HeaderText="角色名称" />
            <asp:BoundField DataField="jsbz" HeaderText="角色备注" />
            <asp:TemplateField HeaderText="编辑">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Ed" CommandArgument='<%# Eval("jsbh")%>' >编辑</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" ForeColor="#996600" CommandName="De" CommandArgument='<%# Eval("jsbh")%>' >删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>

    <div style="text-align: left;">   
    角色名称<asp:TextBox ID="txtbjsmcgx" runat="server"></asp:TextBox>
    角色备注<asp:TextBox ID="txtbjsbzgx" runat="server"></asp:TextBox>
   <asp:Button ID="btnjsgx" runat="server" Text="更新" OnClick="btnjsgx_Click" />
   <asp:Label ID="lbljsmassagegx" runat="server" Height="20px" Width="290px" ForeColor="Red"></asp:Label><br />
   角色名称<asp:TextBox ID="txtbjsmctj" runat="server"></asp:TextBox>
   角色备注<asp:TextBox ID="txtbjsbztj" runat="server"></asp:TextBox>
   <asp:Button ID="btnjstj" runat="server" Text="添加" OnClick="btnjstj_Click" />
   <asp:Label ID="lbljsmassagetj" runat="server" Height="20px" Width="290px" ForeColor="Red"></asp:Label>
    </div>
 </div>
</asp:Content>