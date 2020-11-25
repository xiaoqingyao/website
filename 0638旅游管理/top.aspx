<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top.aspx.cs" Inherits="top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title><script language="javascript" src="images/qkjs.js"></script>
    <style>
* { margin:0 auto; padding:0; border:0;}
body { font:12px "宋体"; color:#FFF;}
.lable { background:url(images/top_lable.jpg) no-repeat; width:126px; height:28px; float:left;}
 .lable p { margin-top:8px;}
.menu { background:url(images/top_menu.gif) no-repeat; width:348px; height:28px; float:right;}
 .menu ul { margin:8px 0 0 45px; list-style:none;}
 .menu li { display:inline;}
 .menu a { float:left; text-decoration:none; padding-left:2px;}
 .menu a:hover {text-decoration:none;}
 .menu a span { display:block; padding-right:10px; color:#FFF; }
 .menu a:hover span { color:#004c7e; }
.menu_left { background:url(images/menu_left.jpg) no-repeat; width:155px; height:22px; float:left; margin:3px 0 0 6px; text-align:center;}
 .menu_left p { margin-top:5px;} 
.menu_list { width:100%; height:25px;}
  .menu_list ul { margin:0; padding:4px 0 0 70px; list-style:none; }
    .menu_list li { display:inline; }
    .menu_list a { float:left; text-decoration:none; }
    .menu_list a span { display:block; padding:4px 10px 0 10px; color:#004c7e; }
    .menu_list a:hover span { color:#FFF; border:1px solid #004c7e;}
   .menu_list a:hover { background:url(images/menu_list.jpg) repeat-x; }
</style>
</head>

<body>
    <form id="form1" runat="server">
    <div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/top_bg.jpg" width="289" height="57">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="62" height="56" background="images/top_lf.gif">&nbsp;</td>
          <td ><div style="margin-top: 5pt; font-weight: bold; font-size: 19pt; filter: Glow(Color=#000000,Strength=2);
                  width: 100%; color: #ffffff; font-family: 宋体">
                  <div align="center" class="STYLE5">
                      著名旅游管理系统</div>
              </div>
          </td>
        </tr>
      </table>
    </td>
    <td background="images/top_bg.jpg">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="29">&nbsp;</td>
          <td height="29">今天是：<SCRIPT language=javascript>setCalendar();</SCRIPT></td>
          <td height="29">&nbsp;</td>
        </tr>
        <tr>
          <td width="50%" height="28">
          </td>
          <td>
            <div class="menu">
              <table width="100%" height="23" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="14%">&nbsp;</td>
                  <td style="width: 33%">当前用户：<%=Session["username"].ToString().Trim() %></td>
                  <td style="width: 35%">权限：<%=Session["cx"].ToString().Trim() %></td>
                  <td width="25%"><a href="logout.aspx" target=_top><font color=white>退出</font></a></td>
                </tr>
              </table>
            </div>
          </td>
          <td width="18"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" height="25" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/menu_bg.jpg" width="165">
      <div class="menu_left">
        <p>当前用户：<%=Session["username"].ToString().Trim() %></p>
      </div>
    </td>
    <td background="images/menu_bg.jpg">
      <div class="menu_list">
        <ul>
          <li>&nbsp;</li><li>&nbsp;</li><li></li>
          <li></li>
          <li></li>
          <li></li>
        </ul>
      </div>
    </td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
