<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top.aspx.cs" Inherits="Admin_top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <title>无标题页</title>  <link  rel="stylesheet" href="../CSS/style.css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
</head>
<body style="background:url(images/topbg.gif) repeat-x;">
    <form id="form1" runat="server">
    <div class="topleft">
    <a href="main.html" target="_parent"><img src="images/logo.png" title="系统首页" /></a>
    </div>
        
   
            
    <div class="topright">    
    <ul>
    <li><span></span><a href="#"> </a></li>
    <li><a href="#"> </a></li>
    <li><a href="../Login.aspx" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span> <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span>
       
    </div>    
    
    </div>
    </form>
</body>
</html>
