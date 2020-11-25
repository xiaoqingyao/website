<%@ Page language="c#" src="stuadmin.aspx.cs" AutoEventWireup="false" Inherits="class_lwtjxt.stuadmin" %>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>在线毕业论文提交系统—学生及论文信息管理</title>
</head>
<body>
<Top:myTop runat="server"/>
<table id="Table1" cellspacing="0" cellpadding="1" width="760" align="center" bgcolor="#0066b3" border="0">
   <tr>
    <tr valign="top">
      <table id="Table2" cellspacing="0" cellpadding="0" width="100%" bgcolor="#ffffff"  border="0">
        <tr>
          <td>
            <table id="Table3" cellspacing="0" cellpadding="1" width="100%"  border="0">
                <td align="center">
<form runat="server">
<table width="756" border="0" align="center">
  
  <tr>
    <td ><div align="left"><a href="stuadmin.aspx">&nbsp;&nbsp;&nbsp;&nbsp;［学生及论文信息管理］</a><a href="teacheradmin.aspx">［老师信息管理］</a></div></td>
    </tr>
  <tr>
    <td ><div align="center"><hr width="702" /></div></td>
  </tr>
  <tr>
    <td >
       <table width="710" border="0" align="center">
        <tr>
          <td ><div align="center">
		  <asp:DataGrid id="dg1" width="700" bordercolor="black" cellpadding="3" cellspcing="0"  runat="server"
		       headerstyle-font-bold="true" autogeneratecolumns="false" allowsorting="true" OnSortCommand="Sort_Grid" OnItemCommand="Click_Grid" DataKeyField="stuNo" AllowPaging="true" PageSize="10" PagerStyle-NextPageText="下页" PagerStyle-PrevPageText="上页" OnPageIndexChanged="ChangePage">
			 <Columns>
			   <asp:BoundColumn headertext="学号" datafield="stuNo" sortexpression="stuNo"/>
			   <asp:BoundColumn headertext="姓名" datafield="stuName" />
			   <asp:BoundColumn headertext="论文题目" datafield="lwTitle"/>
			   <asp:ButtonColumn headertext="click to delete"  Text="删除" CommandName="delete"/>
			   <asp:ButtonColumn headertext="click to daochu"  Text="导出" CommandName="daochu"/>
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
</form></td></tr>
</table></td></tr>
</table>

<bottom:mybottom runat="server"/>                        
</body>
</html>
