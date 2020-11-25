<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changecompany.aspx.cs" Inherits="Admin_changecompany" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
      <base target ="_self" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td colspan="4">
                    公司资料修改</td>
            </tr>
            <tr>
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    公司名字:</td>
                <td style="height: 24px">
                    <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompanyName"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
                <td style="color: #000000; height: 24px">
                </td>
            </tr>
            <tr style="color: #000000">
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    公司地址:</td>
                <td style="height: 24px">
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
                <td style="color: #000000; height: 24px">
                </td>
            </tr>
            <tr style="color: #000000">
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    公司联系人:</td>
                <td style="height: 24px">
                    <asp:TextBox ID="txtContactMan" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContactMan"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    电话:</td>
                <td style="height: 24px">
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 87px">
                </td>
                <td>
                </td>
                <td>
                    <asp:ImageButton ID="ibtnOk" runat="server" ImageUrl="~/Image/ok.jpg" OnClick="ibtnOk_Click" />
                    <asp:ImageButton ID="ibtnCancel" runat="server" CausesValidation="False" ImageUrl="~/Image/cancel.jpg"
                        OnClick="ibtnCancel_Click" /></td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
