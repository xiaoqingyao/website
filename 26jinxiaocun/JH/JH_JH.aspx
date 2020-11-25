<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="JH_JH.aspx.cs" Inherits="JH_JH_JH" Title="某进销存管理系统--进货相关信息设置" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<script language="javascript" type="text/javascript" charset="gb2312" src="../images/My97DatePicker/WdatePicker.js"></script>

<div><strong style="color:Red;"> 进货相关信息设置</strong><br />
<div style="text-align: left;color: #ff0000;">进货单</div>
    <asp:GridView ID="gvJhd" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" PageSize="5" OnRowDataBound="gvRkd_RowDataBound" OnRowCommand="gvJhd_RowCommand" >
        <Columns>
            <asp:BoundField DataField="jhrq" HeaderText="日期" />
            <asp:BoundField DataField="ywy" HeaderText="业务员" />
            <asp:BoundField DataField="jhdbh" HeaderText="编号" />
            <asp:BoundField DataField="jhddbh" HeaderText="订单号" />
            <asp:TemplateField HeaderText="供应商">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# getGysmcByGysbh(Eval("gysbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="仓库">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# getCkmcByCkbh(Eval("ckbh").ToString()) %>'></asp:Label>
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
            <asp:BoundField DataField="sfjsfk" HeaderText="即时付款" />
            <asp:BoundField DataField="sfjz" HeaderText="记账" />
            <asp:BoundField DataField="yfje" HeaderText="预付金额" />
            <asp:BoundField DataField="jhdbz" HeaderText="备注" />
            <asp:TemplateField HeaderText="编辑">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Ed" CommandArgument='<%# Eval("jhdbh")%>' >编辑</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" ForeColor="#996600" CommandName="De" CommandArgument='<%# Eval("jhdbh")%>' >删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>

    <div style="text-align: left;">
     供&nbsp;&nbsp;应&nbsp;&nbsp;商:<asp:DropDownList ID="ddlgysgx" runat="server"></asp:DropDownList>
     仓库:<asp:DropDownList ID="ddlckgx" runat="server"></asp:DropDownList>
     商品:<asp:DropDownList ID="ddlspgx" runat="server"></asp:DropDownList>
     即时付款:<asp:DropDownList ID="ddljsfkgx" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddljsfkgx_SelectedIndexChanged" >
         <asp:ListItem Selected="True">是</asp:ListItem>
         <asp:ListItem>否</asp:ListItem>
     </asp:DropDownList>
     记账:<asp:DropDownList ID="ddljzgx" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddljzgx_SelectedIndexChanged" >
         <asp:ListItem>是</asp:ListItem>
         <asp:ListItem Selected="True">否</asp:ListItem>
     </asp:DropDownList><br />
     入库日期:<asp:TextBox ID="txtbjhrqgx" runat="server" onFocus="new WdatePicker(this,'%Y-%M-%D',true,'default')"></asp:TextBox>
     业务员:<asp:TextBox ID="txtbywygx" runat="server"></asp:TextBox>
     编号:<asp:TextBox ID="txtbbhgx" runat="server"></asp:TextBox>
     订单号:<asp:TextBox ID="txtbddhgx" runat="server"></asp:TextBox><br /> 
     数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量:<asp:TextBox ID="txtbslgx" runat="server"></asp:TextBox>
     单&nbsp;&nbsp;&nbsp;&nbsp;价:<asp:TextBox ID="txtbdjgx" runat="server"></asp:TextBox> 
     折扣:<asp:TextBox ID="txtbzkgx" runat="server"></asp:TextBox>
     <asp:Button ID="btnzjegx" runat="server" BorderStyle="None" Text="总金额:" BackColor="#2C6C25" ForeColor="#996600" Width="39px" Height="20px" Font-Size="12px" OnClick="btnzjegx_Click" ToolTip="点击计算总金额" /><asp:TextBox ID="txtbzjegx" runat="server"></asp:TextBox><br /> 
     预付金额:<asp:TextBox ID="txtbyfjegx" runat="server"></asp:TextBox>
     备&nbsp;&nbsp;&nbsp;&nbsp;注:<asp:TextBox ID="txtbbzgx" runat="server" Height="16px" TextMode="MultiLine" Width="149px"></asp:TextBox>
     <asp:Button ID="btngx" runat="server" Text="更新" OnClick="btngx_Click" />
     <asp:Label ID="lblmassagegx" runat="server" Height="20px" Width="337px" ForeColor="Red"></asp:Label><br />
      供&nbsp;&nbsp;应&nbsp;&nbsp;商:<asp:DropDownList ID="ddlgystj" runat="server"></asp:DropDownList>
     仓库:<asp:DropDownList ID="ddlcktj" runat="server"></asp:DropDownList>
     商品:<asp:DropDownList ID="ddlsptj" runat="server"></asp:DropDownList>
     即时付款:<asp:DropDownList ID="ddljsfktj" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddljsfktj_SelectedIndexChanged">
         <asp:ListItem Selected="True">是</asp:ListItem>
         <asp:ListItem>否</asp:ListItem>
     </asp:DropDownList>
     记账:<asp:DropDownList ID="ddljztj" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddljztj_SelectedIndexChanged">
         <asp:ListItem>是</asp:ListItem>
         <asp:ListItem Selected="True">否</asp:ListItem>
     </asp:DropDownList><br />
     入库日期:<asp:TextBox ID="txtbjhrqtj" runat="server" onFocus="new WdatePicker(this,'%Y-%M-%D',true,'default')"></asp:TextBox>
     业务员:<asp:TextBox ID="txtbywytj" runat="server"></asp:TextBox>
     编号:<asp:TextBox ID="txtbbhtj" runat="server"></asp:TextBox>
     订单号:<asp:TextBox ID="txtbddhtj" runat="server"></asp:TextBox><br /> 
     数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量:<asp:TextBox ID="txtbsltj" runat="server"></asp:TextBox>
     单&nbsp;&nbsp;&nbsp;&nbsp;价:<asp:TextBox ID="txtbdjtj" runat="server"></asp:TextBox> 
     折扣:<asp:TextBox ID="txtbzktj" runat="server"></asp:TextBox>
        <asp:Button ID="btnzjetj" runat="server" BorderStyle="None" Text="总金额:" BackColor="#2C6C25" ForeColor="#996600" Width="39px" Height="20px" Font-Size="12px" OnClick="btnzjetj_Click" ToolTip="点击计算总金额" /><asp:TextBox ID="txtbzjetj" runat="server" Enabled="False"></asp:TextBox><br /> 
     预付金额:<asp:TextBox ID="txtbyfjetj" runat="server"></asp:TextBox>
     备&nbsp;&nbsp;&nbsp;&nbsp;注:<asp:TextBox ID="txtbbztj" runat="server" Height="16px" TextMode="MultiLine" Width="149px"></asp:TextBox>
     <asp:Button ID="btntj" runat="server" Text="添加" OnClick="btntj_Click" />
     <asp:Label ID="lblmassagetj" runat="server" Height="20px" Width="337px" ForeColor="Red"></asp:Label><br />
     </div>
     <div style="text-align: left; color: #ff0000; ">进货订单</div>
     <asp:GridView ID="gvJhdd" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" PageSize="5" OnRowDataBound="gvJhdd_RowDataBound" OnRowCommand="gvJhdd_RowCommand"  >
        <Columns>
            <asp:BoundField DataField="dhrq" HeaderText="订货日期" >
            </asp:BoundField>
            <asp:TemplateField HeaderText="业务员">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# getYwymcByYwybh(Eval("ywy").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="jhddbh" HeaderText="订单号" />
            <asp:TemplateField HeaderText="供应商">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# getGysmcByGysbh(Eval("gysbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="商品">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# getSpmcBySpbh(Eval("spbh").ToString()) %>'></asp:Label>
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
            <asp:TemplateField HeaderText="生成进货单">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Rkd" CommandArgument='<%# Eval("jhddbh")%>' >生成进货单</asp:LinkButton>
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
