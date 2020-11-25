<%@ page language="C#" autoeventwireup="true" inherits="luntan, App_Web_vdvnzxsk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 189px;
        }
        .style2
        {
            height: 36px;
        }
        .style32
        {
            width: 100%;
            height: 46px;
        }
        .style33
        {
            width: 100%;
        }
        .style34
        {
            width: 186px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1" align="center">
            <tr bgcolor="#3366FF">
                <td colspan ="2" style="color: #FFFFFF" class="style2">
                    [七嘴八舌]论坛欢迎您！</td>
            </tr>
            <tr>
                <td colspan ="2" 
                    
                    style="background-image: url('images/00.jpg'); background-repeat: no-repeat">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
<table bgcolor="#3366FF" class="style32">
    <tr style="color: #FFFFFF; font-weight: bold; font-size: x-large">
        <td>
           <a href ="main.aspx"> 首页|</a></td>
        <td><a href=yule.aspx>娱乐|</a>
&nbsp;</td>
        <td>
            <a href =jingji.aspx>经济</a></td>
        <td>
            <a href =keji.aspx>科技</a></td>
        <td>
            <a href =shenghuo.aspx>生活</a></td>
        <td>
           <a href = luntan.aspx>论坛</a></td>
    </tr>
</table>
        <table class="style33">
            <tr>
                <td class="style34" ">
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34" 
                    
                    style="color: #000000; font-weight: bold; font-size: large; background-color: #99CCFF;">
                    <a href =luntan.aspx>论坛首页</a></td>
                <td rowspan ="10">
                    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <table class="style33">
                                <tr>
                                    <td>
                                        用户名：</td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("userid") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        真实姓名：</td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("realname") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        电子邮件：</td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td class="style34" ">
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34" 
                    
                    style="color: #000000; font-weight: bold; font-size: large; background-color: #99CCFF;">
                    欢迎光临</td>
            </tr>
            <tr>
                <td class="style34" >
                    当前用户:<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34"
                 style="color: #000000; font-weight: bold; font-size: large; background-color: #99CCFF">
                    用户功能</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                     <a href="userlogin.aspx" > 用户登录</a></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                    <a href="register.aspx" >  用户注册</a></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                     <a href="updatepwd.aspx" >修改密码</a></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                    <a href = information.aspx>个人信息</a></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                   <a href = fatie.aspx>用户发帖</a></td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
