<%@ Page Language="C#" AutoEventWireup="true" CodeFile="info_up.aspx.cs" Inherits="info_up" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>集约化水产养殖设备管理系统的设计与实现</title>
     <link href="css/css.css" type="text/css" rel="stylesheet">

    <style type="text/css">
        .style9
        {
            width: 96px;
            height: 29px;
        }
        .style10
        {
            height: 29px;
        }
        .style11
        {
            width: 96px;
            height: 31px;
        }
        .style12
        {
            height: 31px;
        }
        .style13
        {
            height: 29px;
            width: 238px;
        }
        .style14
        {
            height: 31px;
            width: 238px;
        }
    </style>

    </head>
<body>
    <form id="form1" runat="server">
    <div align="center" style="font-size: large">
    
        <br />
        <br />
        个人信息<br />
        <table style="width: 600px;" border="1" cellpadding="0" cellspacing="0">
            <tr>
                <td class="style9">
                    </td>
                <td align="left" class="style13">
                    账户：<asp:TextBox ID="users" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                <td align="left" class="style10">
                    密码：<asp:TextBox ID="pass" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="style11">
                    </td>
                <td align="left" class="style14">
                    性别：<asp:TextBox ID="sex" runat="server"></asp:TextBox>
                    </td>
                <td align="left" class="style12">
                    电话：<asp:TextBox ID="tel" runat="server"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="style11">
                    </td>
                <td align="left" class="style14">
                    Q&nbsp; Q：<asp:TextBox ID="qq" runat="server"></asp:TextBox>
                    </td>
                <td align="left" class="style12">
                    Email：<asp:TextBox ID="email" runat="server" Width="144px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="style11">
                    </td>
                <td align="left" class="style12" colspan="2">
                    备注：<asp:TextBox ID="beizhu" runat="server" Height="77px" TextMode="MultiLine" 
                        Width="394px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="style11">
                    </td>
                <td align="left" class="style12" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="修改信息" onclick="Button1_Click" />
&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>
</body>
</html>
