<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="JCXX_SP.aspx.cs" Inherits="JCXX_JCXX_SP" Title="某进销存管理系统--商品信息设置" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<script language="javascript" type="text/javascript" charset="gb2312" src="../images/My97DatePicker/WdatePicker.js"></script>
<div><strong style="color:Red;"> 商品信息设置</strong><br />
    <asp:GridView ID="gvSp" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" OnPageIndexChanging="gvSp_PageIndexChanging" OnRowCommand="gvSp_RowCommand" OnRowDataBound="gvSp_RowDataBound"  >
        <Columns>
            <asp:BoundField DataField="spbh" HeaderText="商品编号" Visible="False" />
            <asp:BoundField DataField="spmc" HeaderText="商品名称" />
            <asp:BoundField DataField="sptxm" HeaderText="商品条形码" />
            <asp:TemplateField HeaderText="商品类别">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# getSplbmcBySplbbh(Eval("splbbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="sprkjg" HeaderText="入库价格" />
            <asp:BoundField DataField="spfxjg" HeaderText="分销价格" />
            <asp:BoundField DataField="splsjg" HeaderText="零售价格" />
            <asp:BoundField DataField="spsccj" HeaderText="生产厂家" />
            <asp:BoundField DataField="spgxrq" HeaderText="更新日期" />
            <asp:BoundField DataField="spbz" HeaderText="商品备注" />
            <asp:TemplateField HeaderText="编辑">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Ed" CommandArgument='<%# Eval("spbh")%>' >编辑</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" ForeColor="#996600" CommandName="De" CommandArgument='<%# Eval("spbh")%>' >删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>

    <div style="text-align: left;">
    商品名称:<asp:TextBox ID="txtbspmcgx" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;条形码:<asp:TextBox ID="txtbsptxmgx" runat="server"></asp:TextBox>   
    商品类别:<asp:DropDownList ID="ddlsplbgx" runat="server" Width="155px"></asp:DropDownList>
    入库价格:<asp:TextBox ID="txtbsprkjggx" runat="server"></asp:TextBox><br />  
    分销价格:<asp:TextBox ID="txtbspfxjggx" runat="server"></asp:TextBox>      
    零售价格:<asp:TextBox ID="txtbsplsjggx" runat="server"></asp:TextBox>
    生产厂家:<asp:TextBox ID="txtbspsccjgx" runat="server"></asp:TextBox>
    更新日期:<asp:TextBox ID="txtbspgxrqgx" runat="server" onFocus="new WdatePicker(this,'%Y-%M-%D',true,'default')" ></asp:TextBox><br />
    商品备注:<asp:TextBox ID="txtbspbzgx" runat="server" Height="16px" TextMode="MultiLine" Width="149px"></asp:TextBox>
    <asp:Button ID="btngx" runat="server" Text="更新" OnClick="btngx_Click"></asp:Button>
    <asp:Label ID="lblmassagegx" runat="server" Height="20px" Width="566px" ForeColor="Red"></asp:Label><br />
    商品名称:<asp:TextBox ID="txtbspmctj" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;条形码:<asp:TextBox ID="txtbsptxmtj" runat="server"></asp:TextBox>   
    商品类别:<asp:DropDownList ID="ddlsplbtj" runat="server" Width="155px"></asp:DropDownList>
    入库价格:<asp:TextBox ID="txtbsprkjgtj" runat="server"></asp:TextBox><br />
    分销价格:<asp:TextBox ID="txtbspfxjgtj" runat="server"></asp:TextBox>        
    零售价格:<asp:TextBox ID="txtbsplsjgtj" runat="server"></asp:TextBox>
    生产厂家:<asp:TextBox ID="txtbspsccjtj" runat="server"></asp:TextBox>
    更新日期:<asp:TextBox ID="txtbspgxrqtj" runat="server"  onFocus="new WdatePicker(this,'%Y-%M-%D',true,'default')" ></asp:TextBox><br />
    商品备注:<asp:TextBox ID="txtbspbztj" runat="server" Height="16px" TextMode="MultiLine" Width="149px"></asp:TextBox>
    <asp:Button ID="btntj" runat="server" Text="添加" OnClick="btntj_Click"></asp:Button>
    <asp:Label ID="lblmassagetj" runat="server" Height="20px" Width="566px" ForeColor="Red"></asp:Label>          
    </div>
 </div>
</asp:Content>
