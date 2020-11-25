<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="JCXX_CK.aspx.cs" Inherits="JCXX_JCXX_CK" Title="某进销存管理系统--仓库信息设置" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div><strong style="color:Red;"> 仓库信息设置</strong><br />
    <asp:GridView ID="gvCk" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" PageSize="15" OnPageIndexChanging="gvCk_PageIndexChanging" OnRowCommand="gvCk_RowCommand" OnRowDataBound="gvCk_RowDataBound"  >
        <Columns>
            <asp:BoundField DataField="ckbh" HeaderText="仓库编号" />
            <asp:BoundField DataField="ckmc" HeaderText="仓库名称" />
            <asp:BoundField DataField="ckbz" HeaderText="备注" />
            <asp:TemplateField HeaderText="编辑">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Ed" CommandArgument='<%# Eval("ckbh")%>' >编辑</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" ForeColor="#996600" CommandName="De" CommandArgument='<%# Eval("ckbh")%>' >删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>

    <div style="text-align: left;">
        
        仓库编号:<asp:TextBox ID="txtbckbhgx" runat="server"></asp:TextBox>
        仓库名称:<asp:TextBox ID="txtbckmcgx" runat="server"></asp:TextBox>
        备注:<asp:TextBox ID="txtbckbzgx" runat="server"></asp:TextBox>
        <asp:Button ID="btnckgx" runat="server" Text="更新" OnClick="btnckgx_Click" />
        <asp:Label ID="lblmassagegx" runat="server" Height="20px" Width="190px" ForeColor="Red"></asp:Label><br />
        仓库编号:<asp:TextBox ID="txtbckbhtj" runat="server"></asp:TextBox>
        仓库名称:<asp:TextBox ID="txtbckmctj" runat="server"></asp:TextBox>
        备注:<asp:TextBox ID="txtbckbztj" runat="server"></asp:TextBox>
        <asp:Button ID="btncktj" runat="server" Text="添加" OnClick="btncktj_Click" />
        <asp:Label ID="lblmassagetj" runat="server" Height="20px" Width="190px" ForeColor="Red"></asp:Label>
        </div>
 </div>
</asp:Content>
