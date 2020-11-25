<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>魏一宁个人网站系统-后台</title>
    <style type="text/css">
<!--
body {
	margin:0;
	padding:0;
	background-color: #3467B4;
	background-image: url(Img/bg.gif);
	background-repeat:repeat-x;
	line-height: 20px;
	color: #FFFFFF;
}
.box, .box2 {
	margin:0;
	padding:0;
	width:150px;
	height:20px;
	line-height:20px;
	border: 1px solid #006699;
	text-indent:3px;
}
.box{
	width:150px;
}
.box2{
	width:80px;
}
.new {
	font-size:12px;
}
.bbk {
	height:88px !important;
	height:69px;
}
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="263" valign="top"><br/>
      <br/>
        <br/>
        <br/>
        <br />
        <br />
        <br />
        <br/>
        <br />
        <div style="FONT-WEIGHT: bold; FONT-SIZE: 20pt; FILTER: Glow(Color=#00347F,Strength=4); WIDTH: 100%; COLOR: #ffffff; FONT-FAMILY: 黑体; HEIGHT: 53px">
            <br />
                魏一宁个人网站系统</div><br />
    </td>
    <td width="537"><br /><br /><br /><br /><table border="0" cellpadding="0" cellspacing="0" width="536">
  <tr>
   <td><img src="Img/spacer.gif" width="37" height="1" border="0" alt="" /></td>
   <td><img src="Img/spacer.gif" width="272" height="1" border="0" alt="" /></td>
   <td><img src="Img/spacer.gif" width="19" height="1" border="0" alt="" /></td>
   <td><img src="Img/spacer.gif" width="208" height="1" border="0" alt="" /></td>
   <td><img src="Img/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>

  <tr>
   <td colspan="3" style="height: 53px"><img name="admin_login_r1_c1" src="Img/admin_login_r1_c1.jpg" width="328" height="53" border="0" id="admin_login_r1_c1" alt="" /></td>
   <td rowspan="2">
       <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Img/admin_login_r1_c4.jpg" OnClick="ImageButton1_Click" /></td>
   <td style="height: 53px"><img src="spacer.gif" width="1" height="53" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="4"><img name="admin_login_r2_c1" src="Img/admin_login_r2_c1.jpg" width="37" height="359" border="0" id="admin_login_r2_c1" alt="" /></td>
   <td rowspan="2" style="background-image: url(Img/admin_login_r2_c2.jpg)">
       <br />
       <table border="0" cellpadding="3" cellspacing="0">
           <tr>
               <td >
                   用户名：</td>
               <td align="left" >
                   <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
           </tr>
           <tr>
               <td >
                   密 &nbsp;码：</td>
               <td align="left" >
                   <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox></td>
           </tr>
           <tr>
               <td colspan="2" align="center">
                   </td>
           </tr>
       </table>
   </td>
   <td rowspan="4"><img name="admin_login_r2_c3" src="Img/admin_login_r2_c3.jpg" width="19" height="359" border="0" id="admin_login_r2_c3" alt="" /></td>
   <td><img src="spacer.gif" width="1" height="114" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="2"><img name="admin_login_r3_c4" src="Img/admin_login_r3_c4.jpg" width="208" height="86" border="0" id="admin_login_r3_c4" alt="" /></td>
   <td><img src="spacer.gif" width="1" height="26" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="2"><img name="admin_login_r4_c2" src="Img/admin_login_r4_c2.jpg" width="272" height="219" border="0" id="admin_login_r4_c2" alt="" /></td>
   <td><img src="spacer.gif" width="1" height="60" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="admin_login_r5_c4" src="Img/admin_login_r5_c4.jpg" width="208" height="159" border="0" id="admin_login_r5_c4" alt="" /></td>
   <td><img src="spacer.gif" width="1" height="159" border="0" alt="" /></td>
  </tr>
</table></td>
  </tr>
</table>
    
    </div>
    </form>
</body>
</html>
