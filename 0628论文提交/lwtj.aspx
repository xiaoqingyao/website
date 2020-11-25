<%@ Page language="c#" src="lwtj.aspx.cs" AutoEventWireup="false" Inherits="class_lwtjxt.lwtj" %>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>在线毕业论文提交系统-论文基本信息提交</title>
</head>
<body>
<Top:myTop runat="server"/>
<TABLE borderColor=#2979C6 cellSpacing=0 cellPadding=1 width=760  align="center" border=0>
    <TR><TD bgColor=#2979C6 height=23  class=p9><FONT  color=#ffffff >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第一步:学生及论文基本信息提交</FONT><FONT color=#cc3300>(*为必填项)：</FONT></TD></TR>
    <TR><TD bgColor=#2979C6>
        <TABLE height=10 cellSpacing=1 cellPadding=0 width=758 bgColor=#f5fafd align="center" border=0>
             <FORM  method=post runat="server">
			      <TR><Td>&nbsp;</TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>姓名:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="stuName" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf1"  ErrorMessage="姓名不允许为空" ControlToValidate="stuName" disply="static" runat="server"><SPAN  class=p9>*姓名不允许为空</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>学号:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="stuNo" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf2" ErrorMessage="学号不允许为空" ControlToValidate="stuNo" disply="static" runat="server"><SPAN  class=p9>*学号不允许为空</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>密码:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="password1" size=20 runat="server" TextMode="Password" >(查询时使用)</asp:TextBox>&nbsp;  
                        <asp:requiredfieldvalidator id="rvf3" runat="server"  ErrorMessage="密码不允许为空" ControlToValidate="password1"><SPAN  class=p9>*密码不允许为空</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>确认密码:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="password2" size=20 runat="server" TextMode="Password" >确认密码</asp:TextBox>&nbsp; 
					    <asp:requiredfieldvalidator id="rvf4" runat="server"  ErrorMessage="密码不允许为空" ControlToValidate="password2"><SPAN  class=p9>*密码不允许为空</SPAN></asp:requiredfieldvalidator>
						<asp:comparevalidator id="cv" controltovalidate="password1" controltocompare="password2" type="string" operator="equal" display="static" ErrorMessage="密码不一致" runat="server"><SPAN  class=p9>*两次输入的密码不一致</SPAN></asp:comparevalidator></TD></TR>
				  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT>所学专业:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="stuZy" size=30 runat="server"/></TD></TR>
				   <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT>联系电话:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="stuTel" size=20 runat="server"/></TD></TR>                    
                    <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT>Email:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="email" size=20 runat="server"/></TD></TR>					
				   <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>导师姓名:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="teacherName" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf5"  ErrorMessage="导师姓名不允许为空" ControlToValidate="teacherName" disply="static" runat="server"><SPAN  class=p9>*导师姓名不允许为空</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>导师工号:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="teacherNo" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf6"  ErrorMessage="导师不允许为空" ControlToValidate="teacherNo" disply="static" runat="server"><SPAN  class=p9>*导师工号不允许为空</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>论文题目:</SPAN></TD>
                    <TD width=537><asp:TextBox id="lwTitle" size=30 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf7"  ErrorMessage="论文题目不允许为空" ControlToValidate="lwTitle" disply="static" runat="server"><SPAN  class=p9>*论文题目不允许为空</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>论文关键字:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="keyWord" size=30 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf8"  ErrorMessage="论文关键字不允许为空" ControlToValidate="keyWord" disply="static" runat="server"><SPAN  class=p9>*论文关键字不允许为空</SPAN></asp:requiredfieldvalidator></TD></TR>
                  <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>论文摘要:</SPAN></TD>
                    
                    <TD width=537><asp:TextBox id="lwzy" TextMode="MultiLine"  Columns="65" Rows="12" runat="server"/>&nbsp;   </TR>
                   <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300></FONT></SPAN></TD>                    
                    <TD width=537>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf9"  ErrorMessage="论文摘要不允许为空" ControlToValidate="lwzy" disply="static" runat="server"><SPAN  class=p9>*论文摘要不允许为空</SPAN></asp:requiredfieldvalidator></TD></TR>
                    <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>申请学位类别:</SPAN></TD>
                    
                    <TD width=537><asp:DropDownList id="xwlb" runat="server"> 
                      <asp:ListItem value="工学学士" Selected="true">工学学士</asp:ListItem> 
                      <asp:ListItem value="理学学士" >理学学士</asp:ListItem>
                      <asp:ListItem value="文学学士" >文学学士</asp:ListItem>                      
                      </asp:DropDownList></TD></TR>
                    <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>分类号:</SPAN></TD> 
                    <TD width=537><asp:TextBox id="flh" size=20 runat="server"/>&nbsp;   
                        <asp:requiredfieldvalidator id="rvf10"  ErrorMessage="分类号不允许为空" ControlToValidate="flh" disply="static" runat="server"><SPAN  class=p9>*分类号不允许为空</SPAN></asp:requiredfieldvalidator></TD></TR>
                    <TR>
                    <TD align="right" width=161><SPAN  class=p9><FONT color=#cc3300>*</FONT>密级:</SPAN></TD>
                    
                    <TD width=537><asp:DropDownList id="bmjb"  runat="server"> 
                      <asp:ListItem value="公开" Selected="true">公开</asp:ListItem> 
                      <asp:ListItem value="秘密" >秘密</asp:ListItem>
                      <asp:ListItem value="机密" >机密</asp:ListItem>
                      <asp:ListItem value="绝密" >绝密</asp:ListItem>                      
                      </asp:DropDownList></TD></TR>
                    <TR><TD>&nbsp;</TD></TR>      
		   <TR><TD align="center" width=161>&nbsp;</TD>                    
		   <TD ><asp:button id="submit" Text="下一步" runat="server"/>&nbsp;&nbsp;&nbsp;<INPUT class=p9 type="reset" Value="重 写"></TD></TR>
		    <TR><TD>&nbsp;</TD></TR> 
		   <TR><TD width=161></TD><TD><FONT color=#CC0000 face="华文楷体" size=4><asp:label ID="message" runat="server"/></FONT></TD></TR> 
		 <TR><TD>&nbsp;</TD></TR>              					
		  </FORM>
		</TABLE></TD></TR></TABLE>
<bottom:mybottom runat="server"/>                        
</body>
</html>
