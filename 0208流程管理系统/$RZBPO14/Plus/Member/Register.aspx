<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AllPower.WEB.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
   
<link href="../../../SysAdmin/css/dialog.css" rel="stylesheet" type="text/css" />
<link href="../../../SysAdmin/CSS/validationEngine.css" rel="stylesheet" type="text/css" />
<script src="../../../SysAdmin/JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>
<script src="../../../SysAdmin/JS/jquery-3.2.min.js" type="text/javascript"></script>
<script src="../../../SysAdmin/JS/Common.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../SysAdmin/js/<%=Resources.Common.formValidationLanguage %>"></script>
<script src="../../../SysAdmin/JS/jquery-validationEngine.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../SysAdmin/js/jquery.dialog.js"></script>
<script type="text/javascript" src="../../../SysAdmin/js/win.js"></script>
<script type="text/javascript" src="../../../SysAdmin/js/Province.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#theForm").validationEngine({ promptPosition: "centerRight" });

            });            
    </script>    
    
   
    
<link href="../../../SysAdmin/CSS/login.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
     body
    {
        background: none repeat scroll 0 0 #FFFFFF;
        color: #333333;
        font-family: tahoma,宋体,serif;
        font-size: 12px;
        line-height: 1.8;
        
    }
        .style1
        {
            height: 77px;
        }
        .style2
        {
            height: 48px;
            width: 172px;
        }
        .style3
        {
            height: 47px;
        }
        .style7
        {
            width: 130px;
        }
        .style8
        {
            height: 48px;
            width: 110px;
        }
        .style9
        {
            height: 47px;
            width: 110px;
        }
        .style13
        {
            width: 130px;
            height: 57px;
        }
        .style14
        {
            height: 57px;
            width: 110px;
        }
        .style15
        {
            height: 57px;
            width: 172px;
        }
        .style16
        {
            width: 130px;
            height: 56px;
        }
        .style17
        {
            height: 56px;
            width: 110px;
        }
        .style18
        {
            height: 56px;
            width: 172px;
        }
        .style19
        {
            width: 172px;
        }
        .style20
        {
            height: 27px;
        }
    </style>
    
</head> 
<body>
    <form id="theForm" runat="server" defaultbutton="btnregest">
    <div style=" background-color:White">
    <table style="height: 589px; width: 789px; margin:0 auto;"><tr><td colspan="4" class="style1"> <img src="../../../SysAdmin/Images/hqblogo.png" /></td></tr>
    <tr><td class="style7"></td><td class="style8">
        <asp:Label ID="Label1" runat="server" Font-Size="Small" Text="电子邮件"></asp:Label></td>
        <td class="style2">
            <asp:TextBox ID="txtemail" runat="server"  CssClass="validate[required,custom[email]]" Width="120px"></asp:TextBox></td><td>
            <asp:Label ID="lblEmalVel" runat="server" Text="该邮箱已存在" ForeColor="Red"></asp:Label>
        </td></tr>
            <tr><td class="style7"></td><td class="style9">
                <asp:Label ID="lblusn" runat="server" Font-Size="Small" Text="用户名"></asp:Label></td>
                <td class="style19">
                    <asp:TextBox ID="txtusn" runat="server" CssClass="validate[required,length[3,20]]" Width="120px"></asp:TextBox></td>
                <td class="style3">
                    <asp:Label ID="lblUsnVel" runat="server" Text="该用户名已被注册" ForeColor="Red"></asp:Label>
                </td></tr>
            <tr><td class="style13"></td><td class="style14">
                <asp:Label ID="Label2" runat="server" Font-Size="Small" Text="登录密码"></asp:Label></td>
                <td class="style15">
                    <asp:TextBox ID="txtpwd" runat="server" CssClass="validate[required,length[6,16]]" TextMode="Password" Width="120px"></asp:TextBox></td><td>
                    &nbsp;</td>
                </tr>
                <tr><td class="style16"></td><td class="style17">
                    <asp:Label ID="Label3" runat="server"  Font-Size="Small" Text="确认密码" Width="120px" ></asp:Label></td>
                    <td class="style18">
                        <asp:TextBox ID="txtpwdt" runat="server" CssClass="validate[required,confirm[txtpwd]]"  TextMode="Password" Width="120px"></asp:TextBox></td><td>
                        
                    </td>
                    </tr>
                    <tr><td class="style13"></td>
                        <td class="style14">
                            <asp:Label ID="Label5" runat="server" Font-Size="Small" Text="验证码"></asp:Label></td>
                           <td colspan="" class="style15">
                               <asp:TextBox ID="txtseds"  runat="server" 
                                   Width="120px"></asp:TextBox>
                               <asp:ImageButton ID="ImageButton1" runat="server" 
                                   ImageUrl="~/SysAdmin/ValidateCode.aspx" />
                             
                        </td> <td>
                            <asp:Label ID="lblVel" runat="server" Text="验证码输入错误" ForeColor="Red"></asp:Label>
                        </td>
                        </tr>
                        
                        <tr>
                          <td colspan="4" align="center"><asp:Button ID="btnregest" runat="server" 
                                  Text="同意以下协议，提交注册" onclick="btnregest_Click" />  </tr>
                          <tr><td colspan="4" align="center">
                              <asp:TextBox ID="TextBox2" runat="server" Height="88px" TextMode="MultiLine" 
                                  Width="536px"> 一、本服务协议双方为深圳市华强北在线商务有限公司（下称“华强北在线”）与华强北在线网用户，本服务协议具有合同效力。

