<%@ Page language="c#" src="teacheradmin.aspx.cs" AutoEventWireup="false" Inherits="class_lwtjxt.teacheradmin" %>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���߱�ҵ�����ύϵͳ����ʦ��Ϣ����</title>
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
    <td ><div align="left"><a href="stuadmin.aspx">&nbsp;&nbsp;&nbsp;&nbsp;��ѧ����������Ϣ�����</a><a href="teacheradmin.aspx">����ʦ��Ϣ�����</a><a href="tjjs.aspx">�������ʦ��Ϣ��</a></div></td>
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
		       headerstyle-font-bold="true" autogeneratecolumns="false" allowsorting="true" OnSortCommand="Sort_Grid"  OnDeleteCommand="DataGrid_Delete" DataKeyField="teacherNo"  MaintainState="false" AllowPaging="true" PageSize="10" PagerStyle-NextPageText="��ҳ" PagerStyle-PrevPageText="��ҳ" OnPageIndexChanged="ChangePage">
			 <Columns>
			   <asp:BoundColumn headertext="��ʦ����" datafield="teacherNo" SortExpression="teacher"/>
                           <asp:BoundColumn headertext="����"    datafield="teacherpassword" />
			   <asp:BoundColumn headertext="����" datafield="teacherName" />
                           <asp:BoundColumn headertext="ְ��" datafield="teacherZc" />
                           <asp:BoundColumn headertext="��ϵ�绰" datafield="teacherTel" />
                           <asp:BoundColumn headertext="EMAIL" datafield="teacherEmail" />
                           <asp:ButtonColumn headertext="click to delete"  Text="ɾ��" CommandName="delete" />
			   
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
