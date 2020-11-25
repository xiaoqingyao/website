<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>在线毕业论文提交系统—管理首页</title>
</head>
<body>
<Top:myTop runat="server"/>
<TABLE id=Table1 cellSpacing=0 cellPadding=1 width=760 align=center bgColor=#0066b3 border=0>
  
  <TR>
    <TD vAlign=top>
      <TABLE id=Table2 cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff 
      border=0>
        
        <TR>
          <TD>
            <TABLE id=Table3 cellSpacing=0 cellPadding=1 width="100%" 
              border=0>
              <TR>
                <TD height=90>&nbsp;</TD></TR>
              <TR>
                <TD align=middle height=30><div align="center"><font color="#2b7ac5" size=4><b>欢迎进入毕业论文提交系统管理中心!</b></font></div></TD>
              </TR>
			  <TR><TD><hr width=500 align="center"></TD></TR>
              <TR>
                <TD align=middle>
                  <TABLE class=p9 height=135 cellSpacing=0 cellPadding=0 
                  width=578 align=center border=0>
                    
                    <TR>
                      <TD colSpan=2 height=13>&nbsp;</TD></TR>
                    <FORM runat="server" method=post>
                    <TR>
                      <TD height=20 colspan="2"><div align="center"><a href="stuadmin.aspx"><font color="#2b7ac5" size=3>1.学生及论文信息管理</font></a></div></TD>
                      </TR>
			<TR><TD>&nbsp;</TD></TR>
                    <TR>
                      <TD height=20 colspan="2"><div align="center"><a href="teacheradmin.aspx"><font color="#2b7ac5" size=3>2.教师信息管理</font></a></div></TD></TR>
					 <TR><TD>&nbsp;</TD></TR>
					<TR><TD>&nbsp;</TD>
					  <TD width="334">&nbsp;</TD>
					</TR>
					<TR><TD>&nbsp;</TD></TR>
		                        <TR><TD width=244></TD><TD>&nbsp;</TD>
		                        </TR> 
					</FORM>
                    
                      <TD vAlign=bottom colSpan=2>&nbsp; 
                    </TD></TR></TABLE></TD></TR>
              <TR>
                <TD 
    height=100>&nbsp;</TD></TR></TABLE></TD></TR></TABLE></TD></TR></TABLE>
<bottom:mybottom runat="server"/>                        
</body>
</html>
