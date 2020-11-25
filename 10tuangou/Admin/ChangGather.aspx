<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangGather.aspx.cs" Inherits="Admin_ChangGather" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
     <base target="_self" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td colspan="4" style="height: 18px">
                    修改团购</td>
            </tr>
            <tr>
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    团购标题:</td>
                <td style="height: 24px">
                    <asp:TextBox ID="txtGatherTitle" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtGatherTitle"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
                <td style="color: #000000; height: 24px">
                </td>
            </tr>
            <tr style="color: #000000">
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    团购类别:</td>
                <td style="height: 24px">
                    <asp:DropDownList ID="ddlgathertype" runat="server">
                    </asp:DropDownList>
                </td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    团购的产品:</td>
                <td style="height: 24px">
                    <asp:DropDownList ID="ddlProduct" runat="server">
                    </asp:DropDownList></td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    团购价格:</td>
                <td style="height: 24px">
                    <asp:TextBox ID="txtprice" runat="server"></asp:TextBox></td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    团购起始人数:</td>
                <td style="height: 24px">
                    <asp:TextBox ID="txtgahternum" runat="server"></asp:TextBox></td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 87px; height: 27px">
                </td>
                <td style="height: 27px">
                    团购的说明:</td>
                <td style="height: 27px">
                    <asp:TextBox ID="txtShow" runat="server" Height="112px" TextMode="MultiLine" Width="289px"></asp:TextBox></td>
                <td style="height: 27px">
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
