<%@Page language="c#" Src="lwdc.aspx.cs"   AutoEventWireup="false"   Inherits="class_lwtjxt.lwdc" ResponseEncoding="gb2312"%>
<HTML>     
    <HEAD>     
      <title>论文导出</title>     
      <style type="text/css">
<!--
.style1 {
	font-family: "黑体";
	font-size: 34px;
}
.style2 {
	font-size: 24px;
	font-weight: bold;
}
.style3 {
	font-family: "宋体";
	font-size: 22px;
        font-weight: bold;
}
.style4 {
	font-family: "宋体";
	font-size: 18px;
        font-weight: bold;
}
-->
      </style>
    </HEAD>     
<body>
       <div align=center>           
             <p  align=left class="style4">分类号:<asp:Label ID="flh"  runat="server"/></p>
             <p  align=left class="style4">密级:<asp:Label ID="bmjb"  runat="server"/></p>
             <p class="style1">&nbsp;</p>
             <p class="style1">&nbsp;</p>
             <p class="style1"><strong>成 都 信 息 工 程 学 院</strong></p>
             <p class="style1"><strong>学 术 论 文</strong></p>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p class="style2"><asp:Label ID="lwtitle"  runat="server"/></p>
             <p class="style2">&nbsp;</p>
             <p class="style2">&nbsp;</p>
             <p class="style2">&nbsp;</p>             
             <table width="400" height="200" border="1">
               <tr>
                 <td><div align="right" class="style3">申请学生学号:</div></td>
                 <td align=center><span class="style3"><asp:Label ID="stuno" runat="server"/></span></td>
               </tr>
               <tr>
                 <td><div align="right" class="style3">申请学生姓名:</div></td>
                 <td align=center><span class="style3"><asp:Label ID="stuname" runat="server"/></span></td>
               </tr>
               <tr>
                 <td><div align="right" class="style3">申请学位专业:</div></td>
                 <td align=center><span class="style3"><asp:Label ID="stuzy" runat="server"/></span></td>
               </tr>
               <tr>
                 <td><div align="right" class="style3">指导老师姓名:</div></td>
                 <td align=center><span class="style3"><asp:Label ID="teaname" runat="server"/></span></td>
               </tr>
               <tr>
                 <td><div align="right" class="style3">申请学位类别:</div></td>
                 <td align=center><span class="style3"><asp:Label ID="xwlb"  runat="server"/></span></td>
               </tr>
             </table>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p>&nbsp;</p>             
            </div>          
             <p class="style2" align=center><asp:Label ID="lwtitle2"  runat="server"/></p>
             <p class="style2" align=center>摘要</p>                         
             <asp:Label ID="lwzy"  style="WORD-WRAP:break-word" runat="server"/>
             <p>&nbsp;</p>
             <p align=left class="style4">&nbsp;&nbsp;&nbsp;&nbsp;关键字:<asp:Label ID="keyword"  runat="server"/></p>
             <p class="style1">&nbsp;</p>
             <p class="style1">&nbsp;</p>
             <p class="style1">&nbsp;</p> 
             <p class="style1">&nbsp;</p>
             <p class="style1">&nbsp;</p> 
             <p class="style1">&nbsp;</p>    
             <asp:Label ID="lwtext"  style="WORD-WRAP:break-word" runat="server"/>
</body>
</html>
