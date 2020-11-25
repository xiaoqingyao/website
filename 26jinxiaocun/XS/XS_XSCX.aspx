<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="XS_XSCX.aspx.cs" Inherits="XS_XS_XSCX" Title="某进销存管理系统--销售单信息查询" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div><strong style="color:Red;"> 销售单信息查询</strong><br />
    <div style="text-align: left;">
     匹配字段:<asp:DropDownList ID="ddlzd" runat="server">
         <asp:ListItem Value="-1">请选择……</asp:ListItem>
         <asp:ListItem Value="xsrq">日期</asp:ListItem>
         <asp:ListItem Value="ywy">业务员</asp:ListItem>
         <asp:ListItem Value="jhdbh">编号</asp:ListItem>
         <asp:ListItem Value="jhddbh">订单号</asp:ListItem>
         <asp:ListItem Value="khbh">客户</asp:ListItem>
         <asp:ListItem Value="ckbh">仓库</asp:ListItem>
         <asp:ListItem Value="spbh">商品</asp:ListItem>
         <asp:ListItem Value="sl">数量</asp:ListItem>
         <asp:ListItem Value="dj">单价</asp:ListItem>
         <asp:ListItem Value="zk">折扣</asp:ListItem>
         <asp:ListItem Value="zje">总金额</asp:ListItem>
         <asp:ListItem Value="yfje">预付金额</asp:ListItem>
     </asp:DropDownList>
     条件:<asp:TextBox ID="txtbtj" runat="server"></asp:TextBox>
        <asp:Button ID="btncx" runat="server" Text="查询" OnClick="btncx_Click" />
        <asp:Label ID="lblmassagecx" runat="server" Height="20px" Width="415px" ForeColor="Red"></asp:Label>
        
     </div>
    
     <asp:GridView ID="gvXsdcx" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" OnRowDataBound="gvXsdcx_RowDataBound" OnRowCommand="gvXsdcx_RowCommand" OnPageIndexChanging="gvXsdcx_PageIndexChanging" >
        <Columns>
            <asp:TemplateField HeaderText="日期">
                <ItemTemplate>
                    <asp:Label ID="lblxsrq" runat="server" Text='<%# Eval("xsrq") %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnxsrq" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="xsrq">日期</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="业务员">
                <ItemTemplate>
                    <asp:Label ID="lblywy" runat="server" Text='<%# Eval("ywy") %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnywy" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="ywy">业务员</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="编号">
                <ItemTemplate>
                    <asp:Label ID="lblxsdbh" runat="server" Text='<%# Eval("xsdbh") %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnxsdbh" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="xsdbh">编号</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="订单号">
                <ItemTemplate>
                    <asp:Label ID="lblxsddbh" runat="server" Text='<%# Eval("xsddbh") %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnxsddbh" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="xsddbh">订单号</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="客户">
                <ItemTemplate>
                    <asp:Label ID="lblkhbh" runat="server" Text='<%# getKhmcByKhbh(Eval("khbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnkhbh" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="khbh">客户</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="仓库">
                <ItemTemplate>
                    <asp:Label ID="lblckbh" runat="server" Text='<%# getCkmcByCkbh(Eval("ckbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnckbh" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="ckbh">仓库</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="商品">
                <ItemTemplate>
                    <asp:Label ID="lblspbh" runat="server" Text='<%# getSpmcBySpbh(Eval("spbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnspbh" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="spbh">商品</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="数量">
                <ItemTemplate>
                    <asp:Label ID="lblsl" runat="server" Text='<%# Eval("sl") %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnsl" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="sl">数量</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="单价">
                <ItemTemplate>
                    <asp:Label ID="lbldj" runat="server" Text='<%# Eval("dj") %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtndj" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="dj">单价</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="折扣">
                <ItemTemplate>
                    <asp:Label ID="lblzk" runat="server" Text='<%# Eval("zk") %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnzk" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="zk">折扣</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="总金额">
                <ItemTemplate>
                    <asp:Label ID="lblzje" runat="server" Text='<%# Eval("zje") %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnzje" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="zje">总金额</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="sfjsfk" HeaderText="即时付款" />
            <asp:BoundField DataField="sfjz" HeaderText="记账" />
            <asp:TemplateField HeaderText="预付金额">
                <ItemTemplate>
                    <asp:Label ID="lblyfje" runat="server" Text='<%# Eval("yfje") %>'></asp:Label>
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton ID="lbtnyfje" runat="server" ForeColor="#996600" style="text-decoration: none" CommandName="yfje">预付金额</asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="xsdbz" HeaderText="备注" />
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>

 </div>
</asp:Content>

