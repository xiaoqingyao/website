<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pass_up.aspx.cs" Inherits="pass_up" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>集约化水产养殖设备管理系统的设计与实现</title>
     <link href="css/css.css" type="text/css" rel="stylesheet">
     <style type="text/css">
         .style8
         {
             height: 29px;
         }
         .style9
         {
             height: 29px;
             width: 117px;
         }
     </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center" style="font-size: large">
    
        <br />
        <br />
        密码修改<br />
        <table border="1" cellpadding="0" cellspacing="0" style="width: 60%;">
            <tr>
                <td align="right" class="style9">
                    账&nbsp;户：</td>
                <td align="left" class="style8">
                    <asp:TextBox ID="username" runat="server" ReadOnly></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style9">
                    新密码：</td>
                <td align="left" class="style8">
                    <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style9">
                </td>
                <td align="left" class="style8">
                    <asp:Button ID="Button1" runat="server" Text="修改密码" onclick="Button1_Click" />
&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="放弃" />
                </td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>
</body>
</html>
