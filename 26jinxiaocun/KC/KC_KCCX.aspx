<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="KC_KCCX.aspx.cs" Inherits="KC_KC_KCCX" Title="某进销存管理系统--库存信息查询" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div><strong style="color:Red;"> 库存信息查询</strong><br />
    <div style="text-align: left;">
     匹配字段:<asp:DropDownList ID="ddlzd" runat="server">
         <asp:ListItem Value="-1">请选择……</asp:ListItem>
         <asp:ListItem Value="gxrq">更新日期</asp:ListItem>
         <asp:ListItem Value="kcbh">库存编号</asp:ListItem>
         <asp:ListItem Value="ckbh">仓库编号</asp:ListItem>
         <asp:ListItem Value="spbh">商品编号</asp:ListItem>
         <asp:ListItem Value="sl">数量</asp:ListItem>
         <asp:ListItem Value="zje">总金额</asp:ListItem>
     </asp:DropDownList>
     条件:<asp:TextBox ID="txtbtj" runat="server"></asp:TextBox>
        <asp:Button ID="btncx" runat="server" Text="查询" OnClick="btncx_Click" />
        <asp:Label ID="lblmassagecx" runat="server" Height="20px" Width="415px" ForeColor="Red"></asp:Label>
        
     </div>
    
    <asp:GridView ID="gvKccx" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" OnRowCommand="gvKccx_RowCommand" PageSize="15" OnPageIndexChanging="gvKccx_PageIndexChanging" OnRowDataBound="gvKccx_RowDataBound"  >
        <Columns>
            <asp:TemplateField  >
                <ItemTemplate>
                    <asp:Label ID="lblgxrq" runat="server" Text='<%# Eval("gxrq") %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtngxrq" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="gxrq">更新日期</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <ItemTemplate>
                    <asp:Label ID="lblkcbh" runat="server" Text='<%# Eval("kcbh") %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnkcbh" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="kcbh">库存编号</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <ItemTemplate>
                    <asp:Label ID="lblckbh" runat="server" Text='<%# getCkmcByCkbh(Eval("ckbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnckbh" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="ckbh">仓库编号</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <ItemTemplate>
                    <asp:Label ID="lblspbh" runat="server" Text='<%# getSpmcBySpbh(Eval("spbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnspbh" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="spbh">商品编号</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField >
                <ItemTemplate>
                    <asp:Label ID="lblsl" runat="server" Text='<%# Eval("sl") %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnsl" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="sl">数量</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <ItemTemplate>
                    <asp:Label ID="lblzje" runat="server" Text='<%# Eval("zje") %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnzje" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="zje">总金额</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="qhjg" HeaderText="缺货警告" />
            <asp:BoundField DataField="kcbz" HeaderText="备注" />
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>

 </div>
</asp:Content>
