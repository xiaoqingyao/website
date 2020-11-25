<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="XS_XSDD.aspx.cs" Inherits="XS_XS_XSDD" Title="某进销存管理系统--销售订单信息设置" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<script language="javascript" type="text/javascript" charset="gb2312" src="../images/My97DatePicker/WdatePicker.js"></script>

<div><strong style="color:Red;"> 销售订单信息设置</strong><br />
     <asp:GridView ID="gvXsdd" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" OnRowDataBound="gvXsdd_RowDataBound" OnPageIndexChanging="gvXsdd_PageIndexChanging" OnRowCommand="gvXsdd_RowCommand" >
        <Columns>
            <asp:BoundField DataField="xsrq" HeaderText="销售日期" />
            <asp:TemplateField HeaderText="业务员">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# getYwymcByYwybh(Eval("ywy").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="销售订单编号">
                <ItemTemplate>
                    <asp:Label ID="lblxsddbh" runat="server" Text='<%# Bind("xsddbh") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="客户">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# getKhmcByKhbh(Eval("khbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="商品">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# getSpmcBySpbh(Eval("spbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="sl" HeaderText="数量" />
            <asp:BoundField DataField="dj" HeaderText="单价" />
            <asp:BoundField DataField="zk" HeaderText="折扣" />
            <asp:BoundField DataField="zje" HeaderText="总金额" />
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                    <asp:Label ID="lblzt" runat="server" Text='<%# setZt(Eval("zt").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="xsddbz" HeaderText="备注" />
            <asp:TemplateField HeaderText="编辑">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Ed" CommandArgument='<%# Eval("xsddbh")%>' >编辑</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" ForeColor="#996600" CommandName="De" CommandArgument='<%# Eval("xsddbh")%>' >删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>

    <div style="text-align: left;">
    
     销售日期:<asp:TextBox ID="txtbxsrqgx" runat="server" onFocus="new WdatePicker(this,'%Y-%M-%D',true,'default')"></asp:TextBox>
     业务员:<asp:DropDownList ID="ddlywygx" runat="server"></asp:DropDownList>
     订单号:<asp:TextBox ID="txtbddhgx" runat="server"></asp:TextBox>
     数量:<asp:TextBox ID="txtbslgx" runat="server"></asp:TextBox><br /> 
     单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价:<asp:TextBox ID="txtbdjgx" runat="server"></asp:TextBox> 
     折&nbsp;&nbsp;&nbsp;&nbsp;扣:<asp:TextBox ID="txtbzkgx" runat="server"></asp:TextBox>
     <asp:Button ID="btnzjegx" runat="server" BorderStyle="None" Text="总金额:" BackColor="#2C6C25" ForeColor="#996600" Width="39px" Height="20px" Font-Size="12px" OnClick="btnzjegx_Click" ToolTip="点击计算总金额" />
     <asp:TextBox ID="txtbzjegx" runat="server"></asp:TextBox> 
     备注:<asp:TextBox ID="txtbbzgx" runat="server"></asp:TextBox><br />
     客&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;户:<asp:DropDownList ID="ddlkhgx" runat="server"></asp:DropDownList>
     状态:<asp:DropDownList ID="ddlztgx" runat="server">
         <asp:ListItem Value="-1">请选择</asp:ListItem>
         <asp:ListItem Value="0">未确定</asp:ListItem>
         <asp:ListItem Value="1">确定</asp:ListItem>
         <asp:ListItem Value="2">退货</asp:ListItem>
     </asp:DropDownList>
     商品:<asp:DropDownList ID="ddlspgx" runat="server"></asp:DropDownList>
     <asp:Button ID="btngx" runat="server" Text="更新" OnClick="btngx_Click" />
     <asp:Label ID="lblmassagegx" runat="server" Height="20px" Width="275px" ForeColor="Red"></asp:Label><br />
  
     销售日期:<asp:TextBox ID="txtbxsrqtj" runat="server" onFocus="new WdatePicker(this,'%Y-%M-%D',true,'default')"></asp:TextBox>
     业务员:<asp:DropDownList ID="ddlywytj" runat="server"></asp:DropDownList>
     订单号:<asp:TextBox ID="txtbddhtj" runat="server"></asp:TextBox>
     数量:<asp:TextBox ID="txtbsltj" runat="server"></asp:TextBox><br /> 
     单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价:<asp:TextBox ID="txtbdjtj" runat="server"></asp:TextBox> 
     折&nbsp;&nbsp;&nbsp;&nbsp;扣:<asp:TextBox ID="txtbzktj" runat="server"></asp:TextBox>
     <asp:Button ID="btnzjetj" runat="server" BorderStyle="None" Text="总金额:" BackColor="#2C6C25" ForeColor="#996600" Width="39px" Height="20px" Font-Size="12px" OnClick="btnzjetj_Click" ToolTip="点击计算总金额" />
     <asp:TextBox ID="txtbzjetj" runat="server"></asp:TextBox>
     备注:<asp:TextBox ID="txtbbztj" runat="server"></asp:TextBox><br /> 
     客&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;户:<asp:DropDownList ID="ddlkhtj" runat="server"></asp:DropDownList>
     状态:<asp:DropDownList ID="ddlzttj" runat="server">
         <asp:ListItem Value="-1">请选择</asp:ListItem>
         <asp:ListItem Value="0">未确定</asp:ListItem>
         <asp:ListItem Value="1">确定</asp:ListItem>
         <asp:ListItem Value="2">退货</asp:ListItem>
     </asp:DropDownList>
     商品:<asp:DropDownList ID="ddlsptj" runat="server"></asp:DropDownList>
     <asp:Button ID="btntj" runat="server" Text="添加" OnClick="btntj_Click" />
     <asp:Label ID="lblmassagetj" runat="server" Height="20px" Width="275px" ForeColor="Red"></asp:Label><br />
     </div>
   
 </div>
</asp:Content>
