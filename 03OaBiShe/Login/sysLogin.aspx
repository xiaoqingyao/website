<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sysLogin.aspx.cs" Inherits="Login_sysLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>欢迎使用智能OA系统</title>
    <link rel="stylesheet" type ="text/css" href="../CSS/CSS.css" />
</head>
<body style="background-image: url(../image/rightFrame.gif);background-size:cover">
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table style="width: 266px; height: 139px; background-image: url(../image/登录.gif);" align="center" class="css">
            <tr>
                <td align="center" colspan="3" style="height: 37px" class="cssTitle">
                    <asp:Label ID="labTitle" runat="server" Text="－＝登录窗口＝－" Width="170px"></asp:Label>

                      
                <asp:DropDownList runat="server" ID="type">
                    <asp:ListItem Value="stu">学生</asp:ListItem>
                    <asp:ListItem  Value="sys">教师</asp:ListItem>
                </asp:DropDownList>
                
                </td>
            </tr>
           
            <tr>
                <td style="width: 93px; height: 15px" align="center">
                    <br />
                    </td>
                <td colspan="2" style="height: 15px; width: 138px;">
                    <asp:TextBox ID="txtName" runat="server" Width="140px" CssClass="InputCss"></asp:TextBox>
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="140px" CssClass="InputCss"></asp:TextBox></td>
            </tr>
            
            <tr>
                <td align="right" colspan="3" style="height: 25px">
                    <asp:Button ID="btnLogin" runat="server" Text="登  录" Font-Size="Smaller" OnClick="btnLogin_Click" CssClass="ButtonCss"/>&nbsp;
                    &nbsp;<asp:Button ID="btnCandel" runat="server" Text="取 消" Font-Size="Smaller" OnClick="btnCandel_Click" CssClass="ButtonCss" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
