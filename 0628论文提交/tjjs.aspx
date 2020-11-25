<%@ Page language="c#" src="tjjs.aspx.cs" AutoEventWireup="false" Inherits="class_lwtjxt.tjjs" %>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>在线毕业论文提交系统—添加老师</title>
</head>
<body>
<Top:myTop runat="server"/>
<TABLE borderColor=#2979C6 cellSpacing=0 cellPadding=1 width=760  align="center" border=0>
    <TR><TD class=p9 bgColor=#2979C6 height=23><FONT  color=#ffffff >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请认真填写以下内容</FONT><FONT color=#cc3300>(*为必填项)：</FONT></TD></TR>
    <TR><TD bgColor=#2979C6>
        <TABLE cellSpacing=1 cellPadding=0 width=758 bgColor=#f5fafd align="center" border=0>
             <FORM  method=post runat="server">		  
		 <TR><Td height=60 ></TD></TR>
                  <TR>
                    <TD class=p9 align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>导师姓名:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="teacherName" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf1"  ErrorMessage="姓名不允许为空" ControlToValidate="teacherName" disply="static" runat="server"><SPAN  class=p9>*姓名不允许为空</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD class=p9 align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>导师工号:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="teacherNo" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf2" ErrorMessage="工号不允许为空" ControlToValidate="teacherNo" disply="static" runat="server"><SPAN  class=p9>*工号不允许为空</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD class=p9 align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>密码:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="password1" size=20 runat="server" TextMode="Password" >(查询时使用)</asp:TextBox>&nbsp;  
                        <asp:requiredfieldvalidator id="rvf3" runat="server"  ErrorMessage="密码不允许为空" ControlToValidate="password1"><SPAN  class=p9>*密码不允许为空"</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD class=p9 align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>确认密码:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="password2" size=20 runat="server" TextMode="Password" >确认密码</asp:TextBox>&nbsp; 
					    <asp:requiredfieldvalidator id="rvf4" runat="server"  ErrorMessage="密码不允许为空" ControlToValidate="password2"><SPAN  class=p9>*密码不允许为空"</SPAN></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cv" controltovalidate="password1" controltocompare="password2" type="string" operator="equal" display="static" runat="server"/></TD></TR>
				   <TR>
				     <TD class=p9 align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT>职称:</SPAN></TD>
				     <TD width=537><asp:TextBox id="teacherZc" size=20 runat="server"/></TD>
		       </TR>
				   <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT>联系电话:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="teacherTel" size=20 runat="server"/></TD></TR>
					<TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT>Email:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="email" size=20 runat="server"/>&nbsp;</TD></TR>
				<TR><TD>&nbsp;</TD></TR>    
                                <TR><TD class=p9 align="right" width=161>&nbsp;</TD>
				    <TD class=p9 ><asp:button id="submit" Text="添 加" runat="server"/>&nbsp;&nbsp;&nbsp;
				      <a href="teacheradmin.aspx">&nbsp;&nbsp;&nbsp;&nbsp;[返回上页]</a></TD>
                                </TR>
				    <TR><TD>&nbsp;</TD></TR> 
			        <TR><TD width=161></TD><TD><FONT color=#CC0000 face="华文楷体" size=4><asp:label ID="message" runat="server"/></FONT></TD></TR> 
				   <TR><TD height=50>&nbsp;</TD></TR>              					
		  </FORM>
		</TABLE></TD></TR></TABLE>
<bottom:mybottom runat="server"/>                        
</body>
</html>
