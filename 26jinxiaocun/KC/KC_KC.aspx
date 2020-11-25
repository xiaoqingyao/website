<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="KC_KC.aspx.cs" Inherits="KC_KC_KC" Title="某进销存管理系统--库存信息设置" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<script language="javascript" type="text/javascript" charset="gb2312" src="../images/My97DatePicker/WdatePicker.js"></script>

<div><strong style="color:Red;"> 库存信息设置</strong><br />
    <asp:GridView ID="gvKc" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" OnPageIndexChanging="gvKc_PageIndexChanging" OnRowCommand="gvKc_RowCommand" OnRowDataBound="gvKc_RowDataBound" PageSize="5"   >
        <Columns>
            
            <asp:BoundField DataField="gxrq" HeaderText="更新日期" >
            </asp:BoundField>
            <asp:BoundField DataField="kcbh" HeaderText="库存编号" />
            <asp:TemplateField HeaderText="仓库名称">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# getCkmcByCkbh(Eval("ckbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="商品名称">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# getSpmcBySpbh(Eval("spbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="sl" HeaderText="数量" />
            <asp:BoundField DataField="zje" HeaderText="总金额" />
            <asp:TemplateField HeaderText="缺货警告">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# setQhjg(Eval("qhjg").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="kcbz" HeaderText="备注" />
            <asp:TemplateField HeaderText="编辑">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Ed" CommandArgument='<%# Eval("kcbh")%>' >编辑</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" ForeColor="#996600" CommandName="De" CommandArgument='<%# Eval("kcbh")%>' >删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>

    <div style="text-align: left;">
     更新日期:<asp:TextBox ID="txtbgxrqgx" runat="server" onFocus="new WdatePicker(this,'%Y-%M-%D',true,'default')"></asp:TextBox>
     库存编号:<asp:TextBox ID="txtbkcbhgx" runat="server" Enabled="False"></asp:TextBox>
     仓库名称:<asp:DropDownList ID="ddlckbhgx" runat="server"></asp:DropDownList>
     商品名称:<asp:DropDownList ID="ddlspbhgx" runat="server" AutoPostBack="True"></asp:DropDownList><br />
     数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 量:<asp:TextBox ID="txtbslgx" runat="server"></asp:TextBox>
     总&nbsp;&nbsp;金&nbsp;&nbsp;额:<asp:TextBox ID="txtbzjegx" runat="server" Enabled="False" ToolTip="点击总金额，即可算出总金额！"></asp:TextBox>
        缺货警告:<asp:DropDownList ID="ddlqhjggx" runat="server">
         <asp:ListItem Value="0">正常</asp:ListItem>
         <asp:ListItem Value="1">警告</asp:ListItem>
         <asp:ListItem Value="2">严重警告</asp:ListItem>
     </asp:DropDownList>
     备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 注:<asp:TextBox ID="txtbbzgx" runat="server" Height="16px" TextMode="MultiLine" Width="230px"></asp:TextBox><br />
        <asp:Button ID="btngx" runat="server" Text="更新" OnClick="btngx_Click"  />
        <asp:Label ID="lblmassagegx" runat="server" Height="20px" Width="366px" ForeColor="Red"></asp:Label>   
     <br />
     更新日期:<asp:TextBox ID="txtbgxrqtj" runat="server" onFocus="new WdatePicker(this,'%Y-%M-%D',true,'default')"></asp:TextBox>
     库存编号:<asp:TextBox ID="txtbkcbhtj" runat="server" OnLoad="txtbkcbhtj_Load" ></asp:TextBox>
     仓库名称:<asp:DropDownList ID="ddlckbhtj" runat="server"></asp:DropDownList>
     商品名称:<asp:DropDownList ID="ddlspbhtj" runat="server" AutoPostBack="True" ></asp:DropDownList><br />
     数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 量:<asp:TextBox ID="txtbsltj" runat="server"></asp:TextBox>
     总&nbsp;&nbsp;金&nbsp;&nbsp;额:<asp:TextBox ID="txtbzjetj" runat="server" Enabled="False" ToolTip="点击总金额，即可算出总金额！"></asp:TextBox>
     缺货警告:<asp:DropDownList ID="ddlqhjgtj" runat="server">
         <asp:ListItem Value="-1">请选择…</asp:ListItem>
         <asp:ListItem Value="0">正常</asp:ListItem>
         <asp:ListItem Value="1">警告</asp:ListItem>
         <asp:ListItem Value="2">严重警告</asp:ListItem>
     </asp:DropDownList>
     备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 注:<asp:TextBox ID="txtbbztj" runat="server" Height="16px" TextMode="MultiLine" Width="230px"></asp:TextBox><br />
        <asp:Button ID="btntj" runat="server" Text="添加" OnClick="btntj_Click"  />
        <asp:Label ID="lblmassagetj" runat="server" Height="20px" Width="366px" ForeColor="Red"></asp:Label>
     </div>
     <asp:GridView ID="gvJhdd" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" PageSize="5" OnRowCommand="gvJhdd_RowCommand"  >
        <Columns>
            <asp:BoundField DataField="dhrq" HeaderText="订货日期" >
            </asp:BoundField>
            <asp:BoundField DataField="jhddbh" HeaderText="订单号" />
            <asp:TemplateField HeaderText="商品">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# getSpmcBySpbh(Eval("spbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="sl" HeaderText="数量" />
            <asp:BoundField DataField="dj" HeaderText="单价" />
            <asp:BoundField DataField="zk" HeaderText="折扣" />
            <asp:BoundField DataField="zje" HeaderText="总金额" />
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# setZt(Eval("zt").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="jhddbz" HeaderText="备注" />
            <asp:TemplateField HeaderText="入库">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Rkd" CommandArgument='<%# Eval("jhddbh")%>' >入库</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>
 </div>
</asp:Content>
