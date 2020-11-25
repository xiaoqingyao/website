<%@ page language="C#" autoeventwireup="true" inherits="luntan, App_Web_gmcx2wqp" %>

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
            width: 123%;
        }
        .style34
        {
            width: 186px;
        }
        .style35
        {
            width: 237px;
        }
        .style36
        {
            width: 335px;
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
<table  class="style32">
    <tr  bgcolor="#3366FF"style="color: #FFFFFF; font-weight: bold; font-size: x-large">
        <td>
           <a href ="main.aspx"> 首页|</a></td>
        <td>
        <a href =yule.aspx>娱乐|</a></td>
        <td>
           <a href = jingji.aspx>经济</a></td>
        <td>
           <a href = keji.aspx>科技</a></td>
        <td>
            <a href =shenghuo.aspx>生活</a></td>
        <td>
           <a href = luntan.aspx>论坛</a></td>
    </tr>
    <tr >
        <td>
            &nbsp;</td>
        <td >
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
            <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
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
                <td class="style36" >
                    &nbsp;</td>
                  <td class="style35">
                      &nbsp;</td>
        <td>
            &nbsp;</td>
            <td>
            &nbsp;</td>
 
            </tr>
            <tr>
                <td class="style34" ">
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34" 
                    
                   >
                   </td>
                   <td class="style36">
                       &nbsp;</td>
        <td align="center" bgcolor="#6699FF" class="style35">
            密码找回</td>
            <td>
                &nbsp;</td>
            <td>
            &nbsp;</td>

            </tr>
            <tr>
                <td class="style34" >
                    &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
                    <td class="style35">
                        用户名：</td>
                    <td>
                        &nbsp;</td>
                    <td>
                    &nbsp;</td>
                    
            </tr>
            <tr>
                <td class="style34" >
                    &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
                    <td class="style35">
                        <asp:TextBox ID="TextBox1" runat="server" Width="208px" ></asp:TextBox>
                </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="检查用户" />
                </td>
                    <td>
                        &nbsp;</td>
                    
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                    <td class="style36">
                        &nbsp;</td>
                    <td class="style35">
                        问题一：您母亲的生日是？</td>
                    <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                     &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
                    <td class="style35">
                        <asp:TextBox ID="TextBox3" runat="server"  
                            Width="208px"></asp:TextBox>
                </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="例如：1988/08/08"></asp:Label>
                </td>
                    <td>
                    &nbsp;</td>
                    
            </tr>
            <tr>
                <td class="style34">
                     &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
                    <td class="style35">
                        问题二：您父亲的生日是？</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    
            </tr>
            <tr>
                <td class="style34">
                     &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
                    <td class="style35">
                        <asp:TextBox ID="TextBox4" runat="server" Width="208px"></asp:TextBox>
                </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="例如：1988/08/12"></asp:Label>
                </td>
                    <td>
                        &nbsp;</td>
                    
            </tr>
            <tr>
                <td class="style34">
                     &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
                    <td class="style35">
                        问题三：您的家乡是？</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    
            </tr>
            <tr>
                <td class="style34">
                     &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
                    <td class="style35">
                        <asp:TextBox ID="TextBox5" runat="server" Width="208px"></asp:TextBox>
                </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    
            </tr>
            <tr>
                <td class="style34">
                     &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
                    <td class="style35" align="center">
                        <asp:Button ID="Button1" runat="server"  Text="下一步" onclick="Button1_Click" 
                            style="height: 26px" />
                </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    
            </tr>
            <tr>
                <td class="style34">
                     &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
                    <td class="style35">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    
            </tr>
            <tr>
                <td class="style34">
                     &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
                    <td class="style35">
                        <asp:Panel ID="Panel1" runat="server" Height="104px" Visible="False">
                            <asp:Label ID="Label4" runat="server" Text="新密码："></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox6" runat="server" TextMode="Password" Width="97px"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label5" runat="server" Text="确认新密码："></asp:Label>
                            <asp:TextBox ID="TextBox7" runat="server" TextMode="Password" Width="97px"></asp:TextBox>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="登录" />
                        </asp:Panel>
                </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    
            </tr>
            <tr>
                <td class="style34">
                     &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
                    <td class="style35">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    
            </tr>
            <tr>
                <td class="style34">
                    &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                     &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                     &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                    &nbsp;</td>
                <td class="style36">
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
