<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AllPower.Web.Admin.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>全能后台管理</title>

<link href="css/login.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/validationEngine.jquery.css" type="text/css"/>
	<link rel="stylesheet" href="css/template.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/easyui.css" />
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="js/jquery.validationEngine-en.js" type="text/javascript" charset="gb2312">
	</script>
	<script src="js/jquery.validationEngine.js" type="text/javascript" charset="gb2312">
	</script>

	<script type="text/javascript">
	    jQuery(document).ready(function () {
	        // binds form submission and fields to the validation engine
	        jQuery("#form").validationEngine();
	    });
	    function checkCodeRegOrrder() {
	        document.getElementById("txtValidate").value = "";
	        newCheckCodeReg(document.getElementById('vCode'));
	    }
	    function newCheckCodeReg(control) {
	        var timenow = new Date().getTime();
	        url = "VerificationCode.aspx";
	        url = url + "?t=" + timenow;
	        control.src = url;
	    }
	</script>

<script type="text/javascript" src="../sysadmin/js/jquery.ui.form.select.js"></script>
<script type="text/javascript" src="../sysadmin/js/public.js"></script>
<link href="../sysadmin/css/dialog.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../sysadmin/js/jquery.dialog.js"></script>
<script type="text/javascript" src="../sysadmin/js/win.js"></script>
<script type="text/javascript">
    function check(o) {
        var id = o.id;
        if (id == "username") {
            document.getElementById(id).value = "";
        }
        if (id == "password") {
            document.getElementById(id).value = "";
        }
        if (id == "showRegExp") {
            document.getElementById(id).value = "";
        }
    }
    function out(o) {
        var id = o.id;
        var val = document.getElementById(id).value;
        if (!val) {

            if (id == "username") {
                document.getElementById(id).value = "用户名";
            }
            if (id == "password") {
                document.getElementById(id).value = "密码";
            }
            if (id == "showRegExp") {
                document.getElementById(id).value = "验证码";
            }
        }
    }
</script>
<script type="text/javascript">
    if (top.location != self.location) {
        top.location = self.location;
    }
</script>
</head>
<body id="bgcolor">
<form id="form" runat="server">
<%--<div class="slogoinContainer">
<div class="loginLayer">
<p>
<asp:dropdownlist id="DDLSite" runat="server" CssClass="carteselect"></asp:dropdownlist>
</p>
<p>用户名：<asp:textbox id="AccountName" CssClass="showInput" runat="server" tabindex="1" onfocus="check(this)" onblur="out(this)"></asp:textbox></p>
<p>密　码：<asp:textbox id="AccountPwd" CssClass="showInput" runat="server" textmode="Password" tabindex="2" onfocus="check(this)" onblur="out(this)"></asp:textbox></p>
<p id="przm" runat="server">认证码：<asp:textbox id="txtRZM" CssClass="showInput" runat="server" textmode="Password" tabindex="3" onfocus="check(this)" onblur="out(this)"></asp:textbox></p>
<p id="pyzm" runat="server"><dl><dt>验证码：<asp:textbox id="txtValidate" CssClass="showRegExp" runat="server" tabindex="4" onfocus="check(this)" onblur="out(this)"></asp:textbox></dt><dd>
    <img src="ValidateCode.aspx"  alt="看不清楚？点击刷新验证码！" 
        style="cursor:pointer; left: 0px;" 
        onclick="src='ValidateCode.aspx?s='+Math.random()" width="53" alt="图形验证码" /></dd></dl></p>
<p><asp:checkbox id="SaveLoginInfo" runat="server" tabindex="4" CssClass="check" Text="记住用户名" /><asp:ImageButton ID="btnLogin" ImageUrl="../sysadmin/img/loginsub.png" runat="server" CssClass="loginsubmit" tabindex="5" onclick="btnLogin_Click" /></p>
</div>

</div>--%>



 <div id="content" style="width:819px; margin:0 auto;">
<div class="login_tit"><img src="images/login01.jpg" width="819" height="274" />
<div style="position:absolute; font-size:21px; color:#fff; margin-top:-105px;  padding-left:200px; font-weight:bold;">欢迎登录全能(OA+CRM+ERP)后台管理系统</div>
<div style="position:absolute; font-size:12px; color:#f2f2f2; margin-top:-75px;  padding-left:285px; ">请您输入您的管理帐号及密码，登录系统！</div>
</div>
<div style=" position:absolute; width:810px; text-align:center; margin-top:-30px;"> 
<asp:dropdownlist id="DDLSite" runat="server" CssClass="carteselect"></asp:dropdownlist>
    </div>
