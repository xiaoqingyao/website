<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Debug="true" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>欢迎光临教务管理系统</title>
<script language="javascript" type="text/javascript">

   
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <br />
            <table align="center"  border="0" cellpadding="0" cellspacing="0" style="border-right: green thin groove; border-top: green thin groove;
                margin: 1px; border-left: green thin groove; border-bottom: green thin groove; width: 469px; height: 293px;" id="TABLE1" onclick="return TABLE1_onclick()">
                <tr>
                    <td colspan="5"  background="pic/back_04.jpg" rowspan="2" style="height: 203px">
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                
                    <td style="width: 148px;" background="pic/back_02.jpg" rowspan="4">
                   
                        &nbsp; &nbsp;&nbsp;</td>
                        
                    <td style="width: 67px; height: 32px">
                        <div align="center">
                            账 号：</div>
                    </td>
                    <td colspan="2" style="height: 32px; text-align: left" width="158">
                        <asp:TextBox ID="txtNum" runat="server" Height="18px" Width="125px"></asp:TextBox></td>
                    <td style="width: 67px; height: 32px; text-align: left">
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNum"
                            Display="Dynamic" ErrorMessage="请输入账号" Font-Size="10pt" ForeColor="DarkGray"
                            Width="24px">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr style="font-size: 12pt">
                    <td style="width: 67px; height: 32px">
                        <div align="center">
                            密 码：</div>
                    </td>
                    <td colspan="2" style="height: 32px; text-align: left">
                        <asp:TextBox ID="txtPwd" runat="server" Height="18px" MaxLength="12" TextMode="Password"
                            Width="125px"></asp:TextBox>&nbsp;</td>
                    <td style="width: 67px; height: 32px; text-align: left">
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd"
                            Display="Dynamic" ErrorMessage="密码不为空" Font-Size="10pt" ForeColor="DimGray" Width="13px">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr style="font-size: 12pt">
                    <td style="width: 67px; height: 29px;">
                        <div align="center">
                            身 份：</div>
                    </td>
                    <td colspan="2" style="text-align: left; height: 29px;">
                        <asp:DropDownList ID="power" runat="server">
                            <asp:ListItem Selected="True">管理员</asp:ListItem>
                            <asp:ListItem>教师</asp:ListItem>
                            <asp:ListItem >学生</asp:ListItem>
                        </asp:DropDownList>&nbsp;</td>
                    <td style="width: 67px; height: 29px;">
                        &nbsp;</td>
                </tr>
                <tr style="font-size: 12pt">
                    <td style="width: 67px; height: 13px;">
                        <div align="center">
                            验证码：</div>
                    </td>
                    <td style="text-align: left; height: 13px;" colspan="2">
                        <asp:TextBox ID="txtCode" runat="server" Height="22px" Width="75px"></asp:TextBox>
                        <asp:Image ID="Image1" runat="server" Height="23px" ImageUrl="Image.aspx" Width="71px" /></td>
                    <td style="width: 67px; text-align: left; height: 13px;">
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCode"
                            Display="Dynamic" ErrorMessage="请输入验证码" Font-Size="10pt" ForeColor="DimGray"
                            Width="13px">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr style="font-size: 12pt">
                    <td colspan="5" style="text-align: center; height: 37px;">
                        &nbsp;<asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" Text="登录" />
                        &nbsp;&nbsp; &nbsp;<asp:Button ID="btnconcel" runat="server" CausesValidation="False"
                            OnClick="btnconcel_Click" Text="取消" /></td>
                </tr>
            </table>
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
            ShowSummary="False" />
    
    </div>
    </form>
</body>
</html>
