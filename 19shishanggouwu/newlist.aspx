<%@ Page Language="C#" MasterPageFile="~/zt.master" AutoEventWireup="true" CodeFile="newlist.aspx.cs" Inherits="cjwt" Title="常见问题 " %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
    <link href="css/xstlye.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="x_all">
<div  class="x_left">
<div style="margin-bottom:7px;">
    时尚新闻：<br />
    </div>
<div class="x_left_t2">

<ul>
<asp:Repeater ID="Repeater2" runat="server">  
  <ItemTemplate>
    <li><a href='newscate.aspx?uid=<%#Eval("_cateid")%>'><%#Eval("_catename")%></a></li>
  </ItemTemplate>  
</asp:Repeater>

</ul>

</div>
</div>
<div  class="x_right">
<div class="x_left_t2">
<div style=" margin-top:25px; text-align:center; font-size:16px; font-weight:bold;  ">新闻中心</div>
<div style="margin-right:37px; text-align:right;"> 
         <asp:TextBox ID="search" runat="server"></asp:TextBox> 
         <asp:Button ID="Button1" runat="server" Text="搜索" onclick="Button1_Click1" /></div>
     <div > 
         <asp:Repeater ID="Repeater1" runat="server">
               <ItemTemplate>
           
               <table style="width: 100%">
                   <tr>
                       <td style="  text-align:right ; width:100px;" >
                           <%#Eval("name")%></td>
                       <td style="padding-left:22px;  width:200px;">
                         <a href='newshow.aspx?uid=<%#Eval("_id")%>'>  <%#Common.DB.substr( Eval("_title").ToString(),13)%> </a></td>
                       <td style="padding-left:22px;  width:50px;">
                           <%#Eval("_click")%></td>
                       <td style="padding-left:22px;  width:150px;">
                          <%#Eval("_posttime")%></td>
                   </tr>
               </table>
           
            </ItemTemplate>
          </asp:Repeater>
      </div>
       
      <div style="clear:both;">  
         <div style="text-align:center;">
            <webdiyer:AspNetPager ID="AspNetPager21" runat="server" FirstPageText="首页" 
                LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页" AlwaysShow="True" 
                 CssClass="paginator" CurrentPageButtonClass="cpb" 
                 onpagechanging="AspNetPager1_PageChanging1">
            </webdiyer:AspNetPager>
         </div>
    </div>
       <div>
           <aspnetpager ID="AspNetPager1" runat="server" FirstPageText="首页" 
               HorizontalAlign="Center" LastPageText="尾页" NextPageText="下一页" 
               PrevPageText="上一页" onpagechanging="AspNetPager1_PageChanging1">
           </aspnetpager>
       </div> 
<div class="line_x">
         <div style="text-align:center;">
            <aspnetpager ID="AspNetPager2" runat="server" FirstPageText="首页" 
                LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页" AlwaysShow="True" 
                 CssClass="paginator" CurrentPageButtonClass="cpb" 
                 onpagechanging="AspNetPager1_PageChanging">
            </aspnetpager>
         </div>
        </div>
</div>
<div class="x_left_t2">



</div>
</div>
<div class="clear"></div>
</div>
</asp:Content>