<div class="input_box">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="46%" align="right">用户编号</td>
      <td colspan="2">
      <asp:TextBox ID="AccountName" runat="server" class="validate[required] text-input" style="width:190px; height:24px; line-height:24px; padding-left:9px; background:url(images/user.gif) no-repeat; border:0px;" title="请输入编号"  MaxLength="10" tabindex="1" data-prompt-position="topRight:-10"></asp:TextBox>
                                 </td>
    </tr>
    <tr>
      <td align="right">用户密码</td>
      <td colspan="2"><asp:TextBox ID="AccountPwd" runat="server" class="validate[requiredd] text-input" style="width:190px; height:24px; line-height:24px; padding-left:9px; background:url(images/password.gif) no-repeat; border:0;" title="请输入密码" tabindex="2" MaxLength="15" TextMode="Password" data-prompt-position="bottomRight:-20 8"></asp:TextBox>
      </td>
    </tr>
    <tr id="przm" runat="server">
    <td align="right">
    认证码</td><td  style="width:70px;">
<asp:TextBox id="txtRZM"  MaxLength="6" style="width:60px; height:24px; line-height:24px; padding-left:9px; background:url(images/VCode.gif) no-repeat; border:0px;" runat="server" tabindex="3"  Width="50px" ></asp:TextBox></td><td colspan="2">
    </td>
    </tr>
        <tr id="pyzm" runat="server">
    <td align="right">
    验证码</td><td  style="width:70px;">
<asp:TextBox id="txtValidate"  class="validate[requireddd] text-input" MaxLength="6" style="width:60px; height:24px; line-height:24px; padding-left:9px; background:url(images/VCode.gif) no-repeat; border:0px;" runat="server" tabindex="3"  Width="50px" ></asp:TextBox></td><td colspan="2">
    <img id="Img1" src="ValidateCode.aspx"  alt="看不清楚？点击刷新验证码！" 
        style="cursor:pointer; float:left; margin-left:-10px;" 
        onclick="checkCodeRegOrrder()" width="80"  height="32" />
        &nbsp;<a href="#" onclick="checkCodeRegOrrder()">换一张?</a>
    </td>
    </tr>
    <tr>
      <td align="right">
      <asp:checkbox id="SaveLoginInfo" runat="server" tabindex="4" CssClass="check" Text="记住用户名" />
      </td>
      <td width="2%" height="60"><asp:Button ID="btnLogin" runat="server" class="bt1"  onclick="btnLogin_Click"  /></td>
      <td width="12%"><button class="bt2" onclick="window.close();">取消</button></td>
      <td width="40%">
      </td>
    </tr>
    <tr><td colspan="3"></td></tr>
  </table>
</div>
<div class="login_bom"><p style="line-height:15px; height:15px; padding-top:30px;color:#fff;"><a href="#" style="color:#fff">####</a> | <a href="#" style="color:#fff">#####</a> | <a href="#" style="color:#fff">#####</a> | <a href="#" style="color:#fff">#####</a>  </p><p style="line-height:15px; height:15px; padding-top:5px;"> #########</p><%--<p style="line-height:15px; height:15px; padding-top:5px;padding-left:340px;">服务网站：<a href="www.dijing.com" style="color:#fff">www.dijing.com</a></p>--%><%--<p style="line-height:15px; height:15px; padding-top:5px;padding-left:340px;">版权所有：迪晶公司</p>--%></div>
</div>



<%--<div class="slogoinContainer">
<div class="loginLayer">
<p>
<asp:dropdownlist id="DDLSite" runat="server" CssClass="carteselect"></asp:dropdownlist>
</p>
<p>用户名：<asp:textbox id="AccountName" CssClass="showInput" runat="server" tabindex="1" onfocus="check(this)" onblur="out(this)"></asp:textbox></p>
<p>密　码：<asp:textbox id="AccountPwd" CssClass="showInput" runat="server" textmode="Password" tabindex="2" onfocus="check(this)" onblur="out(this)"></asp:textbox></p>
<p id="przm" runat="server">认证码：<asp:textbox id="txtRZM" CssClass="showInput" runat="server" textmode="Password" tabindex="3" onfocus="check(this)" onblur="out(this)"></asp:textbox></p>
<p id="pyzm" runat="server"><dl><dt>验证码：<asp:textbox id="txtValidate" CssClass="showRegExp" runat="server" tabindex="4" onfocus="check(this)" onblur="out(this)"></asp:textbox></dt><dd>
    <img src="ValidateCode.aspx"  alt="看不清楚？点击刷新验证码！" 
        style="cursor:pointer; left: 0px;" 
        onclick="src='ValidateCode.aspx?s='+Math.random()" width="53" alt="图形验证码" /></dd></dl></p>
<p><asp:checkbox id="SaveLoginInfo" runat="server" tabindex="4" CssClass="check" Text="记住用户名" /><asp:ImageButton ID="btnLogin" ImageUrl="../sysadmin/img/loginsub.png" runat="server" CssClass="loginsubmit" tabindex="5" onclick="btnLogin_Click" /></p>
</div>

</div>--%>
</form>
</body>
</html>
