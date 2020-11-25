<%@ Page Language="C#" MasterPageFile="~/zt.master" AutoEventWireup="true" CodeFile="newshow.aspx.cs" Inherits="cjwt" Title="新闻" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
    <link href="css/xstlye.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="x_all">
<div  class="x_left">
<div style="margin-bottom:7px;">
    新闻中心：<br />
    </div>
<div class="x_left_t2">

<ul>
<asp:Repeater ID="Repeater2" runat="server">  
  <ItemTemplate>
    <li><a href='newscate.aspx?uid=<%#Eval("_cateid")%>'><%#Eval("_catename")%></a></li>
  </ItemTemplate>  
</asp:Repeater>
<li><a href="newlist.aspx">友情链接 </a> </li>

</ul>

</div>
</div>
<div  class="x_right">
<div class="x_left_t2">
<div class="newscontent">
   <div style=" margin-top:5px; text-align:center; font-size:16px; font-weight:bold;  ">
       <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
   </div>
     <div style=" text-align:center; margin-top:5px;"> 
         新闻来源：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>　作者：<asp:Label 
             ID="Label2" runat="server" Text="Label"></asp:Label>　上传时间：<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;&nbsp; 
         点击率：<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></div>
     <div style="margin-left:17px; margin-right:17px"> 
         <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
      </div>
       
      <div style="clear:both; height:50px; ">  </div>
       <div>
       </div> 
  </div>
      </div>
       
      <div style="clear:both;">  </div>
       <div>
       </div> 
<div class="line_x"></div>
</div>
<div class="x_left_t2">



</div>
</div>
<div class="clear"></div>

</asp:Content>

