<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        .style1
        {
            height: 26px;
            width: 282px;
        }
        .style2
        {
            width: 282px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <center>
        <table style="vertical-align: middle; width: 900px; text-align: center; ">
            <tr>
                <td>
                </td>
                <td>
                    <h3>管理员登陆</h3></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 125px">
                </td>
                <td style="height: 125px">
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">
                            </td>
                            <td style="width: 101px; height: 26px">
                                用户名:</td>
                            <td style="width: 44px; height: 26px">
                                <asp:TextBox ID="txtUserName" runat="server" Width="150px"></asp:TextBox></td>
                            <td style="height: 26px">
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                            </td>
                            <td style="width: 101px">
                                密码:</td>
                            <td style="width: 44px">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                            </td>
                            <td style="width: 101px">
                            </td>
                            <td style="width: 44px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                            </td>
                            <td style="width: 101px">
                            </td>
                            <td style="width: 44px">
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="登陆" Width="66px" /></td>
                <td style="height: 125px">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </center>
    </form>
</body>
</html>
