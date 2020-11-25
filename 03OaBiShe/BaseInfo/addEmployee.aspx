<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addEmployee.aspx.cs" Inherits="BaseInfo_addEmployee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(../image/rightFrame.gif)">
    <form id="form1" runat="server">
    <div>
        <div>
            <table style="width: 496px; height: 1px" align="center" border="1" cellspacing="0" class="css">
                <tr>
                    <td align="center" class="cssTitle" colspan="2">
                        －＝注册学生基本信息＝－</td>
                </tr>
                <tr>
                    <td style="width: 177px; height: 3px">
                        学生姓名：</td>
                    <td style="width: 566px; height: 3px">
                        <asp:TextBox ID="txtEName" runat="server" CssClass="InputCss" Width="140px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEName"
                            ErrorMessage="学生姓名　必须填写">**</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 177px; height: 37px">
                        学生性别：</td>
                    <td style="width: 566px; height: 37px">
                        <asp:DropDownList ID="dlSex" runat="server" CssClass="InputCss" Width="60px">
                            <asp:ListItem>男性</asp:ListItem>
                            <asp:ListItem>女性</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        <asp:Image ID="Image1" runat="server" Width="64px" />
                        </td>
                </tr>
                <tr>
                    <td style="width: 177px;">
                        相片路径：</td>
                    <td style="width: 566px;">
                        <input id="File1" runat="server" class="InputCss" style="width: 335px" type="file" />
                        <asp:Button ID="btnGoUp" runat="server" CausesValidation="False" CssClass="redButtonCss"
                            OnClick="btnGoUp_Click" Text="上传" Width="67px" /></td>
                </tr>
                <tr>
                    <td style="width: 177px;">
                        出生日期：</td>
                    <td style="width: 566px;">
                        <asp:TextBox ID="txtEBrith" runat="server" CssClass="InputCss" Width="140px"></asp:TextBox>(例:2006-01-01)<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEBrith"
                            ErrorMessage="出生日期　必须填写">**</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtEBrith"
                            ErrorMessage="(格式:yyyy-mm-dd)" Operator="DataTypeCheck" Type="Date" Width="113px"></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td style="width: 177px; height: 2px">
                    学 历：</td>
                    <td style="width: 566px; height: 2px">
                        <asp:TextBox ID="txtELearn" runat="server" CssClass="InputCss" Width="140px"></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtELearn"
                            ErrorMessage="学历　必须填写">**</asp:CustomValidator></td>
                </tr>
                <tr>
                    <td style="width: 177px;">
                        年级数：</td>
                    <td style="width: 566px;">
                        <asp:TextBox ID="txtPost" runat="server" CssClass="InputCss" Width="140px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPost"
                            ErrorMessage="　必须填写">**</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 177px;">
                        班级：</td>
                    <td style="width: 566px;">
                        <asp:DropDownList ID="dlDept" runat="server" CssClass="InputCss" DataTextField="deptName"
                            DataValueField="deptName" Width="140px">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="width: 177px;">
                        职位：</td>
                    <td style="width: 566px;">
                        <asp:DropDownList ID="dlJop" runat="server" CssClass="InputCss" Width="140px">
                            <asp:ListItem>班长</asp:ListItem>
                            <asp:ListItem>纪律委员</asp:ListItem>
                            <asp:ListItem>卫生委员</asp:ListItem>
                            <asp:ListItem>课代表</asp:ListItem>
                            <asp:ListItem>组长</asp:ListItem>
                            <asp:ListItem>学生</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="width: 177px;">
                        电话：</td>
                    <td style="width: 566px;">
                        <asp:TextBox ID="txtTel" runat="server" CssClass="InputCss" Width="140px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTel"
                            ErrorMessage="电话　必须填写">**</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtTel"
                            ValidationExpression="(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}" ErrorMessage="电话格式不正确　例如:0136-12345678">格式不正确!</asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td style="width: 177px;">
                        地址：</td>
                    <td style="width: 566px;">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="InputCss" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress"
                            ErrorMessage="地址　必须填写">**</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 177px;">
                        E_mail:</td>
                    <td style="width: 566px;">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="InputCss" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Email　必须填写">**</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEmail"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Email格式不正确">格式不正确!</asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td style="width: 177px;">
                        状态：</td>
                    <td style="width: 566px;">
                        <asp:DropDownList ID="dlState" runat="server" CssClass="InputCss" Width="60px">
                            <asp:ListItem>在校</asp:ListItem>
                            <asp:ListItem>离校</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="height: 2px" align="center" colspan="2">
                        <asp:Button ID="btnSave" runat="server" CssClass="blueButtonCss" OnClick="btnSave_Click"
                            Text="保　存" />
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="blueButtonCss"
                            OnClick="btnCancel_Click" Text="重　填" /></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 1px">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Height="28px" ShowMessageBox="True"
            ShowSummary="False" Width="200px" />
                    </td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
