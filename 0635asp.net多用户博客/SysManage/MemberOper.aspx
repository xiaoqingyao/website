<%@ Page Language="C#" MasterPageFile="~/SysManage/MasterPage.master" AutoEventWireup="true" CodeFile="MemberOper.aspx.cs" Inherits="SysManage_MemberOper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="30" background="images/tab_05.gif">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="50%" valign="middle">
                                        <img src="images/tb.gif" width="16" height="16" align="absmiddle" />
                                        当前位置：用户信息操作
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="width: 8px">&nbsp;</td>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#9FBD65"
                                class="tab1" style="margin-top:10px;">
                                
                                <tr>
                                    <td width="100" align="right" style="height:35px">用户帐号：</td>
                                    <td>
                                        <asp:TextBox ID="txtMemberUser" runat="server" CssClass="textbox" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right" style="height:35px">用户密码：</td>
                                    <td style="height: 26px">
                                        <asp:TextBox ID="txtMemberPwd" runat="server" CssClass="textbox" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height:35px">昵称：</td>
                                    <td>
                                        <asp:TextBox ID="txtTitle" runat="server" CssClass="textbox" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height:35px">Email：</td>
                                    <td>
                                        <asp:TextBox ID="tel" runat="server" CssClass="textbox" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td align="right" style="padding:20px 0;">&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnSubmit" runat="server" Text=" 提交信息 " OnClick="btnSubmit_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="Button1" type="button" value="返回" onclick="javascript:history.go(-1);" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="8">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>