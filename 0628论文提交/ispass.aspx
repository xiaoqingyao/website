<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>已审核</title>
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
                <TD height=100>&nbsp;</TD></TR>
              
              <TR>
                <TD align=middle>
                  <TABLE class=p9 cellSpacing=0 cellPadding=0  width=578 align=center border=0>
                    
                    <TR>
                      <TD colSpan=2 height=30 align=center><FONT color="#FF0000" face="华文楷体" size=8>恭喜你!你的论文已经被你的指导老师审核!</FONT></TD></TR>                                
                    <TR>
                      <TD vAlign=bottom colSpan=2 height=50>&nbsp; 
                    </TD></TR></TABLE></TD></TR>
              <TR>
                <TD height=100>&nbsp;</TD></TR></TABLE></TD></TR></TABLE></TD></TR></TABLE>
<bottom:mybottom runat="server"/>                        
</body>
</html>
