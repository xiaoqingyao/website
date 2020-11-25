<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <LINK 
rel=stylesheet type=text/css href="Images/linkey.css">
<STYLE>BODY {
	BACKGROUND-COLOR: #ffffff; FONT-SIZE: 9pt; leftmargin: 0; topmargin: 0; marginwidth: 0; marginheight: 0
}
.input {
	WIDTH: 1px; BORDER-TOP-WIDTH: 1px; HEIGHT: 1px
}
.mylogininput {
	BORDER-BOTTOM: #333333 1px solid; BORDER-LEFT: #333333 1px solid; WIDTH: 206px; HEIGHT: 29px; FONT-SIZE: 12pt; BORDER-TOP: #333333 1px solid; BORDER-RIGHT: #333333 1px solid
}
</STYLE>
</head>
<body>
    <form id="form1" runat="server">
    <div><TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" height="100%">
  <TBODY>
  <TR>
    <TD>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=953 align=center>
        <TBODY>
        <TR>
          <TD height=521 vAlign=top background=Images/OAlogin.jpg 
            width=953><TABLE border=0 cellSpacing=0 cellPadding=0 width=953 
            height=392>
              <TBODY>
              <TR>
                <TD height=130 width=593></TD>
                <TD height=130></TD></TR>
              <TR>
                <TD height=35 align="right">
                    登陆账号：</TD>
                <TD height=35><FONT color=red>
                  <DIV id=mydiv>
                      <asp:TextBox ID="TxtUserName" runat="server" Width="119px"></asp:TextBox></DIV></FONT></TD></TR>
              <TR>
                <TD height=26 align="right">
                    登录密码：</TD>
                <TD style="PADDING-TOP: 5px" height=26>
                    <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" Width="117px"></asp:TextBox></TD></TR>
              <TR>
                <TD align="right" style="height: 19px">
                    用户角色：</TD>
                <TD style="height: 19px">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="124px">
                        <asp:ListItem>管理员</asp:ListItem>
                        <asp:ListItem>普通用户</asp:ListItem>
                    </asp:DropDownList></TD></TR>
              <TR>
                <TD height=26 align="right">
                    验证码</TD>
                <TD height=26>
                    &nbsp;<asp:TextBox ID="txtyan" runat="server" Width="85px"></asp:TextBox><asp:Label
                        ID="lblyanzheng" runat="server" BackColor="DeepSkyBlue" ForeColor="#004000"></asp:Label></TD></TR>
              <TR>
                <TD height=20 align=right></TD>
                <TD height=20></TD></TR>
              <TR>
                <TD align=right style="height: 23px"></TD>
                <TD style="height: 23px"><LABEL> 
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Images/dl.jpg" OnClick="ImageButton1_Click" />&nbsp;
                    
                  
                    </LABEL>  <a href=Reg.aspx>用户注册</a></TD></TR>
              <TR>
                <TD height=23 align=right></TD>
                <TD height=23></TD></TR>
              <TR>
                <TD height=28 align=right></TD>
                <TD height=28></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
    
    </div>
    </form>
</body>
</html>
