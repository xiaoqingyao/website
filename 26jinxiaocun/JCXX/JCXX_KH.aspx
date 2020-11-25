<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="JCXX_KH.aspx.cs" Inherits="JCXX_JCXX_KH" Title="某进销存管理系统--客户信息设置" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div><strong style="color:Red;"> 客户信息设置</strong><br />
    <asp:GridView ID="gvKh" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" OnPageIndexChanging="gvKh_PageIndexChanging" OnRowCommand="gvKh_RowCommand" OnRowDataBound="gvKh_RowDataBound"  >
        <Columns>
            <asp:BoundField DataField="khbh" Visible="False" />
            <asp:BoundField DataField="khmc" HeaderText="客户名称" />
            <asp:BoundField DataField="dz" HeaderText="地址" />
            <asp:BoundField DataField="yzbm" HeaderText="邮编" />
            <asp:BoundField DataField="lxdh" HeaderText="电话" />
            <asp:BoundField DataField="gszy" HeaderText="主页" />
            <asp:BoundField DataField="lxr" HeaderText="联系人" />
            <asp:BoundField DataField="lxrdzyj" HeaderText="联系人邮件" />
            <asp:TemplateField HeaderText="会员类别">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# getHylbmcByHylbbh(Eval("hylb").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ljxfje" HeaderText="累计消费" />
            <asp:BoundField DataField="khbz" HeaderText="备注" />
            <asp:TemplateField HeaderText="编辑">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Ed" CommandArgument='<%# Eval("khbh")%>' >编辑</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" ForeColor="#996600" CommandName="De" CommandArgument='<%# Eval("khbh")%>' >删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>
    
    <div style="text-align: left;">
     客户名称:<asp:TextBox ID="txtbKhkhmcgx" runat="server"></asp:TextBox>
     邮编:<asp:TextBox ID="txtbKhybgx" runat="server"></asp:TextBox>
     电话:<asp:TextBox ID="txtbKhdhgx" runat="server"></asp:TextBox>
     地址:<asp:TextBox ID="txtbKhdzgx" runat="server" Height="16px" TextMode="MultiLine" Width="204px"></asp:TextBox><br />
     累计消费:<asp:TextBox ID="txtbKhljxfgx" runat="server"></asp:TextBox>
     主页:<asp:TextBox ID="txtbKhzygx" runat="server"></asp:TextBox>
     联系人:<asp:TextBox ID="txtbKhlxrgx" runat="server"></asp:TextBox>   `   
     联系人邮件:<asp:TextBox ID="txtbKhlxryjgx" runat="server"></asp:TextBox><br />
     会员类别:<asp:DropDownList ID="ddlKhhylbgx" runat="server"></asp:DropDownList>
     备注:<asp:TextBox ID="txtbKhbzgx" runat="server" Height="16px" TextMode="MultiLine"></asp:TextBox>
     <asp:Button ID="btnKhgx" runat="server" Text="更新" OnClick="btnKhgx_Click" />
     <asp:Label ID="lblKhmassagegx" runat="server" Height="21px" Width="340px" ForeColor="Red"></asp:Label><br />
     客户名称:<asp:TextBox ID="txtbKhkhmctj" runat="server"></asp:TextBox>
     邮编:<asp:TextBox ID="txtbKhybtj" runat="server"></asp:TextBox>
     电话:<asp:TextBox ID="txtbKhdhtj" runat="server"></asp:TextBox>
     地址:<asp:TextBox ID="txtbKhdztj" runat="server" Height="16px" TextMode="MultiLine" Width="204px"></asp:TextBox><br />
     累计消费:<asp:TextBox ID="txtbKhljxftj" runat="server"></asp:TextBox>
     主页:<asp:TextBox ID="txtbKhzytj" runat="server"></asp:TextBox>
     联系人:<asp:TextBox ID="txtbKhlxrtj" runat="server"></asp:TextBox>   `   
     联系人邮件:<asp:TextBox ID="txtbKhlxryjtj" runat="server"></asp:TextBox><br />
     会员类别:<asp:DropDownList ID="ddlKhhylbtj" runat="server"></asp:DropDownList>
     备注:<asp:TextBox ID="txtbKhbztj" runat="server" Height="16px" TextMode="MultiLine"></asp:TextBox>
     <asp:Button ID="btnKhtj" runat="server" Text="添加" OnClick="btnKhtj_Click" />
     <asp:Label ID="lblKhmassagetj" runat="server" Height="21px" Width="340px" ForeColor="Red"></asp:Label>
     </div>
 </div>
</asp:Content>

