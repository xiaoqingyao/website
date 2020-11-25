<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="JCXX_GYS.aspx.cs" Inherits="JCXX_JCXX_GYS" Title="某进销存管理系统--供应商信息设置" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div><strong style="color:Red;"> 供应商信息设置</strong><br />
    <asp:GridView ID="gvGys" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" OnPageIndexChanging="gvGys_PageIndexChanging" OnRowCommand="gvGys_RowCommand" OnRowDataBound="gvGys_RowDataBound"  >
        <Columns>
            <asp:BoundField DataField="gysbh" HeaderText="供应商编号" Visible="False" >
            </asp:BoundField>
            <asp:BoundField DataField="gysmc" HeaderText="供应商" />
            <asp:BoundField DataField="dz" HeaderText="地址" />
            <asp:BoundField DataField="yzbm" HeaderText="邮政编码" />
            <asp:BoundField DataField="lxdh" HeaderText="联系电话" />
            <asp:BoundField DataField="gszy" HeaderText="公司主页" />
            <asp:BoundField DataField="lxrdzyj" HeaderText="电子邮件" />
            <asp:BoundField DataField="lxr" HeaderText="联系人" />
            <asp:BoundField DataField="gysbz" HeaderText="备注" />
            <asp:TemplateField HeaderText="编辑">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Ed" CommandArgument='<%# Eval("gysbh")%>' >编辑</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" ForeColor="#996600" CommandName="De" CommandArgument='<%# Eval("gysbh")%>' >删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>

    <div style="text-align: left;">
     供&nbsp;&nbsp;应&nbsp;&nbsp;商:<asp:TextBox ID="txtbgysmcgx" runat="server"></asp:TextBox>
     联&nbsp;&nbsp;系&nbsp;&nbsp;人:<asp:TextBox ID="txtbgyslxrgx" runat="server"></asp:TextBox>
     邮政编码:<asp:TextBox ID="txtbyzbmgx" runat="server"></asp:TextBox>
     联系电话:<asp:TextBox ID="txtblxdhgx" runat="server"></asp:TextBox><br />
     公司主页:<asp:TextBox ID="txtbgszygx" runat="server"></asp:TextBox>
     电子邮件:<asp:TextBox ID="txtbdzyjgx" runat="server"></asp:TextBox>
     地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:<asp:TextBox ID="txtbdzgx" runat="server" Height="16px" TextMode="MultiLine" Width="358px"></asp:TextBox><br />
     备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:<asp:TextBox ID="txtbbzgx" runat="server" Height="16px" TextMode="MultiLine" Width="358px"></asp:TextBox>
        <asp:Button ID="btnGysgx" runat="server" Text="更新" OnClick="btnGysgx_Click" />
        <asp:Label ID="lblmassagegx" runat="server" Height="20px" Width="356px" ForeColor="Red"></asp:Label><br />
     供&nbsp;&nbsp;应&nbsp;&nbsp;商:<asp:TextBox ID="txtbgysmctj" runat="server"></asp:TextBox>
     联&nbsp;&nbsp;系&nbsp;&nbsp;人:<asp:TextBox ID="txtbgyslxrtj" runat="server"></asp:TextBox>
     邮政编码:<asp:TextBox ID="txtbyzbmtj" runat="server"></asp:TextBox>
     联系电话:<asp:TextBox ID="txtblxdhtj" runat="server"></asp:TextBox><br />
     公司主页:<asp:TextBox ID="txtbgszytj" runat="server"></asp:TextBox>
     电子邮件:<asp:TextBox ID="txtbdzyjtj" runat="server"></asp:TextBox>
     地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:<asp:TextBox ID="txtbdztj" runat="server" Height="16px" TextMode="MultiLine" Width="358px"></asp:TextBox><br />
     备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:<asp:TextBox ID="txtbbztj" runat="server" Height="16px" TextMode="MultiLine" Width="358px"></asp:TextBox>
        <asp:Button ID="btnGystj" runat="server" Text="添加" OnClick="btnGystj_Click" />
        <asp:Label ID="lblmassagetj" runat="server" Height="20px" Width="354px" ForeColor="Red"></asp:Label>   
     </div>
 </div>
</asp:Content>