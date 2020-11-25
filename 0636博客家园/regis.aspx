<%@ Page Language="C#" AutoEventWireup="true" CodeFile="regis.aspx.cs" Inherits="regis" %>

<%@ Register Src="usercontrols/bott.ascx" TagName="bott" TagPrefix="uc2" %>
<%@ Register Src="usercontrols/top.ascx" TagName="top" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>心灵阶梯博客-注册</title>
    <link href="Css/comm.css" rel="stylesheet" type="text/css" />
    <link href="Css/ys.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:top ID="Top1" runat="server" />
        <table width="974" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="10" style="background-image: url('images/left.jpg'); background-repeat: repeat-y;">
                </td>
                <td align="center" valign="middle" height="500"> 
                <h2 style="color:Red;">用户注册</h2>                   
                    <table border="0" cellpadding="0" cellspacing="0" width="690" style="line-height: 30px">
                        <tr>
                            <td align="right" width="250">
                                用户名<span style="color: Red;">*</span>：
                            </td>
                            <td align="left" width="440">
                                <asp:TextBox ID="txtLogName" runat="server" Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="用户名不能为空" ControlToValidate="txtLogName"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                密码<span style="color: Red;">*</span>：
                            </td>
                            <td align="left" width="440">
                                <asp:TextBox ID="txtLogPwd" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="密码不能为空" ControlToValidate="txtLogPwd"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                昵称<span style="color: Red;">*</span>：
                            </td>
                            <td align="left" width="440">
                                <asp:TextBox ID="txtNickName" runat="server" Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv3" runat="server" ErrorMessage="昵称不能为空" ControlToValidate="txtNickName"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                电话<span style="color: Red;">*</span>：
                            </td>
                            <td align="left" width="440">
                                <asp:TextBox ID="txtTel" runat="server" Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv4" runat="server" ErrorMessage="电话不能为空" ControlToValidate="txtTel"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                QQ<span style="color: Red;">*</span>：
                            </td>
                            <td align="left" width="440">
                                <asp:TextBox ID="txtQQ" runat="server" Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv5" runat="server" ErrorMessage="QQ不能为空" ControlToValidate="txtQQ"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                邮箱<span style="color: Red;">*</span>：
                            </td>
                            <td align="left" width="440">
                                <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv6" runat="server" ErrorMessage="邮箱不能为空" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                &nbsp;
                            </td>
                            <td align="left" width="440" height="50" valign="middle" style="padding-left: 50px">
                                <asp:Button ID="btnRegis" runat="server" Text="注册" Width="50" Height="25" OnClick="btnRegis_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;<input id="btnReset" type="reset" value="重置" style="width: 50px; height: 25px;" /></td>
                        </tr>
                    </table>
                </td>
                <td width="8" style="background-image: url('images/right.jpg'); background-repeat: repeat-y;">
                </td>
            </tr>
        </table>
        <uc2:bott ID="Bott1" runat="server" />
    </form>
</body>
</html>
