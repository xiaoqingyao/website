<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updateEmployee.aspx.cs" Inherits="BaseInfo_updateEmployee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link rel="stylesheet" type ="text/css" href="../CSS/CSS.css"/>
</head>
<body style="background-image: url(../image/rightFrame.gif)">
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <table align="center" style="width: 288px; height: 38px" class="css" border="1" cellspacing="0" >
            <tr>
                <td align="center" class="cssTitle" colspan="2">
                    －＝编辑学生基本信息＝－</td>
            </tr>
            <tr>
                <td style="width: 41px">
                    <asp:Label ID="Label2" runat="server" Font-Size="Small" Width="66px">学生姓名：</asp:Label></td>
                <td style="width: 131px">
                    <asp:TextBox ID="txtEName" runat="server" Height="12px" Width="140px" CssClass="InputCss"></asp:TextBox></td>
            </tr>
            <tr style="color: #000000">
                <td style="width: 41px; height: 21px">
                    <asp:Label ID="Label3" runat="server" Font-Size="Small" Width="65px">学生性别：</asp:Label></td>
                <td style="width: 131px; height: 21px">
                    <asp:DropDownList ID="dlSex" runat="server" Width="52px" CssClass="InputCss">
                        <asp:ListItem>男性</asp:ListItem>
                        <asp:ListItem>女性</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 41px">
                    <asp:Label ID="Label4" runat="server" Font-Size="Small" Width="65px">出生日期：</asp:Label></td>
                <td style="width: 131px">
                    <asp:TextBox ID="txtEBrith" runat="server" Height="12px" Width="140px" CssClass="InputCss"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 41px; height: 22px">
                    <asp:Label ID="Label5" runat="server" Font-Size="Small" Width="65px">学　　历：</asp:Label>
                </td>
                <td style="width: 131px; height: 22px">
                    <asp:TextBox ID="txtELearn" runat="server" Height="12px" Width="140px" CssClass="InputCss"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 41px; height: 21px">
                    <asp:Label ID="Label6" runat="server" Font-Size="Small" Width="65px">学生年级：</asp:Label></td>
                <td style="width: 131px; height: 21px">
                    <asp:TextBox ID="txtPost" runat="server" Height="12px" Width="140px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 41px">
                    <asp:Label ID="Label7" runat="server" Font-Size="Small" Width="66px">班级：</asp:Label></td>
                <td style="width: 131px">
                    <asp:DropDownList ID="dlDept" runat="server" DataTextField="deptName" DataValueField="deptName"
                        Width="140px" CssClass="InputCss">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 41px; height: 24px;">
                    <asp:Label ID="Label8" runat="server" Font-Size="Small" Width="66px">职位：</asp:Label></td>
                <td style="width: 131px; height: 24px;">
                    <asp:DropDownList ID="dlJop" runat="server" Width="140px" CssClass="InputCss">
                        <asp:ListItem>班长</asp:ListItem>
                            <asp:ListItem>纪律委员</asp:ListItem>
                            <asp:ListItem>卫生委员</asp:ListItem>
                            <asp:ListItem>课代表</asp:ListItem>
                            <asp:ListItem>组长</asp:ListItem>
                            <asp:ListItem>学生</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 41px">
                    <asp:Label ID="Label9" runat="server" Font-Size="Small" Width="67px">电话：</asp:Label></td>
                <td style="width: 131px">
                    <asp:TextBox ID="txtTel" runat="server" Height="12px" Width="140px" CssClass="InputCss"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 41px">
                    <asp:Label ID="Label10" runat="server" Font-Size="Small" Width="67px">地址</asp:Label></td>
                <td style="width: 131px">
                    <asp:TextBox ID="txtAddress" runat="server" Height="12px" Width="200px" CssClass="InputCss"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 41px">
                    <asp:Label ID="Label11" runat="server" Font-Size="Small" Width="67px">E_mail:</asp:Label></td>
                <td style="width: 131px">
                    <asp:TextBox ID="txtEmail" runat="server" Height="12px" Width="200px" CssClass="InputCss"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 41px">
                    <asp:Label ID="Label12" runat="server" Font-Size="Small" Width="66px">状态：</asp:Label></td>
                <td style="width: 131px">
                    <asp:DropDownList ID="dlState" runat="server" Width="60px" CssClass="InputCss">
                        <asp:ListItem>在校</asp:ListItem>
                        <asp:ListItem>离校</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 41px">
                </td>
                <td align="center" style="width: 131px">
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" OnClick="btnCancel_Click"
                        Text="返  回" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
