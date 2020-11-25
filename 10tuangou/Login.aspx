<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register Src="UserContral/Bootom.ascx" TagName="Bootom" TagPrefix="uc1" %>
<%@ Register Src="UserContral/top.ascx" TagName="top" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>用户登陆</title>
    <link href="style/default.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top:0; text-align:left; vertical-align: top; text-align:center;">
    <form id="form1" runat="server">
    <center>
  
        <table width="788" style="background-color: Olive ;" cellpadding="0" cellspacing="0" >
        <tr>
            <td style="width: 788px" >
            <table width="780px" style="background-color: #ffffff;">
            <tr>
            <td style="width: 467px; height: 45px">
                <uc2:top ID="Top1" runat="server" />
            </td>
            </tr>
            <tr>
            <td style="height: 58px; width: 467px;"></td>
            </tr>
            <tr>
            <td style="width: 778px; height: 174px">
            <table>
            <tr><td style="width: 155px; height: 215px"></td>
            <td style="width: 389px; height: 215px; border-right: blue thin solid; border-top: blue thin solid; border-left: blue thin solid; border-bottom: blue thin solid;">
            <table style="width: 386px; height: 196px"> 
            <tr>
            <td style="height: 50px" colspan="2"><table><tr><td style="height: 25px; width: 389px; font-weight: bold; font-size: 20pt;" colspan="2">
                <asp:Image ID="Image1" runat="server" Height="40px" ImageUrl="Image/huyuan.bmp" />个人会员登陆</td></tr><tr><td style="height: 25px; width: 389px;" colspan="2"></td></tr></table></td>
            </tr>
            <tr>
            <td style="width: 124px; height: 30px">
                用户名:</td>
            <td style="width: 194px; height: 30px">
        <asp:TextBox ID="txtPerName" runat="server" Width="123px" style="float: left"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPerName"
                    ErrorMessage="*" Width="1px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
            <td style="width: 124px; height: 30px">
                密&nbsp; 码:</td>
            <td style="width: 194px; height: 30px">
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" style="float: left" Width="120px"></asp:TextBox>&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="*" Width="1px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 29px; text-align:center">
        <asp:Button ID="btnLogin" runat="server"  Text="登　陆" OnClick="btnLogin_Click" />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                    <asp:Button ID="btnReg" runat="server" Text="注册" OnClick="btnReg_Click" CausesValidation="False" /></td>
            </tr>
            <tr><td colspan="2" style="height: 21px"></td></tr>
            </table>
            </td>
            <td style="width: 233px; height: 215px"> </td>
            </tr>
            </table>
            </td>
            </tr>
            <tr>
            <td style="width: 778px; height: 111px">
                <uc1:Bootom ID="Bootom1" runat="server" />
            </td>
            </tr>
            </table>
            </td>
        </tr>
        </table>
    </center>
    </form>
</body>
</html>