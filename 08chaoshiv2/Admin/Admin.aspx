<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
    <style type="text/css">
.editor_select {FONT: 9pt Verdana,Arial}
.editor_select {FONT: 9pt Verdana,Arial}
.outcolor{border:1px double;border-color:#dddddd #dddddd #dddddd #dddddd;cursor:pointer;background:#efefef}
.outcolor{border:1px double;border-color:#dddddd #dddddd #dddddd #dddddd;cursor:pointer;background:#efefef}
.editor_switcher_nohighlight {
 BACKGROUND: #FFFFFF; MARGIN-LEFT: 2px; VERTICAL-ALIGN: top;BORDER: #CCCCCC 1px solid; BORDER-TOP: none; TOP: 0px
}
.editor_switcher_nohighlight {
 BACKGROUND: #FFFFFF; MARGIN-LEFT: 2px; VERTICAL-ALIGN: top;BORDER: #CCCCCC 1px solid; BORDER-TOP: none; TOP: 0px
}
.editor_switcher_highlight {
 BACKGROUND:#EFEFEF; MARGIN-LEFT: 2px; VERTICAL-ALIGN:top; BORDER:#CCCCCC 1px solid;BORDER-TOP: none; TOP: 0px
}
.editor_switcher_highlight {
 BACKGROUND:#EFEFEF; MARGIN-LEFT: 2px; VERTICAL-ALIGN:top; BORDER:#CCCCCC 1px solid;BORDER-TOP: none; TOP: 0px
}
    </style>
    <script type="text/javascript" src=RL.js></script>
</head>
<body style="font-size: 12pt">
    <form id="form1" runat="server">
    <div>
    
			<table cellSpacing="0" borderColorDark="#9cc7ef" cellPadding="4" width="60%" align="center"
				borderColorLight="#145aa0" border="1">
				<tr bgColor="#4296e7">
					<td colSpan="2">
						<div align="center"><font color="#ffffff"><span><span style="mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman';
                                mso-bidi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US;
                                mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA"><span style="mso-hansi-font-family: 'Times New Roman'; mso-bidi-font-family: 'Times New Roman';
                                    mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN;
                                    mso-bidi-language: AR-SA"><span style="mso-ascii-font-family: 'Times New Roman';
                                        mso-hansi-font-family: 'Times New Roman'; mso-bidi-font-family: 'Times New Roman';
                                        mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN;
                                        mso-bidi-language: AR-SA; mso-bidi-font-size: 12.0pt; "><span style="color: #000000; font-family: 宋体">
                                            <strong>用户管理</strong></span></span></span></span></span></font></div>
					</td>
				</tr>
				<tr style="font-family: Times New Roman; font-size: 12pt;">
					<td noWrap width="30" style="WIDTH: 164px; height: 34px;">
                        <FONT face="宋体">用户名:</FONT>
					</td>
					<td width="79%" style="height: 34px">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="用户名不能为空"></asp:RequiredFieldValidator></td>
				</tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td nowrap="nowrap" style="width: 164px" width="30">
                        密码：</td>
                    <td width="79%">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                            ErrorMessage="密码不能为空"></asp:RequiredFieldValidator></td>
                </tr>
				<tr style="font-size: 12pt">
					<td noWrap width="164" style="WIDTH: 164px; height: 23px;">
						<div align="right">&nbsp;</div>
					</td>
					<td width="59%" style="height: 23px">&nbsp;
						<asp:button id="Button1" runat="server" Text="确定" onclick="Button1_Click"></asp:button><FONT face="宋体">&nbsp;</FONT>
						<asp:button id="Button2" runat="server" Text="重填" onclick="Button2_Click"></asp:button></td>
				</tr>
				<tr style="font-size: 12pt">
					<td colSpan="2">
						<div align="center"></div>
					</td>
				</tr>
				<tr bgColor="#4296e7" style="font-size: 12pt">
					<td colSpan="2" style="height: 29px">&nbsp;</td>
				</tr>
			</table>
    
    </div>
    </form>
</body>
</html>
