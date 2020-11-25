<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>著名旅游管理系统</title>
<style>
* { margin:0 auto; padding:0; border:0;}
body { background:#0462A5; font:12px "宋体"; color:#004C7E;}
input { border:1px solid #004C7E;}
.main { background:url(images/bg.jpg) repeat-x; height:800px;}
.login { background:#DDF1FE; width:468px; height:262px; border:1px solid #000;}
.top { background:url(images/login_bg.jpg) repeat-x; width:464px; height:113px; border:1px solid #2376B1; margin-top:1px;}
.logo { background:url(images/logo.gif) no-repeat; width:214px; height:42px; float:left; margin:29px 0 0 14px;}
.lable { background:url(images/lable.gif) no-repeat; width:157px; height:32px; float:right; margin:81px 31px 0 0;}
.submit { background:url(images/submit.gif) no-repeat; width:71px; height:24px; border:0;} 
.reset { background:url(images/reset.gif) no-repeat; width:71px; height:24px; border:0;} 
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <table width="100%" class="main" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <div class="login">
        <div class="top">
          <div class="logo" style="width: 420px"><div style="font-family:宋体; color:#FFFFFF; filter:Glow(Color=#000000,Strength=2); WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 19pt; margin-top:5pt">
                  <div align="center" class="STYLE5">著名旅游管理系统</div>
              </div></div>
        </div>
        <table width="468" cellpadding="0" cellspacing="0">
          <tr>
            <td width="100%" >
              <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="216" height="27" align="right">用户名:</td>
                  <td align="left" width="248">
                      &nbsp;<asp:TextBox ID="TextBox1" runat="server" style="width:120px; height:19px; border:solid 1px #000000; color:#666666"></asp:TextBox></td>
                </tr>
                <tr>
                  <td height="27" align="right">密码:</td>
                  <td align="left" width="248">
                      &nbsp;<asp:TextBox ID="TextBox2" runat="server" TextMode="Password" style=" width:120px; height:19px; border:solid 1px #000000; color:#666666"></asp:TextBox></td>
                </tr>
                <tr style="display:none">
                  <td height="27" align="right">权限:</td>
                  <td align="left" width="248">
                      &nbsp;<asp:DropDownList ID="cx" runat="server" style="width:120px; height:19px; border:solid 1px #000000; color:#666666">
                      </asp:DropDownList></td>
                </tr>
                <tr>
                  <td height="27" colspan="2" align="center">
                      <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="登陆" />
                      <input id="Reset1" type="reset" value="重置" /></td>
                </tr>
            </table>
            </td>
          </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" style="margin-top:28px;">
          <tr>
            <td align="center";>Conpyright <%=DateTime.Now.Date.Year.ToString().Trim() %> 旅游管理系统</td>
          </tr>
        </table>
      </div>
      <!--login -->
    </td>
  </tr>
</table>

    
    </div>
    </form>
</body>
</html>
