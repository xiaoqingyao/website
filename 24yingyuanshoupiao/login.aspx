<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>在线影院售票系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
.STYLE3 {font-size: 12px; color: #adc9d9; }
-->
</style>
</head>
<body style="background-color:#152753">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#1075b1">&nbsp;</td>
  </tr>
  <tr>
    <td height="608" background="images/login_03.gif" style="background-color: #152753"><table width="847" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="318" valign="bottom" background="images/login_04.gif"><table width="37%" height="57" border="0" align="center">
          <tr>
            <td><div style="font-family:宋体; color:#FFFFFF; filter:Glow(Color=#000000,Strength=2); WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 19pt; margin-top:5pt">
              <div align="center">影院在线售票系统</div>
            </div></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="84">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="381" height="84" background="images/login_06.gif">&nbsp;</td>
              <td width="162" valign="middle" background="images/login_07.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="44" height="24" valign="bottom"><div align="right" class="STYLE3">用户名</div></td>
                    <td width="10" valign="bottom">&nbsp;</td>
                    <td height="24" colspan="2" valign="bottom"><div align="left">
                        <asp:TextBox ID="TextBox1" runat="server" Width="88px"></asp:TextBox>&nbsp;</div></td>
                  </tr>
                  <tr>
                    <td height="24" valign="bottom"><div align="right"><span class="STYLE3">密码</span></div></td>
                    <td width="10" valign="bottom">&nbsp;</td>
                    <td height="24" colspan="2" valign="bottom">
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="88px"></asp:TextBox></td>
                  </tr>
                  <tr>
                    <td height="24" valign="bottom"><div align="right"><span class="STYLE3"></div></td>
                    <td width="10" valign="bottom">&nbsp;</td>
                    <td width="52" height="24" valign="bottom">&nbsp;</td>
                    <td width="62" valign="bottom">&nbsp;</td>
                  </tr>
                  <tr></tr>
              </table></td>
              <td width="26"><img src="images/login_08.gif" width="26" height="84"></td>
              <td width="67" background="images/login_09.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="25"><div align="center">
                      <input type="image" name="imageField" src="images/dl.gif" id="Image1" runat=server onserverclick="Image1_ServerClick">
                    </div></td>
                  </tr>
                  <tr>
                    <td height="25"><div align="center"><a href="login.aspx"><img src="images/cz.gif" width="57" height="20" border="0"></a></div></td>
                  </tr>
              </table></td>
              <td width="211" background="images/login_10.gif"></td>
            </tr>
          </table>
                
        </td>
      </tr>
      <tr>
        <td height="206" background="images/login_11.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#152753">&nbsp;</td>
  </tr>
</table>
    
    </div>
    </form>
</body>
</html>
