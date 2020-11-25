<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OA.aspx.Login" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="renderer" content="webkit">
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
        <title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
        <link rel="stylesheet" href="../../css/login.css" />
   </head>

    <body onload="javascript:document.form1.PASSWORD.focus();" scroll="auto">
        <form name="form1" action="login.aspx" autocomplete="off" method="post">
            <div id="center">
                <div id="form">
                     <div class="inputer">
                         <div class="user">
                             <input type="text" id="TxtUserName" runat="server" class="text" name="UNAME" maxlength="20" onmouseover="this.focus()" onfocus="this.select()" value="">
                         </div>
                         <div class="pwd">
                             <input type="password" id="TxtUserPwd" runat="server" class="text" name="PASSWORD" onmouseover="this.focus()" onfocus="this.select()" value="" />
                        </div>
                        <div class="btn">
                            <input type="hidden" name="encode_type" value="1">
                            <input id="btnSubmit"  onmouseenter="addClass(this,'submit-hover');" onmouseout="removeClass(this,'submit-hover');" type="submit" class="submit" value="" />
                        
                        
                        </div>
                         <div style="font-size:15px; color:red; margin-left:-90px; ">
                            提醒：现程序为测试程序，程序数据为测试数据，正式运行后将全部清除。
                        </div> 
                     </div>
                   
                </div>
                <div class="clear"></div>
                <div class="bg-item-1"></div>
                <div class="bg-item-2"></div>
            </div>
        </form>
    </body>

    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../../common-js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
    <script>
        function addClass(el, className) {
            var element = el;
            if (element.className == "") {
                element.className = className;
            } else {
                element.className += " " + className;
            }
        }

        function removeClass(el, className) {
            var element = el;
            var originClassName = element.className;
            var index = originClassName.indexOf(className);
            element.className = originClassName.slice(0, index) + originClassName.slice(index + className.length + 1);
            //element.className = element.className.trim();
            if (element.className.charAt(element.className.length - 1) == " ") {
                element.className = element.className.slice(0, element.className.length - 1);
            }
        }

    </script>

</html>

