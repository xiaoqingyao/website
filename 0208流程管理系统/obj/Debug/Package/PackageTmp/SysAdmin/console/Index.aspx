<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AllPower.Web.Admin.console.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>AllPower CMS -- 全能系统</title>
<link type="text/css" href="../../sysadmin/skin/green/css/style.css" rel="stylesheet" id="myskin" />
<script type="text/javascript" src="../../sysadmin/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../../sysadmin/js/init.js"></script>

<script type="text/javascript" src="../../sysadmin/js/jquery.cookie.js"></script>
<script type="text/javascript" src="../../sysadmin/js/skin.js"></script>
<script language="JavaScript">
    window.setInterval("frameFoot.location.reload()", 5 * 60 * 1000);
</script>
</head>

<body style="background:#e4e4e4">
<div id="header">
<h1>AllPower CMS -- 全能系统</h1>
<div class="headerContainer">
<div id="showNote">
<dl><dt>最新公告:</dt>
<dd>
<ul>
<asp:Repeater ID="rptMessage" runat="server">
        <ItemTemplate>
           <li><a target="frameRight" href="../../sysadmin/Model/Messageview.aspx?ID=<%#Eval("ID") %>"><%#AllPower.Common.Utils.GetSubString(Eval("Title").ToString (),30,"...")%></a> <%#String.Format("{0:yyyy-MM-dd}",Eval("publishdate")) %></li>
        </ItemTemplate>
        </asp:Repeater>
</ul>
</dd>
</dl>
<span class="skin" id="skin">
<a href="#" class="green" rel="../../sysadmin/skin/green/css/style.css">green</a>
<a href="#" class="blue" rel="../../sysadmin/skin/blue/css/style.css">blue</a>
<a href="#" class="gray" rel="../../sysadmin/skin/gray/css/style.css">gray</a>
</span>
<span class="stime" id="stime"><b><%=GetLoginAccountName()%></b>: 所属用户组:<%=strUserGrop%> </span>



</div>
<div id="nav">
    <ul class="works" >
          <li class="off"><a href="../logout.aspx" title="注销" onclick="if(!confirm('确实要注销系统吗？')){return false;}">注销</a></li>
          <li class="help"><a href="http://www.AllPower.com/feedback/index.asp" target="buttomFrame" title="帮助" target="_blank">帮助</a></li>
          <li class="home"><img src="../../sysadmin/img/home.png" width=15/> <a href="<%=GetSiteDomain() %>" target="buttomFrame" title="网站首页" target="_blank">网站首页</a></li>
    </ul>
    <ul>
      <%=strNode%>
    </ul>
    <div class="clear"></div>
  </div>
</div>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="mainTable">
  <tr valign="top">
    <td id="leftMenu"><iframe frameborder="0"  src="left.aspx?pageType=main" scrolling="no" id="frameLeft" name="frameLeft"></iframe></td>
    <td class="normal" id="mainMenu"><iframe frameborder="0" scrolling="yes" src="main.aspx" id="frameRight" name="frameRight"></iframe><div style="height:1px;width:100px"></div></td>
  </tr>
</table>
<div id="footer">
<iframe frameborder="0"  src="foot.htm" height ="100%" width ="100%" scrolling="no" id="frameFoot" name="frameFoot"></iframe></div>
    <script type="text/javascript">
        var scrollheight = 0;
        function reinitIframe() {

            var height = document.documentElement.clientHeight - 98;
            if (scrollheight != height) {
                scrollheight = height;
                try {
                    document.getElementById("mainTable").style.height = height + 'px';
                    document.getElementById("leftMenu").style.height = height + 'px';
                    document.getElementById("mainMenu").style.height = height + 'px';
                    frameLeft.document.getElementById("getscroll").style.height = height + 'px';
                } catch (ex) { }
            }
            window.setTimeout("reinitIframe()", 1000);
        }
        window.setTimeout("reinitIframe()", 500);
    </script>
</body>
</html>
