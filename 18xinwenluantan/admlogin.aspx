<%@ page language="C#" autoeventwireup="true" inherits="admlogin, App_Web_pylcw4et" %>

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
            height: 67px;
        }
        .style4
        {
            height: 32px;
        }
        .style5
        {
            height: 67px;
            width: 452px;
        }
        .style6
        {
            height: 32px;
            width: 452px;
        }
        .style8
        {
            width: 452px;
        }
        .style9
        {
            height: 67px;
            width: 159px;
        }
        .style10
        {
            height: 32px;
            width: 159px;
        }
        .style12
        {
            width: 159px;
        }
        .style13
        {
            height: 67px;
            width: 135px;
        }
        .style14
        {
            height: 32px;
            width: 135px;
        }
        .style16
        {
            width: 135px;
        }
        .style17
        {
            height: 67px;
            width: 114px;
        }
        .style18
        {
            height: 32px;
            width: 114px;
        }
        .style20
        {
            width: 114px;
        }
        .style21
        {
            height: 28px;
            width: 452px;
        }
        .style22
        {
            height: 28px;
            width: 135px;
        }
        .style23
        {
            height: 28px;
            width: 159px;
        }
        .style24
        {
            height: 28px;
            width: 114px;
        }
        .style25
        {
            height: 28px;
        }
    </style>
</head>
<body bgcolor="#CCFFFF">
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style5">
                </td>
                <td class="style13">
                    &nbsp;</td>
                <td class="style9">
                </td>
                <td class="style17">
                </td>
                <td class="style2">
                </td>
            </tr>
            <tr>
                <td class="style6">
                    &nbsp;</td>
                <td class="style14">
                    用户角色：</td>
                <td class="style10">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                </td>
                <td class="style14">
                    用户名：</td>
                <td class="style10">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td class="style18">
                </td>
                <td class="style4">
                </td>
            </tr>
            <tr>
                <td class="style21">
                </td>
                <td class="style22">
                    密码：</td>
                <td class="style23">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                </td>
                <td class="style24">
                </td>
                <td class="style25">
                </td>
            </tr>
            <tr>
                <td class="style21">
                    &nbsp;</td>
                <td class="style22">
                    确认密码:</td>
                <td class="style23">
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="style24">
                    &nbsp;</td>
                <td class="style25">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style21">
                    &nbsp;</td>
                <td class="style22">
                    验证码：</td>
                <td class="style23">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
                <td class="style5" style="color: #FF0000">
                    <asp:Image ID="Image1" runat="server" ImageUrl="yzm.aspx"/>
                    <asp:LinkButton ID="LinkButton1" runat="server">看不清换一张</asp:LinkButton>
                </td>
                <td class="style25">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style16">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="登录" />
                </td>
                <td class="style12">
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="置空" />
                </td>
                <td class="style20">
                    <asp:Button ID="Button3" runat="server" BackColor="#CCFF99" Text="注册就有机会成为管理员哦" 
                        Width="162px" onclick="Button3_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style16" colspan =3>
                    <asp:Panel ID="Panel1" runat="server" Height="226px" Visible="False" 
                        Width="377px">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                        <br />
                        用户角色：<asp:DropDownList ID="DropDownList2" runat="server">
                        </asp:DropDownList>
                        <br />
                        用户名：&nbsp;
                        <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="检查用户名" 
                            Width="70px" />
                        <br />
                        密码：&nbsp; &nbsp;
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                        <br />
                        真实姓名：<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <br />
                        电子邮件：<asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button5" runat="server" ForeColor="Red" onclick="Button5_Click" 
                            Text="注册" />
                    </asp:Panel>
                </td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style16" colspan =3>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style16" colspan =3>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style16" colspan =3>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style20">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style20">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style20">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style20">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
