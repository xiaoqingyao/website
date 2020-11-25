<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="JCXX_HYLB.aspx.cs" Inherits="JCXX_JCXX_HYLB" Title="某进销存管理系统--会员类别设置" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div><strong style="color:Red;"> 会员类别设置</strong><br />
    <asp:GridView ID="gvHylb" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" PageSize="15" OnPageIndexChanging="gvHylb_PageIndexChanging" OnRowCommand="gvHylb_RowCommand" OnRowDataBound="gvHylb_RowDataBound"  >
        <Columns>
            <asp:BoundField DataField="hylbbh" HeaderText="会员类别编号" Visible="False" />
            <asp:BoundField DataField="hylbmc" HeaderText="会员类别名称" />
            <asp:BoundField DataField="hylbbz" HeaderText="会员类别备注" />
            <asp:TemplateField HeaderText="编辑">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Ed" CommandArgument='<%# Eval("hylbbh")%>' >编辑</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" ForeColor="#996600" CommandName="De" CommandArgument='<%# Eval("hylbbh")%>' >删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>

    <div style="text-align: left;">
    会员类别名称:<asp:TextBox ID="txtbhylbmcgx" runat="server"></asp:TextBox>
    会员类别备注:<asp:TextBox ID="txtbhylbbzgx" runat="server" Height="16px" TextMode="MultiLine"></asp:TextBox>
    <asp:Button ID="btnhylbgx" runat="server" Text="更新" OnClick="btnhylbgx_Click" />
    <asp:Label ID="lblmassagegx" runat="server" Height="20px" Width="290px" ForeColor="Red"></asp:Label><br />
    会员类别名称:<asp:TextBox ID="txtbhylbmctj" runat="server"></asp:TextBox>
    会员类别备注:<asp:TextBox ID="txtbhylbbztj" runat="server" Height="16px" TextMode="MultiLine"></asp:TextBox>
    <asp:Button ID="btnhylbtj" runat="server" Text="添加" OnClick="btnhylbtj_Click" />
    <asp:Label ID="lblmassagetj" runat="server" Height="20px" Width="290px" ForeColor="Red"></asp:Label>
      
    </div>
 </div>
</asp:Content>
