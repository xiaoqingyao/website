﻿<%@ page language="C#" autoeventwireup="true" inherits="userlogin, App_Web_gmcx2wqp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 476px;
        }
        .style3
        {
            width: 96px;
        }
        .style4
        {
            width: 31px;
        }
        .style5
        {
            width: 174px;
        }
        .style6
        {
            width: 476px;
            height: 179px;
        }
        .style7
        {
            height: 179px;
            width: 31px;
        }
        .style8
        {
            height: 179px;
            width: 96px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style6">
                  <a href =  luntan.aspx>论坛首页</a></td>
                <td </td class="style8">
                <td class="style7">
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td colspan ="3" align="center" bgcolor="#CCCCCC">
                    用户登录</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    用户名：</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox1" runat="server" Height="18px" 
                        ></asp:TextBox>
                </td>
                <td class="style5" style="color: #FF0000">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    *必须填<asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="注册" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    密码：</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="style5" style="color: #FF0000">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    *必须填<asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="找回" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    验证码：</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td class="style5" style="color: #FF0000">
                    <asp:Image ID="Image1" runat="server" ImageUrl="yzm.aspx"/>
                    <asp:LinkButton ID="LinkButton1" runat="server">看不清换一张</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4" align="right">
                    &nbsp;</td>
                <td class="style5">
                    <asp:Button ID="Button1" runat="server" Text="登录" onclick="Button1_Click" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style5">
                    <br />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
