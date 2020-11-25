<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Validate_Info.aspx.cs" Inherits="Validate_Info" %>

<%@ Register Src="UserContral/Bootom.ascx" TagName="Bootom" TagPrefix="uc1" %>
<%@ Register Src="UserContral/top.ascx" TagName="top" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>团购信息确认</title>
    <link href="style/default.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0; text-align: left; vertical-align: top; border-right: darkgray 1px solid;
    border-top: darkgray 1px solid; border-left: darkgray 1px solid; width: 100%;
    border-bottom: darkgray 1px solid; text-align: center;">
    <form id="form1" runat="server">
    <center>
        <table width="788" style="background-color: olive;" cellpadding="0" cellspacing="0"
            border="0">
            <tr>
                <td>
                    <table width="780px" style="background-color: #ffffff;" border="1">
                        <tr>
                            <td style="height: 165px" colspan="3">
                                <uc2:top ID="Top2" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 17px">
                                <span style="color: #004a9f">完善团购订单信息！</span>
                            </td>
                            <td style="width: 9px; height: 17px;">
                            </td>
                            <td style="width: 297px; height: 17px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 60%; vertical-align: top; text-align: left; height: 288px;">
                                <table width="100%">
                                    <tr>
                                        <td colspan="4" style="height: 17px">
                                            请确认您的资料
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 30%; float: right;">
                                            联系人：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="lianxi" runat="server" Style="float: left"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lianxi"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%; float: right; height: 23px;" colspan="3">
                                            联系地址：
                                        </td>
                                        <td style="width: 12px; height: 23px;">
                                            <asp:TextBox ID="address" runat="server" Style="float: left"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="address"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 30%; float: right;">
                                            性别：
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="sex" runat="server" Style="float: left">
                                                <asp:ListItem>男</asp:ListItem>
                                                <asp:ListItem>女</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 30%; height: 21px; float: right;">
                                            固定电话：
                                        </td>
                                        <td style="height: 21px">
                                            <asp:TextBox ID="gphone" runat="server" Style="float: left"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="gphone"
                                                ErrorMessage="固定电话输入不正确" ValidationExpression="0\d{2}-\d{8}|0\d{2}-\d{7}|0\d{3}-\d{7}|0\d{3}-\d{8}"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="float: right; height: 24px;">
                                            手机：
                                        </td>
                                        <td style="height: 24px">
                                            <asp:TextBox ID="mphone" runat="server" Style="float: left"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="mphone"
                                                ErrorMessage="手机号码输入不正确" ValidationExpression="1\d{10}"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                </table>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                <asp:Button ID="btnok" runat="server" Style="vertical-align: middle; text-align: center"
                                    Text="报  名  参  加" Width="160px" OnClick="btnok_Click" />
                            </td>
                            <td style="width: 3px; height: 288px;">
                            </td>
                            <td style="vertical-align: top; text-align: left; height: 288px; width: 297px;">
                                <table style="border-right: darkgray 1px solid; border-top: darkgray 1px solid; border-left: darkgray 1px solid;
                                    width: 100%; border-bottom: darkgray 1px solid; height: 242px">
                                    <tr>
                                        <td>
                                            <strong>说明:<br />
                                            </strong>&nbsp; 为了方便及时的与您取得联系，并提供<br />
                                            最好的团购服务，请正确填写左边的团购<br />
                                            资料，或者再次确认您的团购资料。<br />
                                            我们的客服人员将尽快与您取得联系，并<br />
                                            告知您团购的流程与方法。<br />
                                            谢谢，您的惠顾！<br />
                                            &nbsp; &nbsp; 请确保您的资料填写正确，否则我们<br />
                                            会取消您的团购资格。
                                        </td>
                                        <td style="width: 84px">
                                        </td>
                                        <td style="width: 3px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="width: 84px">
                                        </td>
                                        <td style="width: 3px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="width: 84px">
                                        </td>
                                        <td style="width: 3px">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td style="width: 9px">
                            </td>
                            <td style="width: 297px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
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
