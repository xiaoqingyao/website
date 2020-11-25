<%@ Page language="c#" src="lwlrtj.aspx.cs" AutoEventWireup="false" Inherits="class_lwtjxt.lwlrtj" %>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<html>
<head>
<title>在线毕业论文提交系统-论文正文提交</title>
</head>
<body>
<Top:myTop runat="server"/>
<TABLE borderColor=#2979C6 cellSpacing=0 cellPadding=1 width=760  align="center" border=0>
    <TR><TD bgColor=#2979C6 height=23  class=p9><FONT  color=#ffffff >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二步:论文正文提交</FONT><FONT color=#cc3300>(请将论文的正文部分粘贴到下面的文本框中，并提交!):</FONT></TD></TR>
    <TR align="center"><TD bgColor=#2979C6>
      <FORM  method=post runat="server">
        <TABLE  cellSpacing=1 cellPadding=0 width=758 bgColor=#f5fafd align="center" border=0>
           <TR align="center"><TD><asp:TextBox id="lwText" TextMode="MultiLine" Columns="84" Rows="30" runat="server"/></TD><TR>
           <TR align="center"><TD><asp:requiredfieldvalidator id="rvf1"  ErrorMessage="论文内容允许为空" ControlToValidate="lwText" disply="static" runat="server"><SPAN  class=p9>*论文内容不允许为空</SPAN></asp:requiredfieldvalidator></TD></TR>
           <TR align="center"><TD><asp:button id="submit" Text="提  交" runat="server"/></TD></TR>            
            <TR align="center"><TD><FONT color=#CC0000 face="华文楷体" size=4><asp:label ID="message" runat="server"/></FONT></TD></TR>
	   </TABLE></FORM></TD></TR></TABLE>
<bottom:mybottom runat="server"/>                        
</body>
</html>
