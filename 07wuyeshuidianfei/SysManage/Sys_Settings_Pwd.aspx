<%@ Page Language="C#" MasterPageFile="~/SysManage/MasterPage.master" AutoEventWireup="true" CodeFile="Sys_Settings_Pwd.aspx.cs" Inherits="SysManage_Sys_Settings_Pwd" Title="无标题页" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="30" background="images/tab_05.gif">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="12" height="30">
                            <img src="images/tab_03.gif" width="12" height="30" /></td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="46%" valign="middle">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="5%" align="center"><img src="images/tb.gif" width="16" height="16" /></td>
                                                <td width="95%">当前位置：修改密码</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="54%"></td>
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
                        <td width="8">&nbsp;</td>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#ededed" class="tab1">
                                <tr>
                                    <td width="200" align="right" style="height:35px"> 用户名： </td>
                                    <td><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td align="right" style="height:35px">原密码：</td>
                                    <td>
                                        <asp:TextBox ID="txt_old_pwd" runat="server" CssClass="textbox" Width="200px" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_old_pwd" ErrorMessage="请输入原密码."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height:35px">新密码：</td>
                                    <td>
                                        <asp:TextBox ID="txt_new_pwd" runat="server" CssClass="textbox" 
                                                Width="200px" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ControlToValidate="txt_new_pwd" 
                                                ErrorMessage="请输入新密码."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height:35px">确认新密码：</td>
                                    <td>
                                        <asp:TextBox ID="txt_Re_pwd" runat="server" CssClass="textbox" 
                                                Width="200px" TextMode="Password"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                ControlToCompare="txt_new_pwd" ControlToValidate="txt_Re_pwd" 
                                                ErrorMessage="两次输入的新密码不一样."></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height:35px"></td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" Text="确认修改" onclick="Button1_Click" /></td>
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