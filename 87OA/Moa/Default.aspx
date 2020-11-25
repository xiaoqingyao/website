<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Moa_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>深度历险移动办公平台</title>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <link href="../../Style/Mobile/pics/homescreen.gif" rel="apple-touch-icon" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />
    <style type="text/css">
        body
        {
            background: url('../images/default_bg.png') top center no-repeat;
        }
        .inputsubmit
        {
            width: 74px;
            height: 21px;
            color: #36434E;
            border: 0px;
            cursor: pointer;
            font-size: 12px;
        }
    </style>
</head>
<body onload="javascript:form1.TxtUserName.focus();" background="../images/default_bg.png">
    <form id="form1" runat="server">
    <div align="center">
        <table cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td align="center" valign="top" style="padding-top: 60px;" height="430" width="320">
                    <table width="100%">
                        <tr>
                            <td style="text-align: center; font-family: 微软雅黑; font-size: 24px; color: White;"
                                colspan="2">
                                深度历险移动办公平台
                            </td>
                        </tr>
                        <tr>
                            <td height="10">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; width: 85px; font-family: 微软雅黑;">
                                <span style="color: White;">用户账户：</span>
                            </td>
                            <td>
                                <asp:TextBox ID="TxtUserName" class="inputtext" onfocus="this.select()" onmouseover="this.focus()"
                                    runat="server" Height="30px" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="10">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; width: 85px; font-family: 微软雅黑;">
                                <span style="color: White;">用户密码：</span>
                            </td>
                            <td>
                                <asp:TextBox ID="TxtUserPwd" class="inputtext" onfocus="this.select()" onmouseover="this.focus()"
                                    runat="server" Height="30px" TextMode="Password" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td  colspan="2" align="center">
                             <asp:CheckBox ID="cbRememberId" runat="server" ForeColor="White" Text="记住用户名" Checked="True" />
                    &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 229px">
                            </td>
                            <td>
                                <asp:Button ID="ImageButton2" runat="server" class="inputsubmit" OnClick="ImageButton1_Click"
                                    Text="登 录" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
