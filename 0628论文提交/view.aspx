<%@Page language="c#" Src="view.aspx.cs"   AutoEventWireup="false"   Inherits="class_lwtjxt.view" ResponseEncoding="gb2312"%>
<%@Register TagPrefix="Top" TagName="myTop" Src="top.ascx" %>
<%@Register TagPrefix="bottom" TagName="mybottom" Src="bottom.ascx" %>  
<HTML>     
    <HEAD>     
      <title>���߱�ҵ�����ύϵͳ-�鿴����</title>
      <style type="text/css">
<!--
.style1 {
	font-family: "����";
	font-size: 34px;
}
.style2 {
	font-size: 24px;
	font-weight: bold;
}
.style3 {
	font-family: "����";
	font-size: 22px;
        font-weight: bold;
}
.style4 {
	font-family: "����";
	font-size: 18px;
        font-weight: bold;
}
-->
      </style>     
    </HEAD>     
<body>
<Top:myTop runat="server"/>
<TABLE id=Table1 cellSpacing=0 cellPadding=1 width=760 align=center bgColor=#0066b3 border=0>
   <TR>
    <TD vAlign=top>
      <TABLE id=Table2 cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff  border=0>
        <TR>
          <TD>
            <TABLE id=Table3 cellSpacing=0 cellPadding=1 width="700"  border=0 align=center>
              <tr>          
               <td><div align="right"><a href="lwsh.aspx">[������ҳ]</a></div></td></tr>              
              <TR>
                <TD align=middle>
                   <form runat="server">
          
        <table>
        </table>
        <table><TR><TD>        
             <div align=center>           
             <p  align=left class="style4">�����:<asp:Label ID="flh"  runat="server"/></p>
             <p  align=left class="style4">�ܼ�:<asp:Label ID="bmjb"  runat="server"/></p>
             <p class="style1">&nbsp;</p>             
             <p class="style1"><strong>�� �� �� Ϣ �� �� ѧ Ժ</strong></p>
             <p class="style1"><strong>ѧ �� �� ��</strong></p>
             <p class="style2">&nbsp;</p>
             <p class="style2"><asp:Label ID="lwtitle"  runat="server"/></p>
             <p class="style2">&nbsp;</p>
             <p class="style2">&nbsp;</p>                          
             <table width="400" height="200" border="1">
               <tr>
                 <td><div align="right" class="style3">����ѧ��ѧ��:</div></td>
                 <td align=center><span class="style3"><asp:Label ID="stuno" runat="server"/></span></td>
               </tr>
               <tr>
                 <td><div align="right" class="style3">����ѧ������:</div></td>
                 <td align=center><span class="style3"><asp:Label ID="stuname" runat="server"/></span></td>
               </tr>
               <tr>
                 <td><div align="right" class="style3">����ѧλרҵ:</div></td>
                 <td align=center><span class="style3"><asp:Label ID="stuzy" runat="server"/></span></td>
               </tr>
               <tr>
                 <td><div align="right" class="style3">ָ����ʦ����:</div></td>
                 <td align=center><span class="style3"><asp:Label ID="teaname" runat="server"/></span></td>
               </tr>
               <tr>
                 <td><div align="right" class="style3">����ѧλ���:</div></td>
                 <td align=center><span class="style3"><asp:Label ID="xwlb"  runat="server"/></span></td>
               </tr>
             </table>            
             <p class="style2">&nbsp;</p>
             <p class="style2">&nbsp;</p>             
            </div>          
             <p class="style2" align=center><asp:Label ID="lwtitle2"  runat="server"/></p>
             <p class="style2" align=center>ժҪ</p>                         
             <asp:Label ID="lwzy"  style="WORD-WRAP:break-word" runat="server"/>
             <p>&nbsp;</p>
             <p align=left class="style4">&nbsp;&nbsp;�ؼ���:<asp:Label ID="keyword"  runat="server"/></p> 
             <p class="style1">&nbsp;</p>                 
             <asp:Label ID="lwtext"  style="WORD-WRAP:break-word" runat="server"/></TD></TR></table>
                  <table><tr height=20><td><td></tr><TR><TD width=698><SPAN  class=p9><asp:label id="lwbody"  style="WORD-WRAP:break-word" runat="server"/></SPAN></TD></TR></table> 
              
      </form>                    
                </TD></TR></TABLE></TD></TR></TABLE></TD></TR></TABLE>
<bottom:mybottom runat="server"/>                        
</body>
</html>
