<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="JCXX_YWY.aspx.cs" Inherits="JCXX_JCXX_YWY" Title="某进销存管理系统--业务员信息设置" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div><strong style="color:Red;"> 业务员信息设置</strong><br />
    <asp:GridView ID="gvYwy" runat="server" AutoGenerateColumns="False" AllowPaging="True" Height="160px" Width="840px" BorderStyle="None" PageSize="13" OnPageIndexChanging="gvYwy_PageIndexChanging" OnRowDataBound="gvYwy_RowDataBound" OnRowCommand="gvYwy_RowCommand"  >
        <Columns>
            <asp:BoundField DataField="ywybh" HeaderText="业务员编号" Visible="False" />
            <asp:BoundField DataField="ywymc" HeaderText="名称" />
            <asp:BoundField DataField="dlmc" HeaderText="登录名称" />
            <asp:BoundField DataField="dlmm" HeaderText="登录密码" />
            <asp:BoundField DataField="lxdh" HeaderText="联系电话" />
            <asp:BoundField DataField="jtzz" HeaderText="家庭住址" />
            <asp:BoundField DataField="sfzhm" HeaderText="身份证号码" />
            <asp:TemplateField HeaderText="角色名称">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# getJsmcByJsbh(Eval("jsbh").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ywybz" HeaderText="业务员备注" />
            <asp:TemplateField HeaderText="编辑">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" ForeColor="#996600" CommandName="Ed" CommandArgument='<%# Eval("ywybh")%>' >编辑</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" ForeColor="#996600" CommandName="De" CommandArgument='<%# Eval("ywybh")%>' >删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#CCFF99" />
        <SelectedRowStyle BackColor="#CCFF99" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle ForeColor="#996600" HorizontalAlign="Right" />
    </asp:GridView>
    <div style="text-align:left;">
    名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:<asp:TextBox ID="txtbywymcgx" runat="server"></asp:TextBox>
    登录名称:<asp:TextBox ID="txtbdlmcgx" runat="server"></asp:TextBox>
    登录密码:<asp:TextBox ID="txtbdlmmgx" runat="server"></asp:TextBox>
    联系电话:<asp:TextBox ID="txtblxdhgx" runat="server"></asp:TextBox><br/>
    家庭住址:<asp:TextBox ID="txtbjtzzgx" runat="server" Height="16px" TextMode="MultiLine" Width="358px"></asp:TextBox>
    身份证号:<asp:TextBox ID="txtbsfzhmgx" runat="server"></asp:TextBox>
    角色名称:<asp:DropDownList ID="ddljsbhgx" runat="server"></asp:DropDownList><br/>
    备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:<asp:TextBox ID="txtbbzgx" runat="server" Height="16px" TextMode="MultiLine" Width="358px"></asp:TextBox>
    <asp:Button ID="btngx" runat="server" Text="更新" OnClick="btngx_Click" />
    <asp:Label ID="lblgxmassage" runat="server" Height="22px" Width="220px" ForeColor="Red"></asp:Label><br/>
    名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:<asp:TextBox ID="txtbywymctj" runat="server"></asp:TextBox>
    登录名称:<asp:TextBox ID="txtbdlmctj" runat="server"></asp:TextBox>
    登录密码:<asp:TextBox ID="txtbdlmmtj" runat="server"></asp:TextBox>
    联系电话:<asp:TextBox ID="txtblxdhtj" runat="server"></asp:TextBox><br/>
    家庭住址:<asp:TextBox ID="txtbjtzztj" runat="server" Height="16px" TextMode="MultiLine" Width="358px"></asp:TextBox>
    身份证号:<asp:TextBox ID="txtbsfzhmtj" runat="server"></asp:TextBox>
    角色名称:<asp:DropDownList ID="ddljsbhtj" runat="server"></asp:DropDownList><br/>
    备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:<asp:TextBox ID="txtbbztj" runat="server" Height="16px" TextMode="MultiLine" Width="358px"></asp:TextBox>
    <asp:Button ID="btntj" runat="server" Text="添加" OnClick="btntj_Click" />
    <asp:Label ID="lbltjmassage" runat="server" Height="22px" Width="220px" ForeColor="Red"></asp:Label>
    </div>
    </div>
</asp:Content>