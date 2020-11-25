<%@ Page Language="C#" MasterPageFile="~/zt.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" Title="购物首页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script type="text/javascript">
        $(function(){
            $(".in_t_l_sr").hover;
        });
    </script>
    


<script src="js/swfobject.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
    function expand(el) {
        childObj = document.getElementById(el);

        if (childObj.style.display == 'none') {
            childObj.style.display = 'block';
        }
        else {
            
        }
        return;
    }
    function expand1(el) {
        childObj = document.getElementById(el);

        if (childObj.style.display == 'block') {
            childObj.style.display = 'none';
        }
        else {

        }
        return;
    }
</script>
  <style type="text/css">
     .cctelist
     {
      text-align:center;
      line-height:25px;
     background-color:#eee;
      margin:3px 0 0 0;
     	}
     .cctelist a
     {
     	text-decoration:none;
     	color:#333333;
     	display:block;
        
        }	
     .cctelist a:hover
     {
     	padding-left:10px;
     	background-color:#bbbcc8;
     	}
         .cc
     {}	
      .cc li
     {
     	height:25px;
      text-align:center;
      line-height :25px;
      background-color:#eee;
      margin:3px 0 0 0;
     	}
     .cc li a
     {
     	text-decoration:none;
     	color:#333333;
     	display:block;
     }
     .cc li a:hover
     {
     
     	background-color:#bbbcc8;
     	}	
     
      .auto-style2 {
          width: 189px;
          height: 100px;
      }
      .auto-style3 {
          width: 191px;
          height: 104px;
      }
      .auto-style4 {
          width: 185px;
          height: 109px;
      }
     
    .auto-style5 {
        text-align: center;
        border-bottom: 1px solid #d89eb7;
        width: 950px;
        height: 66px;
        line-height: 30px;
        margin-bottom: 10px;
    }
    .auto-style6 {
        text-align: center;
        border-bottom: 1px solid #d89eb7;
        width: 950px;
        height: 61px;
        line-height: 30px;
        margin-bottom: 10px;
    }
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="in_t_l">
              <div class="in_t_l_s">
                <asp:TextBox ID="search" runat="server" CssClass="in_t_l_sa" Height="16px" 
                    Width="40px"></asp:TextBox>
            
                    <asp:ImageButton ID="ImageButton1" runat="server"  
                    ImageUrl='images/search_right1.gif'  style="margin-bottom:-4px; height: 17px;" 
                    onclick="ImageButton1_Click" />
            
         </div>
                <div> 
        
  
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
   <div onmouseout="expand1(<%#Eval("_fathercateid") %>)"  onmouseover="expand(<%#Eval("_fathercateid")%>)"  >

        <div style="width:90px" class="cctelist"  >
        <a  href="#"> <%#Eval("_fathername") %></a></div>
 
      <div id="<%#Eval("_fathercateid")%>"  style="margin:0  0 0 10px;  width:85px;  display:none;  " >
      <ul class="cc">
      <%# datas(Eval("_fathercateid").ToString()) %>
      </ul>
         </div>  
      </div> 
           </ItemTemplate>
           </asp:Repeater>
           
           
            </div> 
          
            
            </div> 
    
   <div class="in_t_c">
    
     <div id="top_flash"></div>
  <script type="text/javascript">	
	var so = new SWFObject("swf/main.swf ","STYLE ARENA", "640px", "380px", "8", "#ffffff");
	so.addParam("quality", "high");
	so.addParam("salign", "");
	so.addParam("scale", "noscale");
	so.addParam("wmode", "transparent");
	so.addParam("allowScriptAccess", "always");
	so.write("top_flash");
	</script>
	
    </div>
    
  <%#Eval("_title") %>
    <div class="in_t_r">
        <div style="padding-bottom:10px; " ><a href="#"><img src="images/sourred1.jpg" class="auto-style4" /></a></div>
        <div style="padding-bottom:13px;padding-top:13px;"><a href="#"><img src="images/sourred3.jpg" class="auto-style3" /></a></div>
        <div style="padding-top:10px;" ><a href="#"><img src="images/sourred2.jpg" class="auto-style2" /></a></div>
      
    </div>
   
 <div class="clear"></div>
 
 <%#Eval(" _localprice ","{0:N2}")%><%#Eval("_localprice ","{0:N2}")%>
    <asp:DataList ID="DataList4" runat="server" RepeatColumns="3" 
        RepeatDirection="Horizontal">
    
    <ItemTemplate>
 <div class="yhad">
        <a href='<%#Eval("href") %>'> <asp:Image ID="Image2" runat="server" Height="180px" Width="298px" ImageUrl='<%#Eval("src")%>' /></a>      
 </div>
 </ItemTemplate>
 </asp:DataList>
