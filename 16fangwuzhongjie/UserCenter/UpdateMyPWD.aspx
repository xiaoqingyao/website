<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateMyPWD.aspx.cs" Inherits="houseIntermediaryMIS.UserCenter.UpdateMyPWD" %>

<%@ Register TagPrefix="UCtrl" TagName="MyLeft" Src="../UserControls/MyLeftCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Head" Src="../UserControls/HeadCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Foot" Src="../UserControls/FootCtrl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>更改密码</title>
</head>
<body leftmargin="0" topmargin="0">
    <form id="Form1" runat="server">
    <UCtrl:Head ID="Head1" runat="server"></UCtrl:Head>
    <table id="table1" width="900" align="center" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td valign="top" width="180">
                    <UCtrl:MyLeft ID="MyLeft1" runat="server"></UCtrl:MyLeft>
                </td>
                <td valign="top">
                    <table cellspacing="0" cellpadding="0" align="center" border="0">
                        <tr>
                            <td valign="top" align="center">
                                <table cellspacing="0" cellpadding="0" align="center" border="0">
                                    <tbody>
                                        <tr>
                                            <td align="center" width="422">
                                                <asp:Panel ID="panelEditPwd" runat="server">
                                                    <table cellspacing="1" cellpadding="3" align="center" border="0">
                                                        <tr>
                                                            <td colspan="2" class="style1">
                                                                <div class="12b" align="center">
                                                                    修改密码</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" width="224">
                                                                输入原密码：
                                                            </td>
                                                            <td width="347">
                                                                <input id="txtOldPwd" type="password" mname="txtOldPwd" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" width="224">
                                                                输入新密码：
                                                            </td>
                                                            <td>
                                                                <input id="txtNewPwd" type="password" name="txtNewPwd" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" width="224">
                                                                确认新密码：
                                                            </td>
                                                            <td>
                                                                <input id="txtRNewPwd" type="password" name="txtRNewPwd" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <div align="center">
                                                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label></div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <asp:Button ID="btnEdit2" runat="server" Text=" 确 定 " OnClick="btnEdit2_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <UCtrl:Foot ID="Foot1" runat="server"></UCtrl:Foot>
    </form>
</body>
</html>
