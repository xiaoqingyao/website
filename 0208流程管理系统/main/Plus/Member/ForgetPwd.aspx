<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPwd.aspx.cs" Inherits="AllPower.WEB.main.Plus.Member.ForgetPwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
    
 <%--   <script type="text/javascript">
        function sendemail() {
            alert({ msg: '您的申请已提交成功，请到邮箱激活本次操作！', title: '提示信息' })
        }

        function corlogin() {
            alertClose({ msg: '激活成功，请使用新密码重新登录', title: '提示信息' }, function() { window.location.href = 'Login.aspx' })
        }

        function modfierr() {
            alert({ msg: '修改失败', title: '提示信息' })
        }
    </script>--%>
    
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
 
    
        .style2
        {
            height: 44px;
        }
        .style3
        {
            width: 214px;
            text-align: right;
        }
        .style4
        {
            width: 254px;
        }
        .style5
        {
            width: 269px;
        }
        .style6
        {
            height: 71px;
        }
         td
        {
           font-style:inherit; 
           font-size:small;  
           height:50px;
         }
        .style16
        {
            width: 214px;
            text-align: right;
            height: 25px;
        }
        .style17
        {
            width: 254px;
            height: 25px;
        }
        .style18
        {
            width: 269px;
            height: 25px;
        }
        .style19
        {
            width: 214px;
            text-align: right;
            height: 35px;
        }
        .style20
        {
            width: 254px;
            height: 35px;
        }
        .style21
        {
            width: 269px;
            height: 35px;
        }
        .style22
        {
            width: 214px;
            text-align: right;
            height: 48px;
        }
        .style23
        {
            width: 254px;
            height: 48px;
        }
        .style24
        {
            width: 269px;
            height: 48px;
        }
    </style>
    
</head>
<body>
    <form id="theForm" runat="server">
    <div style=" border-width:medium; border-color:White; width:600px; height:300px;" >
    <table align="center" cellpadding="0" cellspacing="0">
    <tr><td colspan="3" class="style6"><img src="../../../SysAdmin/Images/hqblogo.png" /></td></tr>
        <tr>
            <td class="style2"  colspan="3">
                &nbsp;找回登录密码&nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                您的Email地址：</td>
            <td class="style20">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="validate[required,custom[email]]" style="margin-left: 0px" 
                    Width="164px" Height="23px"></asp:TextBox>
                <br />
            </td>
            <td class="style21">
                您注册时填写的Email地址</td>
        </tr>
        <tr>
            <td colspan="3" class="style16"></td>
        </tr>
        <tr>
            <td class="style19">
                您的昵称：</td>
            <td class="style20">
                <asp:TextBox ID="txtUsn" runat="server"  CssClass="validate[required,length[3,20]]"  Width="164px" 
                    Height="24px"></asp:TextBox>
                <br />
            </td>
            <td class="style21">
                您注册时填写的昵称</td>
        </tr>
        <tr>
            <td colspan="3" class="style16"></td>
      
        </tr>
        <tr>
            <td class="style19">
                新密码：</td>
            <td class="style20">
                <asp:TextBox ID="txtNewpwd" runat="server" CssClass="validate[required,length[6,16]]" Width="164px" 
                    TextMode="Password" Height="24px"></asp:TextBox>
                <br />
            </td>
            <td class="style21">
                您的新登录密码</td>
        </tr>
        <tr>
            <td class="style16">
                </td>
            <td class="style17">
                &nbsp;</td>
            <td class="style18">
                </td>
        </tr>
        <tr>
            <td class="style22">
                确认密码：</td>
            <td class="style23">
                <asp:TextBox ID="txtPwd" runat="server" Width="164px" CssClass="validate[required,confirm[txtNewpwd]]" TextMode="Password" 
                    Height="24px"></asp:TextBox>
                <br />
 
            </td>
            <td class="style24">
                再次输入上面的密码</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;验证码：&nbsp;</td>
            <td class="style20">
                <asp:TextBox ID="txtVel" runat="server"  Width="98px" 
                    Height="24px"></asp:TextBox><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="/SysAdmin/ValidateCode.aspx" />
                <br />
            </td>
            <td class="style21">
                </td>
        </tr>
        <tr>
            <td class="style16">
                </td>
            <td style=" color:Red;" class="style17">
                <asp:Label ID="lblVel" runat="server" Text="验证码输入错误"></asp:Label>
                &nbsp;
                <asp:Label ID="lblEmalUsn" runat="server" Text="用户名和邮箱不匹配"></asp:Label>
            </td>
            <td class="style18">
                </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:Button ID="BtnFindPwd" runat="server" Text="确认提交" 
                    onclick="BtnFindPwd_Click" style="height: 26px" />
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </td>
            <td class="style5">
                &nbsp;</td>
        </tr>
        </table>
        </div>
        
    </form>
    <script type="text/javascript" ><%=jsMessage %></script>
</body>
</html>