本服务协议内容包括协议正文及所有华强北在线已经发布的或将来可能发布的各类规则。所有规则为协议不可分割的一部分，与协议正文具有同等法律效力。 
　　在本服务协议中没有以“规则”字样表示的链接文字所指示的文件不属于本服务协议的组成部分，而是其它内容的协议或有关参考数据，与本协议没有法律上的直接关系。 
　　用户在使用华强北在线提供的各项服务的同时，承诺接受并遵守各项相关规则的规定。华强北在线有权根据需要不时地制定、修改本协议或各类规则，如本协议
有任何变更，华强北在线将在网站上刊载公告，通知予用户。如用户不同意相关变更，必须停止使用“服务”。经修订的协议一经在华强北在线网公布后，立即自动
生效。各类规则会在发布后生效，亦成为本协议的一部分。登录或继续使用“服务”将表示用户接受经修订的协议。除另行明确声明外，任何使“服务”范围扩大或
功能增强的新内容均受本协议约束。 
　　用户确认本服务协议后，本服务协议即在用户和华强北在线之间产生法律效力。请用户务必在注册之前认真阅读全部服务协议内容，如有任何疑问，可向华强北
在线咨询。 
1)无论用户事实上是否在注册之前认真阅读了本服务协议，只要用户点击协议正本下方的“确认”按钮并按照华强北在线注册程序成功注册为用户，用户的行为仍
然表示其同意并签署了本服务协议。 2)本协议不涉及用户与华强北在线其它用户之间因网上交易而产生的法律关系及法律纠纷。</asp:TextBox>
                          </td></tr>
                          <tr><td colspan="4" class="style20"></td></tr>
                          <tr><td colspan="4" style="background:url(../../../SysAdmin/Images/UserManager/foot.png); font-size:14px; text-align:center;">华强北在线首页  |  关于我们  |  联系我们  |  公司动态  |  招聘岗位 |  招商热线：0755-83278888</td></tr>
                          <tr><td colspan="4" style=" font-size:12px; text-align:center;">2010-2015 深圳市华强北在线商务有限公司(360hqb.com)版权所有 粤ICP证10096890号<br />
&nbsp;本站所有内容，未经许可均不得转载，违者将追究法律责任！</td></tr>
            </table>
    </div>
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
