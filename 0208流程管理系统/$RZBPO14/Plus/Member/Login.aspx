<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" ValidateRequest="false"
    Inherits="AllPower.WEB.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<link href="../../../SysAdmin/CSS/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../../sysadmin/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../../../sysadmin/js/jquery.ui.form.select.js"></script>
<script type="text/javascript" src="../../../sysadmin/js/public.js"></script>
<link href="../../../sysadmin/css/dialog.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../../sysadmin/js/jquery.dialog.js"></script>
<script type="text/javascript" src="../../../sysadmin/js/win.js"></script>

      <script language="javascript" type="text/javascript">
          function usernamenull() {
              usnValidate = document.getElementById("txtusn");
              if (usnValidate.value == "") {
                  document.getElementById("lblusnnull").innerText = "用户名不能为空";
                  document.getElementById("lblusnnull").style.color = "red";
              } else {
              document.getElementById("lblusnnull").innerText = "";
               }
  }
  function passwordnull() {
      pwdValidate = document.getElementById("txtpwd");
      if (pwdValidate.value == "") {
          document.getElementById("lblpwdnull").innerText = "密码不能为空";
          document.getElementById("lblpwdnull").style.color = "red";
      } else {
      document.getElementById("lblpwdnull").innerText = "";
       }
   }

  
   </script>
   
<style type="text/css">
    body
    {
        background: none repeat scroll 0 0 #FFFFFF;
        color: #333333;
        font-family: tahoma,宋体,serif;
        font-size: 12px;
        line-height: 1.8;
        text-align: center;
    }
    .loginFrame .lgLst
    {
        margin-bottom: 10px;
    }
    .pdl48
    {
        text-align: center;
    }
    .lgIpt2
    {
        width: 100px;
    }
    .lgIpt, .lgIpt2
    {
        border-color: #707070 #CECECE #CECECE #707070;
        border-style: solid;
        border-width: 1px;
        font-family: tahoma;
        height: 22px;
        line-height: 22px;
        margin-right: 5px;
        text-align: left;
        vertical-align: middle;
        width: 190px;
    }
    #pdl481
    {
        text-align: center;
    }
    .cc
    {
    }
    .cc div
    {
        margin-top: 5px;
        height: 23px;
        width: 319px;
    }
    .style1
    {
    }
    </style>
</head>

<body id="nv_home">
    <form id="form1" runat="server" defaultbutton="ImageButton1">
    <div class="cc" style="background: url(../../../SysAdmin/Images/UserManager/hqb.jpg) no-repeat scroll right top transparent;height: 320px; padding-left: 31px; padding-top: 84px; width: 339px;
        margin: 0 auto;">
        <div class="lgLst">
        <table><tr><td class="style1"><asp:Label ID="lblusn" runat="server" Text="用户名："></asp:Label>  
        <asp:TextBox ID="txtusn" runat="server" onblur="usernamenull()" Width="127px"></asp:TextBox></td>
        <td> <asp:Label ID="lblusnnull" runat="server"></asp:Label></td></tr></table>
            
        </div>
        <div class="lgLst">
        <table><tr><td class="style1"> <asp:Label ID="lblpwd" runat="server" Text="密 码："></asp:Label>
         &nbsp;
         <asp:TextBox ID="txtpwd" runat="server" onblur="passwordnull()" 
                TextMode="Password" Width="127px"></asp:TextBox></td>
        <td> <asp:Label ID="lblpwdnull" runat="server"></asp:Label></td></tr></table>
         
           
        </div>
        <div class="lgLst">
            <label>
                <asp:CheckBox ID="chbusername" runat="server" Text="记住用户名" />
            </label>
        </div>
        <div class="lgLst">
        <table>
        <tr><td>   <asp:Label ID="lblyzm" runat="server" Text="验证码:"></asp:Label>
            &nbsp;
            <asp:TextBox ID="txtyzm" runat="server" Width1="80px" Width="89px"></asp:TextBox></td>
            <td><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="/SysAdmin/ValidateCode.aspx" /></td>
            <td>
                <asp:Label ID="lblVel" runat="server" Text="验证码输入错误"></asp:Label></td>
            </tr>
         
            
            </table>
        </div>
        <div style="height: 20px;">
        </div>
        <div id="pdl481">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/SysAdmin/Images/UserManager/2131234124124.jpg"
                OnClick="ImageButton1_Click" /> <a href="../Member/ForgetPwd.aspx">忘记密码</a>
        </div>
        <div style="height: 30px;">
        </div>
        <label>
            还没有华强北在线的账号？<a href="../Member/Register.aspx">立即注册</a></label>
           
    </div>
    </form>
    
    <script type="text/javascript"><%=jsMessage %></script>
</body>

</html>
