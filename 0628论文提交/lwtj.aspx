<%@ Page language="c#" src="lwtj.aspx.cs" AutoEventWireup="false" Inherits="class_lwtjxt.lwtj" %>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���߱�ҵ�����ύϵͳ-���Ļ�����Ϣ�ύ</title>
</head>
<body>
<Top:myTop runat="server"/>
<TABLE borderColor=#2979C6 cellSpacing=0 cellPadding=1 width=760  align="center" border=0>
    <TR><TD bgColor=#2979C6 height=23  class=p9><FONT  color=#ffffff >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��һ��:ѧ�������Ļ�����Ϣ�ύ</FONT><FONT color=#cc3300>(*Ϊ������)��</FONT></TD></TR>
    <TR><TD bgColor=#2979C6>
        <TABLE height=10 cellSpacing=1 cellPadding=0 width=758 bgColor=#f5fafd align="center" border=0>
             <FORM  method=post runat="server">
			      <TR><Td>&nbsp;</TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>����:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="stuName" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf1"  ErrorMessage="����������Ϊ��" ControlToValidate="stuName" disply="static" runat="server"><SPAN  class=p9>*����������Ϊ��</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>ѧ��:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="stuNo" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf2" ErrorMessage="ѧ�Ų�����Ϊ��" ControlToValidate="stuNo" disply="static" runat="server"><SPAN  class=p9>*ѧ�Ų�����Ϊ��</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>����:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="password1" size=20 runat="server" TextMode="Password" >(��ѯʱʹ��)</asp:TextBox>&nbsp;  
                        <asp:requiredfieldvalidator id="rvf3" runat="server"  ErrorMessage="���벻����Ϊ��" ControlToValidate="password1"><SPAN  class=p9>*���벻����Ϊ��</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>ȷ������:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="password2" size=20 runat="server" TextMode="Password" >ȷ������</asp:TextBox>&nbsp; 
					    <asp:requiredfieldvalidator id="rvf4" runat="server"  ErrorMessage="���벻����Ϊ��" ControlToValidate="password2"><SPAN  class=p9>*���벻����Ϊ��</SPAN></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cv" controltovalidate="password1" controltocompare="password2" type="string" operator="equal" display="static" ErrorMessage="���벻һ��" runat="server"><SPAN  class=p9>*������������벻һ��</SPAN></asp:comparevalidator></TD></TR>
				  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT>��ѧרҵ:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="stuZy" size=30 runat="server"/></TD></TR>
				   <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT>��ϵ�绰:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="stuTel" size=20 runat="server"/></TD></TR>                    
                    <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT>Email:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="email" size=20 runat="server"/></TD></TR>					
				   <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>��ʦ����:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="teacherName" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf5"  ErrorMessage="��ʦ����������Ϊ��" ControlToValidate="teacherName" disply="static" runat="server"><SPAN  class=p9>*��ʦ����������Ϊ��</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>��ʦ����:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="teacherNo" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf6"  ErrorMessage="��ʦ������Ϊ��" ControlToValidate="teacherNo" disply="static" runat="server"><SPAN  class=p9>*��ʦ���Ų�����Ϊ��</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>������Ŀ:</SPAN></TD>
                    <TD width=537><asp:TextBox id="lwTitle" size=30 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf7"  ErrorMessage="������Ŀ������Ϊ��" ControlToValidate="lwTitle" disply="static" runat="server"><SPAN  class=p9>*������Ŀ������Ϊ��</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>���Ĺؼ���:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="keyWord" size=30 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf8"  ErrorMessage="���Ĺؼ��ֲ�����Ϊ��" ControlToValidate="keyWord" disply="static" runat="server"><SPAN  class=p9>*���Ĺؼ��ֲ�����Ϊ��</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>����ժҪ:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="lwzy" TextMode="MultiLine"  Columns="65" Rows="12" runat="server"/>&nbsp;   </TR>
                   <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT></SPAN></TD>                    
                    <TD width=537>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf9"  ErrorMessage="����ժҪ������Ϊ��" ControlToValidate="lwzy" disply="static" runat="server"><SPAN  class=p9>*����ժҪ������Ϊ��</SPAN></asp:requiredfieldvalidator></TD></TR>
                    <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>����ѧλ���:</SPAN></TD>
                    
                    <TD width=537><asp:DropDownList id="xwlb" runat="server"> 
                      <asp:ListItem value="��ѧѧʿ" Selected="true">��ѧѧʿ</asp:ListItem> 
                      <asp:ListItem value="��ѧѧʿ" >��ѧѧʿ</asp:ListItem>
                      <asp:ListItem value="��ѧѧʿ" >��ѧѧʿ</asp:ListItem>                      
                      </asp:DropDownList></TD></TR>
                    <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>�����:</SPAN></TD> 
                    <TD width=537><asp:TextBox id="flh" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf10"  ErrorMessage="����Ų�����Ϊ��" ControlToValidate="flh" disply="static" runat="server"><SPAN  class=p9>*����Ų�����Ϊ��</SPAN></asp:requiredfieldvalidator></TD></TR>
                    <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>�ܼ�:</SPAN></TD>
                    
                    <TD width=537><asp:DropDownList id="bmjb"  runat="server"> 
                      <asp:ListItem value="����" Selected="true">����</asp:ListItem> 
                      <asp:ListItem value="����" >����</asp:ListItem>
                      <asp:ListItem value="����" >����</asp:ListItem>
                      <asp:ListItem value="����" >����</asp:ListItem>                      
                      </asp:DropDownList></TD></TR>
                    <TR><TD>&nbsp;</TD></TR>      
		   <TR><TD align="center" width=161>&nbsp;</TD>                    
		   <TD ><asp:button id="submit" Text="��һ��" runat="server"/>&nbsp;&nbsp;&nbsp;<INPUT class=p9 type="reset" Value="�� д"></TD></TR>
		    <TR><TD>&nbsp;</TD></TR> 
		   <TR><TD width=161></TD><TD><FONT color=#CC0000 face="���Ŀ���" size=4><asp:label ID="message" runat="server"/></FONT></TD></TR> 
		 <TR><TD>&nbsp;</TD></TR>              					
		  </FORM>
		</TABLE></TD></TR></TABLE>
<bottom:mybottom runat="server"/>                        
</body>
</html>
