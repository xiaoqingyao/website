<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upwd.aspx.cs" Inherits="users_upwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="images1/skin.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <style type="text/css">
        body
        {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-color: #EEF2FB;
            font-size: 12px;
        }
    </style>

    <script src="../js/calendar2.js" type="text/javascript"></script>

    <script type="text/javascript">
        var myCalendar = new myCalendar;
        myCalendar.render();
        var isContent = false;  
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="17" valign="top" background="images1/mail_leftbg.gif">
                <img src="images1/left-top-right.gif" width="17" height="29" />
            </td>
            <td valign="top" background="images1/content-bg.gif">
                <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg"
                    id="table2">
                    <tr>
                        <td height="31">
                            <div class="titlebt">
                                修改密码</div>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="16" valign="top" background="images1/mail_rightbg.gif">
                <img src="images1/nav-right-bg.gif" width="16" height="29" />
            </td>
        </tr>
        <tr>
            <td valign="middle" background="images1/mail_leftbg.gif">
                &nbsp;
            </td>
            <td valign="top" align="center" bgcolor="#F7F8F9" style="padding-top: 50px">
                <table cellpadding="0" cellspacing="0" border="0" width="500" style="line-height: 30px">
                   
                    <tr>
                        <th>
                            旧密码：
                        </th>
                        <td align="left">
                            <span style="color: #ff0000">
                                <input type="password" id="txtUserLogPwd" runat="server" name="password" class="input1" /><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="旧密码不能为空" ControlToValidate="txtUserLogPwd"></asp:RequiredFieldValidator></span>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            新密码：
                        </th>
                        <td align="left">
                            <span style="color: #ff0000">
                                <input type="password" id="txtUserLogPwdNew" runat="server" name="password" class="input1" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="新密码不能为空"
                                    ControlToValidate="txtUserLogPwdNew"></asp:RequiredFieldValidator></span>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            确认密码：
                        </th>
                        <td align="left">
                            <span style="color: #ff0000">
                                <input type="password" id="txtUserLogPwdNewSec" runat="server" name="password" class="input1" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="确认密码不能为空"
                                    ControlToValidate="txtUserLogPwdNewSec"></asp:RequiredFieldValidator></span>
                        </td>
                    </tr>
                    <tr>
                        <th>
                        </th>
                        <td align="left">
                            <asp:Button ID="btnAdd" runat="server" class="button" Width="50" Height="23" 
                                Text="确 定" onclick="btnAdd_Click" />
                        </td>
                    </tr>
                </table>
                <div style="text-align: center;">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtUserLogPwdNew"
                        ControlToValidate="txtUserLogPwdNewSec" ErrorMessage="两次密码不一致"></asp:CompareValidator>
                </div>
            </td>
            <td background="images1/mail_rightbg.gif">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="bottom" background="images1/mail_leftbg.gif">
                <img src="images1/buttom_left2.gif" width="17" height="17" />
            </td>
            <td background="images1/buttom_bgs.gif">
                <img src="images1/buttom_bgs.gif" width="17" height="17">
            </td>
            <td valign="bottom" background="images1/mail_rightbg.gif">
                <img src="images1/buttom_right2.gif" width="16" height="17" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
