<%@ page language="C#" autoeventwireup="true" inherits="luntan, App_Web_j0cvg-5f" %>

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
            width: 100%;
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
        <td colspan ="3">
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
                    欢迎到访</td>
                <td rowspan ="11">
        <asp:GridView ID="GridView1" runat="server" 
            AllowPaging="True" AutoGenerateColumns="False" GridLines="None" Height="120px" 
            onpageindexchanging="GridView1_PageIndexChanging" PageSize="6" Width="699px">
            <Columns>
                <asp:HyperLinkField DataTextField="jinghua" 
                    HeaderText="精华">
                    <HeaderStyle BackColor="#CCFFFF" />
                </asp:HyperLinkField>
                <asp:HyperLinkField DataNavigateUrlFields="id" 
                    DataNavigateUrlFormatString="tiezidetail.aspx?id={0}" DataTextField="title" 
                    HeaderText="帖子">
                    <FooterStyle ForeColor="#CCFFFF" />
                    <HeaderStyle BackColor="#CCFFFF" />
                </asp:HyperLinkField>
                <asp:HyperLinkField DataTextField="fatiedate" 
                    HeaderText="发帖时间">
                    <HeaderStyle BackColor="#CCFFFF" />
                </asp:HyperLinkField>
                <asp:HyperLinkField DataTextField="author" 
                    HeaderText="作者">
                    <HeaderStyle BackColor="#CCFFFF" />
                </asp:HyperLinkField>
                <asp:HyperLinkField DataTextField="cataname" HeaderText="分类">
                    <HeaderStyle BackColor="#CCFFFF" />
                </asp:HyperLinkField>
            </Columns>
        </asp:GridView>
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
                    
                   >
                    </td>
            </tr>
            <tr>
                <td class="style34" >
                    当前用户:<asp:Label ID="Label1" runat="server" Text="暂无"></asp:Label>
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
                     <a href =forgetpwd.aspx>密码找回</a></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                     <a href =information.aspx>个人信息</a></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style34">
                   <a href =  fatie.aspx>用户发帖</a></td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
<table class="style35">
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td bgcolor="#0099FF">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            鄂ICP备07017567 Copyright @ 2011新闻网 All Rights Reserved <a href="admlogin.aspx" 
                style="color: #FF0000">[管理入口]</a>
        </td>
    </tr>
</table>
    </form>
</body>
</html>
