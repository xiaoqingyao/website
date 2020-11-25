<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reg.aspx.cs" Inherits="reg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>集约化水产养殖设备管理系统的设计与实现</title>
    <link href="css/css.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
            height: 184px;
        }
        .style2
        {
            height: 184px;
            width: 212px;
        }
        .style4
        {
            height: 33px;
        }
        .style5
        {
            width: 212px;
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
        .style9
        {
            height: 38px;
        }
        .style10
        {
            height: 184px;
            width: 293px;
        }
        .style11
        {
            height: 33px;
            width: 293px;
        }
        .style12
        {
            height: 37px;
            width: 293px;
        }
        .style13
        {
            height: 38px;
            width: 293px;
        }
        .style14
        {
            color: #FFFFE1;
            height: 37px;
        }
        .style15
        {
            color: #FFFFE1;
            width: 212px;
            height: 37px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table cellpadding="0" cellspacing="0" dir="ltr" 
            style="width: 1002px; height: 600px;">
            <tr>
                <td style="background-image: url('image/reg.jpg')" valign="top">
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
                                <asp:TextBox ID="users" runat="server"></asp:TextBox>
                            </td>
                            <td class="style4">
                                <asp:Label ID="Label2" runat="server" Text="密码：" ForeColor="Black"></asp:Label>
                                <asp:TextBox ID="pass" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                            <td class="style12">
                                </td>
                            <td class="style15">
                                <asp:Label ID="Label3" runat="server" ForeColor="Black" Text="性别："></asp:Label>
                                <asp:TextBox ID="sex" runat="server"></asp:TextBox>
                            </td>
                            <td class="style6">
                                <asp:Label ID="Label4" runat="server" Text="电话："></asp:Label>
                                <asp:TextBox ID="tel" runat="server"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                            <td class="style12">
                                </td>
                            <td class="style15">
                                <asp:Label ID="Label5" runat="server" ForeColor="Black" Text="QQ号："></asp:Label>
                                <asp:TextBox ID="qq" runat="server"></asp:TextBox>
                            </td>
                            <td class="style6">
                                <asp:Label ID="Label6" runat="server" Text=" Email:   "></asp:Label>
                                <asp:TextBox ID="email" runat="server"></asp:TextBox>
                                </td>
                        </tr>
                       
                        <tr>
                            <td class="style12">
                                </td>
                            <td class="style14" colspan="2">
                                <asp:Label ID="Label7" runat="server" ForeColor="Black" Text="备注："></asp:Label>
                                <asp:TextBox ID="beizhu" runat="server" Height="112px" Rows="5" 
                                    TextMode="MultiLine" Width="360px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                </td>
                            <td class="style9" colspan="2">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button1" runat="server" Text="注册" onclick="Button1_Click" />
&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button2" runat="server" Text="返回" onclick="Button2_Click" />
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
