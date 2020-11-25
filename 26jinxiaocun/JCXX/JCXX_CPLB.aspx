<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="JCXX_CPLB.aspx.cs" Inherits="JCXX_JCXX_CPLB" Title="某进销存管理系统--产品类别设置" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div><strong style="color:Red;"> 产品类别设置</strong><br />
    <asp:GridView ID="gvCplb" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" PageSize="15" OnPageIndexChanging="gvCplb_PageIndexChanging" OnRowCommand="gvCplb_RowCommand" OnRowDataBound="gvCplb_RowDataBound"  >
        <Columns>
            <asp:BoundField DataField="cplbbh" HeaderText="产品类别编号" Visible="False" />
            <asp:BoundField DataField="cplbmc" HeaderText="产品类别名称" />
            <asp:BoundField DataField="cplbbz" HeaderText="产品类别备注" />
            <asp:TemplateField HeaderText="编辑">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Ed" CommandArgument='<%# Eval("cplbbh")%>' >编辑</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" ForeColor="#996600" CommandName="De" CommandArgument='<%# Eval("cplbbh")%>' >删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>

    <div style="text-align: left;">
    产品类别名称:<asp:TextBox ID="txtbcplbmcgx" runat="server"></asp:TextBox>
    产品类别备注:<asp:TextBox ID="txtbcplbbzgx" runat="server" Height="16px" TextMode="MultiLine"></asp:TextBox>
    <asp:Button ID="btncplbgx" runat="server" Text="更新" OnClick="btncplbgx_Click" />
    <asp:Label ID="lblmassagegx" runat="server" Height="20px" Width="290px" ForeColor="Red"></asp:Label><br />
    产品类别名称:<asp:TextBox ID="txtbcplbmctj" runat="server"></asp:TextBox>
    产品类别备注:<asp:TextBox ID="txtbcplbbztj" runat="server" Height="16px" TextMode="MultiLine"></asp:TextBox>
    <asp:Button ID="btncplbtj" runat="server" Text="添加" OnClick="btncplbtj_Click" />
    <asp:Label ID="lblmassagetj" runat="server" Height="20px" Width="290px" ForeColor="Red"></asp:Label>
      
    </div>
 </div>
</asp:Content>

