<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyPage.aspx.cs" Inherits="MyPage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=title%></title>
    <style type="text/css">
        .bottom{width:1000px; height:600px}
    </style> <script type="text/javascript" src="aui-artDialog/jquery.js"></script>
	 <script type="text/javascript">
	 var date = "";
	 var payway = "";
        $(function(){
		    //ajax调用不使用缓存
			$.ajaxSetup({cache:false});
		});
		
		function loadpage(url, title){
		    $("#iframe").attr("src", url);
		     $("#title").html(title);
		}
    </script>
</head>
<body style="font-size:14px; background-color:#fff; padding-top:30px">
    <form id="form1" runat="server">
     <div style="width:100%; height:70px; border-bottom:2px solid #f18200">
            <center>
                <div style=" width:1000px">
                <div style="float:left"><a href="Default.aspx"><img src="Images/xinxinlogo2.png" alt="" border="0" /></a></div>
                <div id="title" style="float:left; font-size:16px; font-weight:bold; color:#444444; padding-left:20px; line-height:60px"><%=title%></div>
                </div>
            </center>
        </div>
    <center>
    <div class="bottom">
        <iframe id="iframe" name="iframe" width="100%" height="99.5%" marginheight="0" frameborder="0" src="<%=page %>" scrolling="yes"></iframe>
    </div>
    </center>
    </form>
</body>
</html>
