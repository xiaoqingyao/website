<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>
        <%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
    <link href="Style/Style.css" type="text/css" rel="STYLESHEET"/>
</head>
<body onload="javascript:form1.TxtUserName.focus();" background="images/Loginbg.jpg">
    <form id="form1" runat="server">
    <div align="center">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <img src="images/Login_02.jpg" width="800" height="46" alt="" style="margin-top: 0px"/>
                </td>
            </tr>
            <tr>
                <td width="800" height="84" background="images/Login_03.jpg" align="center">
                    <table>
                        <tr>
                            <td height="30px">
                                <strong><span style="font-size: 12px; color: #ffffff">用户名称：</span></strong>
                            </td>
                            <td>
                                <asp:TextBox ID="TxtUserName" runat="server" Height="25px" Width="180px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="30px">
                                <strong><span style="font-size: 12px; color: #ffffff">用户密码：</span></strong>
                            </td>
                            <td>
                                <asp:TextBox ID="TxtUserPwd" runat="server" Height="25px" TextMode="Password" Width="180px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <img src="images/Login_04.jpg" width="800" height="12" alt="">
                </td>
            </tr>
            <tr>
                <td background="images/Login_05.jpg" width="800" height="98" align="center" valign="top">
                    <asp:CheckBox ID="CheckBox1" runat="server" ForeColor="White" Text="弹出" />
                    &nbsp;
                    <asp:CheckBox ID="cbRememberId" runat="server" ForeColor="White" Text="记住用户名" Checked="True" />
                    &nbsp;
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/images/btn1.jpg"
                        OnClick="ImageButton1_Click" />
                </td>
            </tr>
            <tr>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
