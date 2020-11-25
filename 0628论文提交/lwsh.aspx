<%@ Page language="c#" src="lwsh.aspx.cs" AutoEventWireup="false" Inherits="class_lwtjxt.lwsh" %>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>在线毕业论文提交系统-论文审核</title>
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
  <tr></tr><tr></tr>
  <tr>
    <td><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎<FONT color=#CC0000 face="华文楷体" ><asp:Label id="Label1" runat="server"/></FONT>老师进入本系统!你可以点击<a href="jsxxgg.aspx">[修改个人信息及密码]</a>来进行修改!</div></td>
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
		       headerstyle-font-bold="true" autogeneratecolumns="false"   OnItemCommand="Click_Grid" DataKeyField="stuNo" AllowPaging="true" PageSize="10" PagerStyle-NextPageText="下页" PagerStyle-PrevPageText="上页" OnPageIndexChanged="ChangePage">
			 <Columns>
			   <asp:BoundColumn headertext="学号" datafield="stuNo" />
			   <asp:BoundColumn headertext="姓名"  datafield="stuName" />
			   <asp:HyperLinkColumn headertext="论文题目"  datatextfield="lwTitle" />
                           <asp:BoundColumn headertext="审核否" datafield="isPass" />
                           <asp:ButtonColumn headertext="请审核"  Text="审核" CommandName="shenhe"/>
			   <asp:ButtonColumn headertext="导出论文"  Text="查看" CommandName="view"/>
        		 </Columns>
		  </asp:DataGrid>
           </div>
		  </td>
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
                                                 