<%@ page language="C#" autoeventwireup="true" inherits="luntan, App_Web_aueme-2d" %>

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
            height: 204px;
        }
        .style34
        {
            width: 159px;
        }
        .style35
        {
            width: 185px;
        }
        .style36
        {
            width: 104px;
        }
        .style37
        {
            width: 118px;
            height: 12px;
        }
        .style38
        {
            height: 12px;
        }
        .style39
        {
            width: 104px;
            height: 12px;
        }
        .style40
        {
            height: 12px;
            width: 185px;
        }
        .style41
        {
            width: 159px;
            height: 23px;
        }
        .style42
        {
            width: 185px;
            height: 23px;
        }
        .style43
        {
            width: 104px;
            height: 23px;
        }
        .style44
        {
            height: 23px;
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
        <td><a href =yule.aspx>
&nbsp;娱乐|</a></td>
        <td>
           <a href = jingji.aspx>经济</a></td>
        <td>
            <a href =keji.aspx>科技</a></td>
        <td>
            <a href =shenghuo.aspx >生活</td>
        <td>
            <a href =luntan.aspx >论坛</a></td>
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
                <td class="style34" style="color: #000000; font-weight: bold; font-size: large; background-color: #99CCFF;">
                    <a href =luntan.aspx>论坛首页</a></td>
               <td class="style35"
                 style="color: #000000; font-weight: bold; font-size: large; ">
                    &nbsp;</td>
                   <td>&nbsp;</td>
                    <td >
                        &nbsp;</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34" ">
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34" style="color: #000000; font-weight: bold; font-size: large; background-color: #99CCFF;">
                    欢迎光临</td>
               <td class="style35"
                 style="color: #000000; font-weight: bold; font-size: large; ">
                    &nbsp;</td>
                   <td>帖子名称：</td>
                    <td >
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style41" >
                    当前用户:<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style42" >
                    </td>
                <td class="style43">
                    帖子分类：</td>
                <td class="style44">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style34"
                 style="color: #000000; font-weight: bold; font-size: large; background-color: #99CCFF">
                    用户功能</td>
                <td class="style35"
                 style="color: #000000; font-weight: bold; font-size: large; ">
                    &nbsp;</td>
                <td class="style36">
                    内容：</td>
                <td rowspan ="5">
                    <asp:TextBox ID="TextBox4" runat="server" Height="102px" TextMode="MultiLine" 
                        Width="387px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style34">
                     <a href="userlogin.aspx" > 用户登录               
                <td class="style35">
                     &nbsp;<td class="style36">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                    <a href="register.aspx" >  用户注册</a></td>
                <td class="style35">
                    &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                     <a href="updatepwd.aspx" >修改密码</a></td>
                <td class="style35">
                     </td>
                <td class="style36">
                    </td>
                <td>
                    </td>
            </tr>
            <tr>
                <td class="style34">
                    <a href = forgetpwd.aspx>密码找回</a><br />
                </td>
                <td class="style35">
                     &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style37">
                      <a href="information.aspx" >个人信息</a></td>
             <td class="style40"></td>
                <td class="style39">
                    <asp:Button ID="Button1" runat="server" Text="提交" onclick="Button1_Click" 
                        style="height: 26px" />
                </td>
                <td class="style38">
                    <asp:Button ID="Button2" runat="server" Text="取消" onclick="Button2_Click" />
                </td>
            </tr>
            <tr>
                <td class="style37">
                      <a href =fatie.aspx>用户发帖</a></td>
             <td class="style40">&nbsp;</td>
                <td class="style39">
                    &nbsp;</td>
                <td class="style38">
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
