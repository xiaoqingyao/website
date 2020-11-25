<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sy.aspx.cs" Inherits="sy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title><link href="images/skin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><span class="left_bt">感谢您使用 著名旅游管理系统 管理系统 </span><br>
        <br>
      <span class="left_txt">&nbsp;<img src="images/ts.gif" width="16" height="16"> 提示：<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="left_txt"><br>
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;旅行让你感知一个迷茫的世界，顺其自然而无所畏惧的未知的世界，也许你现在的你还是一个井底之蛙，还生活在属于自己的那一片天。旅行，它是一种看到世界的方式，他也是能让我们的视野更加开拓，想问题看问题的，视角也会更加的广。　 <br>
          </span></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><!--JavaScript部分-->

        <TABLE width=72% border=0 cellPadding=0 cellSpacing=0 id=secTable>
          <TBODY>
            <TR align=middle height=20>
              <TD align="center" class=sec1 >系统说明</TD>
            </TR>
          </TBODY>
        </TABLE>
      <TABLE class=main_tab id=mainTable cellSpacing=0
cellPadding=0 width=100% border=0>
          <!--关于TBODY标记-->
          <TBODY style="DISPLAY: block">
            <TR>
              <TD vAlign=top align=middle><TABLE width=98% border=0 align="center" cellPadding=0 cellSpacing=0>
                <TBODY>
                  <TR>
                    <TD colspan="3"></TD>
                  </TR>
                  <TR>
                    <TD height="5" colspan="3"></TD>
                  </TR>
                  <TR>
                    <TD width="4%" background="images/news-title-bg.gif"></TD>
                    <TD width="91%" background="images/news-title-bg.gif" class="left_ts" align="left">程序说明：</TD>
                    <TD width="5%" background="images/news-title-bg.gif" class="left_txt">&nbsp;</TD>
                  </TR>
                  <TR>
                    <TD bgcolor="#FAFBFC">&nbsp;</TD>
                    <TD bgcolor="#FAFBFC" class="left_txt" align="left"><span class="left_ts">1、</span>开发人员：xxxxxxx</TD>
                    <TD bgcolor="#FAFBFC" class="left_txt">&nbsp;</TD>
                  </TR>
                  <TR>
                    <TD bgcolor="#FAFBFC">&nbsp;</TD>
                    <TD bgcolor="#FAFBFC" class="left_txt" align="left"><span class="left_ts">2、</span>指导老师：xxxxx</TD>
                    <TD bgcolor="#FAFBFC" class="left_txt">&nbsp;</TD>
                  </TR>
                  <TR>
                    <TD bgcolor="#FAFBFC">&nbsp;</TD>
                    <TD bgcolor="#FAFBFC" class="left_txt" align="left"><span class="left_ts">3、</span> 开发日期：<%=DateTime.Now.Date.ToShortDateString().ToString().Trim() %></TD>
                    <TD bgcolor="#FAFBFC" class="left_txt">&nbsp;</TD>
                  </TR>
                  <TR>
                    <TD bgcolor="#FAFBFC">&nbsp;</TD>
                    <TD bgcolor="#FAFBFC" class="left_txt" align="left"><span class="left_ts">4、</span>所在学院：xxxxxxxxxxxx</TD>
                    <TD bgcolor="#FAFBFC" class="left_txt">&nbsp;</TD>
                  </TR>
                  <TR>
                    <TD height="5" colspan="3"></TD>
                  </TR>
                </TBODY>
              </TABLE></TD>
            </TR>
          </TBODY>
         
      </TABLE></td>
  </tr>
  <tr>
    <td height="40" colspan="2"><table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
      <tr>
        <td></td>
      </tr>
    </table></td>
  </tr>

</table></div>
    </form>
</body>
</html>
