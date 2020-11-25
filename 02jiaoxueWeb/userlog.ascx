<%@ Control Language="C#" AutoEventWireup="true" CodeFile="userlog.ascx.cs" Inherits="userlog" %>
<asp:Panel ID="Panel1" runat="server" Width="200">
        <table  border="0" align="center" cellpadding="0" cellspacing="0" style="width: 209px; height: 87px" >
            <tr>
                <td align="right" style="width: 65px">
                    用户名:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Style="border-right: #cadcb2 1px solid;
                        border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
                        width: 100px; color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" style="width: 65px">
                    密码:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Style="border-right: #cadcb2 1px solid;
                        border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
                        width: 100px; color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px"
                        TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    &nbsp;<asp:Button ID="Button1" runat="server" Height="18px" OnClick="Button1_Click"
                        Style="border-right: #cadcb2 1px solid; border-top: #cadcb2 1px solid; font-size: 12px;
                        border-left: #cadcb2 1px solid; color: #81b432; border-bottom: #cadcb2 1px solid"
                        Text=" 登 陆 " Width="58px" />
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Style="border-right: #cadcb2 1px solid;
                        border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
                        color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px" Text="用户注册" /></td>
            </tr>
        </table>
    </asp:Panel>
   <asp:Panel ID="Panel2" runat="server"  Width="200px">
    <table  border="0" align="center" cellpadding="0" cellspacing="0" style="width: 207px; height: 85px">
        <tr>
            <td style="width: 63px" align="right">
                用户名:</td>
            <td><%=Session["username"].ToString().Trim() %>
                </td>
        </tr>
        <tr>
            <td style="width: 63px" align="right">
                您的IP:</td>
            <td><%=Session["userip"].ToString().Trim() %>
                </td>
        </tr>
        <tr>
            <td style="width: 63px">
                &nbsp;</td>
            <td align="center">
                <asp:Button ID="Button2" runat="server" Height="18px" OnClick="Button2_Click"
                        Style="border-right: #cadcb2 1px solid; border-top: #cadcb2 1px solid; font-size: 12px;
                        border-left: #cadcb2 1px solid; color: #81b432; border-bottom: #cadcb2 1px solid"
                        Text=" 退 出 " Width="58px" />
                <asp:Button ID="Button4" runat="server"   OnClick="Button4_Click" Style="border-right: #cadcb2 1px solid;
                        border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
                        color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px" Text="个人后台" /></td>
        </tr>
    </table>
</asp:Panel> 
