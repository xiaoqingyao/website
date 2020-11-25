<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>集约化水产养殖设备管理系统的设计与实现</title>
    <LINK href="css/css.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
            height: 252px;
        }
        .style2
        {
            height: 252px;
            width: 407px;
        }
        .style4
        {
            height: 33px;
        }
        .style5
        {
            width: 407px;
            height: 33px;
        }
        .style6
        {
            height: 37px;
        }
        .style7
        {
            width: 407px;
            height: 37px;
        }
        .style8
        {
            height: 38px;
        }
        .style9
        {
            width: 407px;
            height: 38px;
        }
        .style10
        {
            height: 252px;
            width: 240px;
        }
        .style11
        {
            height: 33px;
            width: 240px;
        }
        .style12
        {
            height: 37px;
            width: 240px;
        }
        .style13
        {
            height: 38px;
            width: 240px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table cellpadding="0" cellspacing="0" dir="ltr" 
            style="width: 1002px; height: 600px;">
            <tr>
                <td style="background-image: url('image/login.jpg')" valign="top">
                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                        <tr>
                            <td class="style10">
                            </td>
                            <td class="style2">
                            </td>
                            <td class="style1">
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                </td>
                            <td class="style5">
                                <asp:Label ID="Label1" runat="server" Text="账户："></asp:Label>
                                <asp:TextBox ID="username" runat="server"></asp:TextBox>
                            </td>
                            <td class="style4">
                                </td>
                        </tr>
                        <tr>
                            <td class="style12">
                                </td>
                            <td class="style7">
                                <asp:Label ID="Label2" runat="server" Text="密码：" ForeColor="Black"></asp:Label>
                                <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                            <td class="style6">
                                </td>
                        </tr>
                        <tr>
                            <td class="style12">
                                </td>
                            <td class="style7">
                                <asp:Label ID="Label3" runat="server" Text="权限：" ForeColor="Black"></asp:Label>
                                <asp:DropDownList ID="quanxian" runat="server">
                                    <asp:ListItem>管理员</asp:ListItem>
                                    <asp:ListItem Selected="True">职员</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="style6">
                                </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                </td>
                            <td class="style9">
                                <asp:Button ID="Button1" runat="server" Text="登陆" onclick="Button1_Click"  />
&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button2" runat="server" Text="注册" onclick="Button2_Click" />
                            </td>
                            <td class="style8">
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
