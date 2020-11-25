<%@ page language="C#" autoeventwireup="true" inherits="register, App_Web_c3um79i_" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 160px;
        }
        .style3
        {
            height: 16px;
        }
        .style4
        {
            width: 160px;
            height: 16px;
        }
        .style8
        {
            height: 16px;
            width: 340px;
        }
        .style12
        {
            height: 15px;
        }
        .style13
        {
            width: 340px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td style="color: #0000FF" class="style13"  >
                    <a href =luntan.aspx>论坛首页</a></td>
                <td colspan ="2" class="style12">
                    </td>
                <td class="style12">
                    </td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td colspan ="2" bgcolor="#0066FF" 
                    style="font-size: large; font-weight: bold; color: #FFFFFF">
                    赶快加入注册吧！</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    </td>
                <td class="style4" align="right">
                    <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                <td class="style3" style="color: #FF0000">
                    <asp:Label ID="Label7" runat="server" ForeColor="#FF3300" Text="*"></asp:Label>
                    </td>
                <td class="style3">
                    </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style4" align="right" colspan =2 style="color: #0066FF">
                    输入用户名和密码后可进行密保注册哦&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td class="style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2" style="color: #0066FF; font-size: large; font-weight: bold">
                    用户名：</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="检查用户" />
                </td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2" style="color: #0066FF; font-size: large; font-weight: bold">
                    密码：</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" ></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2"style="color: #0066FF; font-size: large; font-weight: bold">
                    真实姓名：</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2"
                    style="border-color: #CCFFFF; color: #0066FF; font-size: large; font-weight: bold">
                    电子邮件：</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2" style="border-color: #CCFFFF">
                    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="确定" />
                </td>
                <td class="style2">
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="取消" />
                </td>
                <td>
                    <asp:Button ID="Button5" runat="server" Text="密保注册" BackColor="#CCFFFF" 
                        onclick="Button5_Click" />
                </td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2" style="border-color: #CCFFFF">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2" style="border-color: #CCFFFF" rowspan=6 colspan =2>
                    <asp:Panel ID="Panel1" runat="server" Height="213px" Visible="False" 
                        Width="360px" BackColor="#99FFCC">
                        &nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<br />
                        问题一：您母亲的生日是？<br />
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label2" runat="server" Text="例如：1988/08/08"></asp:Label>
                        <br />
                        问题二：您父亲的生日是？<br />
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        &nbsp;
                        <asp:Label ID="Label8" runat="server" Text="例如：1988/08/12"></asp:Label>
                        <br />
                        问题三：您的家乡是？<br />
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button6" runat="server" Text="保存" onclick="Button6_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </asp:Panel>
                </td>
                    <td>
&nbsp;</td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2" style="border-color: #CCFFFF">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2" style="border-color: #CCFFFF">
                        &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2" style="border-color: #CCFFFF">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2" style="border-color: #CCFFFF">
                        &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2" style="border-color: #CCFFFF">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2" style="border-color: #CCFFFF" colspan =2>
                        &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2" style="border-color: #CCFFFF" colspan =2>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style2" style="border-color: #CCFFFF">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
