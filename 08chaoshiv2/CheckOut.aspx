<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" ValidateRequest="false" %>

<%@ Register assembly="DotNetTextBox" namespace="DotNetTextBox" tagprefix="DNTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
 <asp:Panel ID="Panel3" runat="server" Height="800px">
           <table align="center" border="0" cellpadding="1" cellspacing="1" width="480">
            <tr>
                <td>
                    <asp:Label ID="lblTitleInfo" runat="server">请正确填写以下收货信息:</asp:Label></td>
            </tr>
            <tr style="font: 9pt 宋体">
                <td>
                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="tableBorder"
                        width="95%">
                        <tr style="font: 9pt 宋体">
                            <td align="left" style="height: 28px" width="100">
                                总金额：</td>
                            <td align="left" style="width: 359px; height: 28px">
                                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr style="font: 9pt 宋体">
                            <td align="left" style="height: 28px" width="100">
                                <span>收货人真实姓名</span>：</td>
                            <td align="left" style="width: 359px; height: 28px">
                                <asp:TextBox ID="txtReciverName" runat="server"></asp:TextBox>
                                <font color="red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                    runat="server" ControlToValidate="txtReciverName" ErrorMessage="收货人姓名不能为空">收货人姓名不能为空</asp:RequiredFieldValidator>
                                </font>
                            </td>
                        </tr>
                        <tr style="font: 9pt 宋体">
                            <td align="left" style="height: 24px">
                                收货人详细地址：
                            </td>
                            <td align="left" style="width: 359px; height: 24px">
                                <asp:TextBox ID="txtReceiverAddress" runat="server"></asp:TextBox><font color="red"><span
                                    style="color: #000000">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                        runat="server" ControlToValidate="txtReceiverAddress" ErrorMessage="收货人姓名不能为空">收货人地址不能为空</asp:RequiredFieldValidator></font></td>
                        </tr>
                        <tr style="font: 9pt 宋体">
                            <td align="left" style="height: 24px">
                                联系电话：
                            </td>
                            <td align="left" style="width: 359px; height: 24px">
                                <asp:TextBox ID="txtReceiverPhone" runat="server"></asp:TextBox><font color="red"><span
                                    style="color: #dc143c">*<asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtReceiverPhone" ErrorMessage="联系电话不能为空">联系电话不能为空</asp:RequiredFieldValidator>
                                </span></font></td>
                        </tr>
                        <tr style="font: 9pt 宋体">
                            <td align="left">
                                收货邮编：
                            </td>
                            <td align="left" style="width: 359px">
                                <asp:TextBox ID="txtReceiverPostCode" runat="server"></asp:TextBox><font color="red"><span
                                    style="color: #000000">*</span><asp:RegularExpressionValidator ID="revPostCode" runat="server"
                                        ControlToValidate="txtReceiverPostCode" Font-Size="9pt" ValidationExpression="\d{6}"
                                        Width="134px">您的邮编输入有误</asp:RegularExpressionValidator></font></td>
                        </tr>
                        <tr style="font: 9pt 宋体">
                            <td align="left" style="height: 17px">
                                电子信箱：
                            </td>
                            <td align="left" style="width: 359px; height: 17px">
                                <asp:TextBox ID="txtReceiverEmails" runat="server"></asp:TextBox><font color="red"><span
                                    style="color: #000000">*</span><asp:RegularExpressionValidator ID="revEmail" runat="server"
                                        ControlToValidate="txtReceiverEmails" Font-Size="9pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        Width="132px">您输入的E-mail地址格式不正确，请重新输入</asp:RegularExpressionValidator></font></td>
                        </tr>
                        <tr style="font: 9pt 宋体">
                            <td align="left" style="height: 23px">
                                支付方式：
                            </td>
                            <td align="left" style="height: 23px">
                                <%--<asp:DropDownList ID="" runat="server">
                                    <asp:ListItem>支付宝</asp:ListItem>
                                </asp:DropDownList>--%>
                                <asp:Label ID="ddlPayType" runat="server" Text="货到付款"></asp:Label>
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="font: 9pt 宋体">
                            <td align="left" colspan="2" style="height: 17px">
                                <span style="color: crimson"></span></td>
                        </tr>
                        <tr style="font: 9pt 宋体">
                            <td align="center" colspan="2">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                                <br />
                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保存" />
                                <asp:Button ID="btnReset" runat="server" Text="退出" OnClick="btnReset_Click" 
                                    CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>           
      
 </asp:Panel>
                                   
</asp:Content>

