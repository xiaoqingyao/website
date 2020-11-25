<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户登录</title>
    <style type="text/css">
        .txt{ text-align:right; width:70px; height:40px}
    </style>
</head>
<body style="font-size:14px; background-color:#fff; padding-top:30px">
 <center>
    <form id="form1" runat="server">
    <div style="width:1000px; background-image:url(Image/index_05.png); height:142px">
   
        </div>
    <table>
        <tr>
            <td style="width:573; height:394px;">
                <img src="Images/m.jpg" alt="" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            </td>
            <td>
                <div style="width:327px; height:240px; border:1px solid #cbcbcb; background-color:#f7f7f7; margin-top:30px; padding-top:20px">
                    <table>   
                        <tr>
                            <td colspan="2" style="font-size:15px; font-weight:bold; color:#444444; padding-left:15px" align="left">用户登录</td>
                        </tr>                 
                        <tr>
                            <td class="txt">用户名：</td>
                            <td>
                                <asp:TextBox ID="txtUserName" runat="server" ></asp:TextBox></td>
                        </tr>                 
                        <tr>
                            <td></td>
                            <td><asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="用户名不能为空！" Display="Dynamic" ControlToValidate="txtUserName" CssClass="Text"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="txt">密　码：</td>
                            <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">&nbsp;&nbsp;</td></tr>
                        <tr> <td></td>
                            <td><asp:ImageButton ID="btnLogin" runat="server" 
                                    ImageUrl="~/Images/btnlogin.png" onclick="BtnOK_Click" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="Default.aspx">返回首页</a></td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    </form>
    </center>
</body>
</html>
