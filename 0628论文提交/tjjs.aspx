<%@ Page language="c#" src="tjjs.aspx.cs" AutoEventWireup="false" Inherits="class_lwtjxt.tjjs" %>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���߱�ҵ�����ύϵͳ�������ʦ</title>
</head>
<body>
<Top:myTop runat="server"/>
<TABLE borderColor=#2979C6 cellSpacing=0 cellPadding=1 width=760  align="center" border=0>
    <TR><TD class=p9 bgColor=#2979C6 height=23><FONT  color=#ffffff >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��������д��������</FONT><FONT color=#cc3300>(*Ϊ������)��</FONT></TD></TR>
    <TR><TD bgColor=#2979C6>
        <TABLE cellSpacing=1 cellPadding=0 width=758 bgColor=#f5fafd align="center" border=0>
             <FORM  method=post runat="server">		  
		 <TR><Td height=60 ></TD></TR>
                  <TR>
                    <TD class=p9 align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>��ʦ����:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="teacherName" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf1"  ErrorMessage="����������Ϊ��" ControlToValidate="teacherName" disply="static" runat="server"><SPAN  class=p9>*����������Ϊ��</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD class=p9 align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>��ʦ����:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="teacherNo" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf2" ErrorMessage="���Ų�����Ϊ��" ControlToValidate="teacherNo" disply="static" runat="server"><SPAN  class=p9>*���Ų�����Ϊ��</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD class=p9 align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>����:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="password1" size=20 runat="server" TextMode="Password" >(��ѯʱʹ��)</asp:TextBox>&nbsp;  
                        <asp:requiredfieldvalidator id="rvf3" runat="server"  ErrorMessage="���벻����Ϊ��" ControlToValidate="password1"><SPAN  class=p9>*���벻����Ϊ��"</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD class=p9 align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>ȷ������:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="password2" size=20 runat="server" TextMode="Password" >ȷ������</asp:TextBox>&nbsp; 
					    <asp:requiredfieldvalidator id="rvf4" runat="server"  ErrorMessage="���벻����Ϊ��" ControlToValidate="password2"><SPAN  class=p9>*���벻����Ϊ��"</SPAN></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cv" controltovalidate="password1" controltocompare="password2" type="string" operator="equal" display="static" runat="server"/></TD></TR>
				   <TR>
				     <TD class=p9 align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT>ְ��:</SPAN></TD>
				     <TD width=537><asp:TextBox id="teacherZc" size=20 runat="server"/></TD>
		       </TR>
				   <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT>��ϵ�绰:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="teacherTel" size=20 runat="server"/></TD></TR>
					<TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT>Email:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="email" size=20 runat="server"/>&nbsp;</TD></TR>
				<TR><TD>&nbsp;</TD></TR>    
                                <TR><TD class=p9 align="right" width=161>&nbsp;</TD>
				    <TD class=p9 ><asp:button id="submit" Text="�� ��" runat="server"/>&nbsp;&nbsp;&nbsp;
				      <a href="teacheradmin.aspx">&nbsp;&nbsp;&nbsp;&nbsp;[������ҳ]</a></TD>
                                </TR>
				    <TR><TD>&nbsp;</TD></TR> 
			        <TR><TD width=161></TD><TD><FONT color=#CC0000 face="���Ŀ���" size=4><asp:label ID="message" runat="server"/></FONT></TD></TR> 
				   <TR><TD height=50>&nbsp;</TD></TR>              					
		  </FORM>
		</TABLE></TD></TR></TABLE>
<bottom:mybottom runat="server"/>                        
</body>
</html>
