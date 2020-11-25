<%@ page language="C#" autoeventwireup="true" inherits="luntan, App_Web_ulcy8i0g" %>

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
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"           CellPadding="3" Font-Size="9pt"  BackColor="White" BorderColor="#CCCCCC"  
                        BorderStyle="None" BorderWidth="1px" AllowPaging="True" 
                        onpageindexchanging="GridView1_PageIndexChanging1" PageSize="6" Width="873px">
           <FooterStyle BackColor="White" ForeColor="#000066" />
        <Columns>
             <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
             </asp:TemplateField>
             <asp:BoundField DataField="jinghua" HeaderText="jinghua" />
             <asp:BoundField DataField="id" HeaderText="id" SortExpression="家庭住址"/>        
             <asp:HyperLinkField DataNavigateUrlFields="id" 
                 DataNavigateUrlFormatString="tiezidetail.aspx?id={0}" DataTextField="title" 
                 HeaderText="title" />
             <asp:BoundField DataField="author" HeaderText="author" />
             <asp:BoundField DataField="fatiedate" HeaderText="fatiedate" />
        </Columns>
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
</asp:GridView>

                    <br />
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="删除" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="置为精华帖" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
    </form>
<table class="style35">
    <tr>
        <td bgcolor="#0099FF">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            鄂ICP备07017567 Copyright @ 2011新闻网 All Rights Reserved <a href="admlogin.aspx" 
                style="color: #FF0000">[管理入口]</a>
        </td>
    </tr>
</table>
</body>
</html>
