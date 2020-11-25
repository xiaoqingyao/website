<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="KC_JHDDJY.aspx.cs" Inherits="KC_KC_JHDDJY" Title="某进销存管理系统--进货订单校验" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<script language="javascript" type="text/javascript" >
    function ckball(ck){
        var items = document.getElementsByTagName("input");
       
        for(i=0;i<items.length;i++){
            if(items[i].type == "checkbox"){
                items[i].checked = ck.checked;
            }
            
        }
    }
</script>

<div><strong style="color:Red;">进货订单校验</strong><br />
    <div style="text-align: left;">
        将选中项状态修改为:<asp:DropDownList ID="ddlzt" runat="server">
            <asp:ListItem Value="-1">请选择…</asp:ListItem>
            <asp:ListItem Value="0">未确认</asp:ListItem>
            <asp:ListItem Value="1">确认</asp:ListItem>
            <asp:ListItem Value="2">退货</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnxg" runat="server" Text="修改" OnClick="btnxg_Click" />
        <asp:Label ID="lblmassage" runat="server" ForeColor="Red" Height="20px" Width="335px"></asp:Label>
     </div>
    <asp:GridView ID="gvJhddjy" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" OnRowDataBound="gvJhddjy_RowDataBound" OnPageIndexChanging="gvJhddjy_PageIndexChanging"   >
        <Columns>
            <asp:TemplateField HeaderText="全选">
                <HeaderTemplate>
                    全选<input id="ckbhzt" type="checkbox" onclick="ckball(this)" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="ckbzt" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="dhrq" HeaderText="订货日期" />
            <asp:TemplateField HeaderText="业务员">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# getYwymcByYwybh(Eval("ywy").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="进货订单编号">
                <ItemTemplate>
                    <asp:Label ID="lbljhddbh" runat="server" Text='<%# Bind("jhddbh") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="供应商">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# getGysmcByGysbh(Eval("gysbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="商品">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# getSpmcBySpbh(Eval("spbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="sl" HeaderText="数量" />
            <asp:TemplateField HeaderText="库存数量">
                <ItemStyle ForeColor="Red" />
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# getSlBySpbhInCk(Eval("spbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="dj" HeaderText="单价" />
            <asp:BoundField DataField="zk" HeaderText="折扣" />
            <asp:BoundField DataField="zje" HeaderText="总金额" />
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# setZt(Eval("zt").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="jhddbz" HeaderText="备注" />
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>

 </div>
</asp:Content>

