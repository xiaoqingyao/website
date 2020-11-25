<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>欢迎登录家庭理财管理系统</title>
    <link
        rel="stylesheet" type="text/css" href="Images/linkey.css">
    <style>
        BODY {
            BACKGROUND-COLOR: #ffffff;
            FONT-SIZE: 9pt;
            leftmargin: 0;
            topmargin: 0;
            marginwidth: 0;
            marginheight: 0;
        }

        .input {
            WIDTH: 1px;
            BORDER-TOP-WIDTH: 1px;
            HEIGHT: 1px;
        }

        .mylogininput {
            BORDER-BOTTOM: #333333 1px solid;
            BORDER-LEFT: #333333 1px solid;
            WIDTH: 206px;
            HEIGHT: 29px;
            FONT-SIZE: 12pt;
            BORDER-TOP: #333333 1px solid;
            BORDER-RIGHT: #333333 1px solid;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
                <tbody>
                    <tr>
                        <td>
                            <table border="0" cellspacing="0" cellpadding="0" width="953" align="center">
                                <tbody>
                                    <tr>
                                        <td style="font-family: 微软雅黑; font-size: 42px; height:88px;">欢迎使用家庭理财管理系统！</td>
                                    </tr>
                                    <tr>
                                        <td height="521" valign="top" background="Images/OAlogin.jpg" style="background-repeat: no-repeat"
                                            width="953">
                                            <table border="0" cellspacing="0" cellpadding="0" width="953"
                                                height="392">
                                                <tbody>
                                                    <tr>
                                                        <td height="130" width="593"></td>
                                                        <td height="130"></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="35" align="right">登录账号：</td>
                                                        <td height="35"><font color="red">
                                                            <div id="mydiv">
                                                                <asp:TextBox ID="TxtUserName" runat="server" Width="119px"></asp:TextBox>
                                                            </div>
                                                        </font></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="26" align="right">登录密码：</td>
                                                        <td style="padding-top: 5px" height="26">
                                                            <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" Width="117px"></asp:TextBox></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="height: 19px">用户角色：</td>
                                                        <td style="height: 19px">
                                                            <asp:DropDownList ID="DropDownList1" runat="server" Width="124px">
                                                                <asp:ListItem>管理员</asp:ListItem>
                                                                <asp:ListItem>普通用户</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="26" align="right">验证码</td>
                                                        <td height="26">&nbsp;<asp:TextBox ID="txtyan" runat="server" Width="85px"></asp:TextBox><asp:Label
                                                            ID="lblyanzheng" runat="server" BackColor="DeepSkyBlue" ForeColor="#004000"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="20" align="right"></td>
                                                        <td height="20"></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="height: 23px"></td>
                                                        <td style="height: 23px">
                                                            <label>
                                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Images/dl.jpg" OnClick="ImageButton1_Click" />&nbsp;
                    
                  
                                                            </label>
                                                            <a href="Reg.aspx">用户注册</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="23" align="right"></td>
                                                        <td height="23"></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="28" align="right"></td>
                                                        <td height="28"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
    </form>
</body>
</html>
