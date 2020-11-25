<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModifyUser.aspx.cs" Inherits="Admin_ModifyUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>家庭财务管理系统</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
<link rel="stylesheet" type="text/css" href="skin/css/main.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
<table width="100%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td   class='title'><span>修改用户信息</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="left">
        <table align="center" border="0" cellpadding="3"  class="" width="99%">
            <tr>
                <td class="left_title_1" style="width: 88px; height: 30px">
                    用户姓名：</td>
                <td style="width: 621px; height: 30px">
                    <asp:TextBox ID="Name" runat="server" Width="153px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
                        ErrorMessage="必填"></asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td class="left_title_1" style="width: 88px; height: 30px">
                    登陆账号：</td>
                <td style="width: 621px; height: 30px">
                    <asp:TextBox ID="loginName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="loginName"
                        ErrorMessage="必填"></asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td class="left_title_1" height="30" style="width: 88px">
                    性别：</td>
                <td height="30" style="width: 621px">
                    <asp:DropDownList ID="Sex" runat="server" Width="89px">
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr style="color: #000000">
                <td class="left_title_1" style="width: 88px; height: 30px">
                    年龄：</td>
                <td style="width: 621px; height: 30px">
                    <asp:TextBox ID="NianLing" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
                   <tr style="color: #000000">
                <td class="left_title_1" style="width: 88px; height: 30px">
                    身份证号码：</td>
                <td style="width: 621px; height: 30px">
                    <asp:TextBox ID="SFZ" runat="server" Width="319px"></asp:TextBox></td>
            </tr>
                <tr style="color: #000000">
                <td class="left_title_1" style="width: 88px; height: 30px">
                    称呼：</td>
                <td style="width: 621px; height: 30px">
                    <asp:TextBox ID="XueLI" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
                <tr style="color: #000000">
                <td class="left_title_1" style="width: 88px; height: 30px">
                    联系电话：</td>
                <td style="width: 621px; height: 30px">
                    <asp:TextBox ID="TEl" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
            <tr style="color: #000000">
                <td class="left_title_1" style="width: 88px; height: 30px">
                    用户角色：</td>
                <td style="width: 621px; height: 30px">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="100px">
                        <asp:ListItem>管理员</asp:ListItem>
                        <asp:ListItem>普通用户</asp:ListItem>
                     
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td class="left_title_1" style="width: 88px; height: 85px">
                    备注：</td>
                <td style="width: 621px; height: 85px">
                    <asp:TextBox ID="Ds" runat="server" Height="81px" TextMode="MultiLine" Width="473px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" class="left_title_1" colspan="2" style="height: 30px">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Width="56px">修改</asp:LinkButton></td>
            </tr>
        </table>
    </td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
