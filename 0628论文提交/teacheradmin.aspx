<%@ Page language="c#" src="teacheradmin.aspx.cs" AutoEventWireup="false" Inherits="class_lwtjxt.teacheradmin" %>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>在线毕业论文提交系统—老师信息管理</title>
</head>
<body>
<Top:myTop runat="server"/>
<TABLE id=Table1 cellSpacing=0 cellPadding=1 width=760 align=center bgColor=#0066b3 border=0>
   <TR>
    <TD vAlign=top>
      <TABLE id=Table2 cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff  border=0>
        <TR>
          <TD>
            <TABLE id=Table3 cellSpacing=0 cellPadding=1 width="100%"  border=0>
                <TD align=middle>
<form runat="server">
<table width="756" border="0" align="center">
  
  <tr>
    <td ><div align="left"><a href="stuadmin.aspx">&nbsp;&nbsp;&nbsp;&nbsp;［学生及论文信息管理］</a><a href="teacheradmin.aspx">［老师信息管理］</a><a href="tjjs.aspx">［添加老师信息］</a></div></td>
    </tr>
  <tr>
    <td ><div align="server"><hr width="702"></div></td>
  </tr>
   <tr>
    <td >
       <table width="710" border="0" align="center">
        <tr>
          <td ><div align="server">
		  <asp:DataGrid id="dg1" width=700 bordercolor="black" cellpadding=3 cellspcing="0"  runat="server"
		       headerstyle-font-bold="true" autogeneratecolumns="false" allowsorting="true" OnSortCommand="Sort_Grid"  OnDeleteCommand="DataGrid_Delete" DataKeyField="teacherNo"  MaintainState="false" AllowPaging="true" PageSize="10" PagerStyle-NextPageText="下页" PagerStyle-PrevPageText="上页" OnPageIndexChanged="ChangePage">
			 <Columns>
			   <asp:BoundColumn headertext="教师工号" datafield="teacherNo" SortExpression="teacher"/>
                           <asp:BoundColumn headertext="密码"    datafield="teacherpassword" />
			   <asp:BoundColumn headertext="姓名" datafield="teacherName" />
                           <asp:BoundColumn headertext="职称" datafield="teacherZc" />
                           <asp:BoundColumn headertext="联系电话" datafield="teacherTel" />
                           <asp:BoundColumn headertext="EMAIL" datafield="teacherEmail" />
                           <asp:ButtonColumn headertext="click to delete"  Text="删除" CommandName="delete" />
			   
			 </Columns>
		  </asp:DataGrid>
           </div></td>
        </tr>
       
      </table>
	   </td>
  </tr>
  <tr>
    <td ><div align="center"></div></td>
  </tr>
</table>
</form></TD></TR></TABLE></TD></TR></TABLE></TD></TR></TABLE>
<bottom:mybottom runat="server"/>                        
</body>
</html>
