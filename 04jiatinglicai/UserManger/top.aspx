<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top.aspx.cs" Inherits="Admin_top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>家庭理财管理系统</title>
    <link rel="stylesheet" href="../CSS/style.css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            //顶部导航切换
            $(".nav li a").click(function () {
                $(".nav li a.selected").removeClass("selected")
                $(this).addClass("selected");
            })
        })
        function showJs() {
            window.showModalDialog("../jisuanqi/index.html");
        }
       
    </script>
</head>
<body style="background: url(images/topbg.gif) repeat-x;">
    <form id="form1" runat="server">
        <div style="margin-left: 30px; margin-top: 33px; float: left">
            <a href="main.html" target="_parent" style="font-size: 33px; color: white; line-height: inherit;">家庭理财管理系统</a>
        </div>
        <div style="float: left; margin-left: 297px; margin-top: 58px; width: 62px; color:white; font-size: 18px;">
            <a href="#" onclick="showJs()">计算器 </a>
        </div>
          <div style="float: left; margin-left: 97px; margin-top: 58px;width: 80px;">
            <a href="#" >房贷计算器</a>
        </div>
        <div style="float: left; margin-left: 70px; margin-top: 58px;">
            <asp:Label ID="Label2" runat="server" Text="Label" Font-Size="17px"></asp:Label>
        </div>
        <div style="float: left; margin-left: 70px; margin-top: 58px;">
            <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="17px"></asp:Label>
        </div>
        <div style="float: left; margin-left: 70px; margin-top: 58px;">
            <div><a href="../Login.aspx" target="_parent" style="color: white; font-size: 17px;">退出</a></div>

        </div>

        <%--<div class="topright">    
    <ul>
    <li><span></span><a href="#"> </a></li>
    <li><a href="#"> </a></li>
    <li><a href="../Login.aspx" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span> <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span>
       
    </div>    
    
    </div>--%>
    </form>
</body>
</html>
