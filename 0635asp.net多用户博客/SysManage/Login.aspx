<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="SysManage_Login" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>个人博客系统[毕业设计]</title>
<style type="text/css"> body{ background:url(../images/bg.jpg) repeat-x;}
.install_box { BACKGROUND:url(../images/cpzs_bg.jpg) repeat;COLOR: #2d7e17; }
	TD { FONT-SIZE: 12px; FONT-FAMILY: Verdana, Geneva, Arial, Helvetica, sans-serif }
</style>
</head>
<body style="">
<form id="form1" runat="server">

<table cellSpacing="0" cellPadding="0" width="950" align="center" border="0">
<tr>
<td align="center">
<img src="../images/logo.jpg" />
</td>
</tr>
<tr>
<td style="background:#c7d78c;height:5px; font-size:0;">
&nbsp;
</td>
</tr>
</table>

<TABLE class="tableborder" cellSpacing="1" cellPadding="0" width="252px" align="center" border="0">
				<TBODY>
					<TR>
						<TD>
							<DIV class="install_box">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr><td>&nbsp;</td></tr>
									<tr height="50">
										<td align="center">用户名: <input name="txt_user" type="text" style="WIDTH:92px" id="txt_user" runat="server"></td>
										
									</tr>
									<tr height="50">
										<td align="center">
											密&nbsp;&nbsp;&nbsp;码: <input name="txt_pwd" type="password" style="FONT-SIZE:12px;WIDTH:92px" id="txt_pwd" runat="server"></td>
										
									</tr>
									<tr height="50">
										<td align="center">
											<asp:Button ID="imbtnSubmit" CssClass="button" runat="server" Text=" 登录 " OnClick="imbtnSubmit_Click" />
												&nbsp;&nbsp;
											<input class="button" onClick="javascript:window.opener=null;window.close();" type="button" value=" 关闭 ">
										</td>
									</tr>
									<tr><td>&nbsp;</td></tr>
								</table>
								
								
							</DIV>
						</TD>
					</TR>
					<tr>
					<td align="center" style="color:#db0000;">
                        <asp:Literal ID="ltlMess" runat="server"></asp:Literal>
                    </td>
					</tr>
				</TBODY>
		    </TABLE>
        
    </form>
</body>
</html>