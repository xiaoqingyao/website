<%@ Page language="c#" src="lwsh.aspx.cs" AutoEventWireup="false" Inherits="class_lwtjxt.lwsh" %>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���߱�ҵ�����ύϵͳ-�������</title>
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
    <td><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ӭ<FONT color=#CC0000 face="���Ŀ���" ><asp:Label id="Label1" runat="server"/></FONT>��ʦ���뱾ϵͳ!����Ե��<a href="jsxxgg.aspx">[�޸ĸ�����Ϣ������]</a>�������޸�!</div></td>
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
		       headerstyle-font-bold="true" autogeneratecolumns="false"   OnItemCommand="Click_Grid" DataKeyField="stuNo" AllowPaging="true" PageSize="10" PagerStyle-NextPageText="��ҳ" PagerStyle-PrevPageText="��ҳ" OnPageIndexChanged="ChangePage">
			 <Columns>
			   <asp:BoundColumn headertext="ѧ��" datafield="stuNo" />
			   <asp:BoundColumn headertext="����"  datafield="stuName" />
			   <asp:HyperLinkColumn headertext="������Ŀ"  datatextfield="lwTitle" />
                           <asp:BoundColumn headertext="��˷�" datafield="isPass" />
                           <asp:ButtonColumn headertext="�����"  Text="���" CommandName="shenhe"/>
			   <asp:ButtonColumn headertext="��������"  Text="�鿴" CommandName="view"/>
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
                                                 