<%# Eval("_title")%>
 <div class="piczt">
     <div class="auto-style5">
         <asp:Image ID="Image3" runat="server" Height="69px" ImageUrl="~/images/newpro_title.png" Width="233px" />
&nbsp;</div>
     <div class="pic_list_y">   
         <asp:DataList ID="DataList3" runat="server" RepeatDirection="Horizontal" 
              RepeatColumns="5">
            <ItemTemplate>
               <div style=" margin-left:26px;">
                   <div class="pic">  
                   <a href='ProInfo.aspx?uid=<%#Eval("_id") %>' target="_blank">
                      <asp:Image ID="Image1" ImageUrl='<% # bd(Eval("_imageid").ToString()) %>' runat="server" style=" width:160px; height:200px;" /></a></div>
                   <div style=" padding-left:42px; " ><img src="images/1263192879102787928.gif" title="NEW" border="0"></div>
                   <div style=" padding-left:53px; " ><%#Eval("_title") %></div>
                   <div class="tit"><a href="#" target="_blank"></a></div><div style=" padding-left:48px; " >
                   ￥<%#Eval(" _localprice ","{0:N2}")%></div>
               </div>
               </ItemTemplate>
             </asp:DataList>                               
    </div>
</div>

<%#Eval("_localprice ","{0:N2}")%>
<div class="piczt">
     <div class="auto-style6">
         <asp:Image ID="Imagehrcx" runat="server" Height="56px" ImageUrl="~/images/huobaorexiao.png" Width="207px" />
     </div>
     <div class="pic_list_y">   
         <asp:DataList ID="DataList2" runat="server" RepeatDirection="Horizontal" 
              RepeatColumns="5">
            <ItemTemplate>
               <div style=" margin-left:26px;">
                   <div class="pic">  
                   <a href='ProInfo.aspx?uid=<%#Eval("_id") %>' target="_blank">
                      <asp:Image ID="Image1" ImageUrl='<% #bd( Eval("_imageid").ToString()) %>' runat="server" style=" width:160px; height:200px;" /></a></div>
                   <div style=" padding-left:42px; " ><img src="images/1263192879102787928.gif" title="NEW" border="0"></div>
                   <div style=" padding-left:53px; " ><%# Eval("_title")%></div>
                   <div class="tit"><a href="#" target="_blank"></a></div><div style=" padding-left:48px; " >
                   ￥<%#Eval("_localprice ","{0:N2}")%></div>
               </div>
               </ItemTemplate>
             </asp:DataList>                               
    </div>
</div>

<%--特价促销--%>
<div class="piczt">
     <div class="auto-style6">
         <asp:Image ID="Imagecztj" runat="server" Height="58px" ImageUrl="~/images/chaozhituijian.png" Width="229px" />
     </div>
     <div class="pic_list_y">   
         <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" 
              RepeatColumns="5">
            <ItemTemplate>
               <div style=" margin-left:26px;">
                   <div class="pic">  
                   <a href='ProInfo.aspx?uid=<%#Eval("_id") %>' target="_blank">
                      <asp:Image ID="Image1" ImageUrl='<% # bd(Eval("_imageid").ToString()) %>' runat="server" style=" width:160px; height:200px;" /></a></div>
                   <div style=" padding-left:42px; " ><img src="images/1263192879102787928.gif" title="NEW" border="0"></div>
                   <div style=" padding-left:53px; " ><%#Eval("_title") %></div>
                   <div class="tit"><a href="#" target="_blank"></a></div><div style=" padding-left:48px; " >
                   ￥<%#Eval(" _localprice ","{0:N2}")%></div>
               </div>
               </ItemTemplate>
             </asp:DataList>                               
    </div>
</div>
</asp:Content>

