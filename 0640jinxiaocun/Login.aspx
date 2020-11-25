<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>欢迎使用进销存管理系统</title>
    <STYLE type=text/css>BODY {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-SIZE: 14px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; FONT-FAMILY: Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #7893ae
}
.bg {
	BACKGROUND: url(images/login_bg.jpg) #7893ae repeat-x left top; OVERFLOW: hidden; HEIGHT: 600px
}
#ckbAuCode {
	BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none
}
#lbtnAuCode {
	TEXT-DECORATION: none
}
.mid_bg {
	BACKGROUND: url(images/midd_bg.gif) no-repeat; MARGIN:50px auto 0px; WIDTH: 541px; POSITION: relative; HEIGHT: 535px
}
.login {
	LEFT: 150px; POSITION: absolute; TOP: 100px
}
.login INPUT {
	BORDER-RIGHT: #000 1px solid; BORDER-TOP: #000 1px solid; BORDER-LEFT: #000 1px solid; COLOR: #888; BORDER-BOTTOM: #000 1px solid; FONT-FAMILY: Verdana
}
.login_btn {
	BACKGROUND: url(images/login_btn.gif) no-repeat; MARGIN: 8px 0px 0px 50px; WIDTH: 94px; CURSOR: pointer; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; HEIGHT: 29px; BORDER-BOTTOM-STYLE: none
}
#lbtnDesktop {
	FLOAT: left; COLOR: white; HEIGHT: 12px
}
</STYLE>
</head>
<body>
    <form id="form1" runat="server">
<DIV class=bg>
<DIV class=mid_bg style="left: 0px; top: 0px">
<DIV class=login>
<DIV></DIV>
<TABLE cellSpacing=0 cellPadding=3 width=270 border=0>
  <TBODY>
  <TR id=userTR>
    <TD style="WIDTH: 65px; TEXT-ALIGN: right">用户名:</TD>
    <TD>
        <asp:TextBox ID="TxtUserName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtUserName"
            ErrorMessage="*"></asp:RequiredFieldValidator></TD></TR>
  <TR id=pwdTR>
    <TD style="WIDTH: 65px; TEXT-ALIGN: right">密&nbsp;&nbsp;&nbsp;&nbsp;码:</TD>
    <TD>
        <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtPassword"
            ErrorMessage="*"></asp:RequiredFieldValidator></TD></TR>
  <TR id=validateTR style="LINE-HEIGHT: 36px; HEIGHT: 36px">
    <TD style="WIDTH: 65px; TEXT-ALIGN: right">验证码:</TD>
    <TD>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD></TD>
          <TD>
              <asp:TextBox ID="txtValidCode" runat="server" Width="53px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtValidCode"
                  ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;<asp:Image ID="img" runat="server"
                      Height="23px" ImageUrl="~/ValidCode.aspx" Width="72px" /></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD>&nbsp;</TD>
    <TD>
      <TABLE>
        <TBODY>
        <TR>
          <TD><INPUT id=ibtnLogin 
            style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" 
           type=image 
            src="Images/login_btn.gif" name=ibtnLogin onserverclick="ibtnLogin_ServerClick" runat="server"> </TD>
          <TD>
        </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
</DIV></DIV>

</FORM>
</body>
</html>
