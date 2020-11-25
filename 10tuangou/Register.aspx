<%@ Page Language="c#" Inherits="ch33.Verify" CodeFile="Register.aspx.cs" %>

<%@ Register Src="UserContral/top.ascx" TagName="top" TagPrefix="uc2" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>用户注册</title>
    <link href="style/default.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0; text-align: center">
    <form id="Form1" method="post" runat="server">
    <center>
        <table cellpadding="0" cellspacing="0" width="770">
            <tr>
                <td>
                </td>
                <td style="width: 1005px">
                    <uc2:top ID="Top2" runat="server" />
                </td>
                <td style="width: 126px">
                </td>
            </tr>
            <tr>
                <td style="height: 454px">
                </td>
                <td style="width: 1005px; height: 454px;">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 614px; height: 21px;">
                            </td>
                            <td style="width: 187px; height: 21px;">
                                用户注册
                            </td>
                            <td style="width: 731px; height: 21px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 614px; height: 17px;">
                                用户名:
                            </td>
                            <td style="width: 187px; height: 17px;">
                                <asp:TextBox ID="txtPerName" runat="server" Width="150px"></asp:TextBox>
                                <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*" Width="13px"></asp:Label>
                            </td>
                            <td style="width: 731px; height: 17px;">
                                &nbsp;<asp:Label ID="lblMessage" runat="server" Font-Size="Smaller"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvPerName" runat="server" ErrorMessage="用户名不能为空"
                                    ControlToValidate="txtPerName"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 614px; height: 21px;">
                                密码:
                            </td>
                            <td style="width: 187px; height: 21px;">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td style="width: 731px; height: 21px;">
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="密码不能为空"
                                    ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 614px; height: 21px;">
                                确认密码:
                            </td>
                            <td style="width: 187px; height: 21px;">
                                <asp:TextBox ID="txtSurePassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td style="width: 731px; height: 21px;">
                                <asp:CompareValidator ID="cvPassword" runat="server" ErrorMessage="两次输入密码不一致" ControlToCompare="txtPassword"
                                    ControlToValidate="txtSurePassword"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 614px; height: 31px;">
                                验证码:
                            </td>
                            <td style="width: 187px; height: 31px;">
                                <asp:TextBox ID="txtValidateCode" runat="server" Width="150px"></asp:TextBox>
                                <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td style="width: 731px; height: 31px; vertical-align: top; text-align: left;">
                                <asp:Image ID="ImageCheck" runat="server" ImageUrl="ValidateCode.aspx" Width="17%"
                                    Height="81%" /><input type="button" name="btnUpdate" value="看不清楚?" onclick="document.getElementById('ImageCheck').src='ValidateCode.aspx?r='+Math.random();"
                                        id="Button1" />
                            </td>
                        </tr>
                        <tr style="color: #000000">
                            <td style="width: 614px; height: 21px;">
                                性别:
                            </td>
                            <td style="width: 187px; height: 21px;">
                                <asp:DropDownList ID="ddlGender" runat="server" Width="156px">
                                    <asp:ListItem>男</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                            </td>
                            <td style="width: 731px; height: 21px;">
                            </td>
                        </tr>
                        <tr style="color: #000000">
                            <td style="width: 614px; height: 21px;">
                                地址:
                            </td>
                            <td style="width: 187px; height: 21px;">
                                <asp:DropDownList ID="ddlAddress" runat="server" Width="156px">
                                    <asp:ListItem>北京</asp:ListItem>
                                    <asp:ListItem>上海</asp:ListItem>
                                    <asp:ListItem>湖南</asp:ListItem>
                                    <asp:ListItem>湖北</asp:ListItem>
                                    <asp:ListItem>江苏</asp:ListItem>
                                    <asp:ListItem>河南</asp:ListItem>
                                    <asp:ListItem>天津</asp:ListItem>
                                    <asp:ListItem>广东</asp:ListItem>
                                    <asp:ListItem>黑龙江</asp:ListItem>
                                    <asp:ListItem>新疆</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                            </td>
                            <td style="width: 731px; height: 21px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 614px; height: 23px;">
                                电话号码:
                            </td>
                            <td style="width: 187px; height: 23px;">
                                <asp:TextBox ID="txtPhone" runat="server" Width="150px"></asp:TextBox>
                                <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td style="width: 731px; height: 23px;">
                                <asp:RegularExpressionValidator ID="revPhone" runat="server" ErrorMessage="请填写正确的电话号码,如:0733-1234567"
                                    Width="283px" ControlToValidate="txtPhone" ValidationExpression="\d{3,4}-\d{7,8}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 614px; height: 29px;">
                                电子邮箱:
                            </td>
                            <td style="width: 187px; height: 29px;">
                                <asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox>
                                <asp:Label ID="Label8" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td style="width: 731px; height: 29px;">
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Email格式不正确"
                                    ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 614px; height: 21px;">
                                MSN:
                            </td>
                            <td style="width: 187px; height: 21px;">
                                <asp:TextBox ID="txtMSN" runat="server" Width="150px"></asp:TextBox>
                            </td>
                            <td rowspan="3" style="width: 731px">
                                <asp:Image ID="imgPhoto" runat="server" Width="115px" ImageUrl="~/Image/yulan.jpg" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 614px; height: 14px;">
                                QQ:
                            </td>
                            <td style="width: 187px; height: 14px;">
                                <asp:TextBox ID="txtQQ" runat="server" Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 614px; height: 13px;">
                                密码提示问题:
                            </td>
                            <td style="width: 187px; height: 13px;">
                                <asp:DropDownList ID="ddlquestion" runat="server" Width="185px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 614px; height: 3px;">
                                答案:
                            </td>
                            <td style="width: 187px; height: 3px;">
                                <asp:TextBox ID="txtAnswer" runat="server" Width="150px"></asp:TextBox>
                                <asp:Label ID="Label9" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                            <td style="width: 731px; height: 3px;">
                                <input id="filePhoto" type="file" onchange="getImage()" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 614px; height: 21px;">
                            </td>
                            <td style="width: 187px; height: 21px;">
                            </td>
                            <td style="width: 731px; height: 21px;">
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="bnOk" runat="server" OnClick="bnOk_Click" Text="确定" />
                </td>
                <td style="width: 126px; height: 454px;">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 1005px">
                </td>
                <td style="width: 126px">
                </td>
            </tr>
        </table>
    </center>
    </form>
</body>
</html>
