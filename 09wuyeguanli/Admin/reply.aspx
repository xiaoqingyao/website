<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reply.aspx.cs" Inherits="reply" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>留言簿</title>
</head>
<body>
<p align="center">
<strong><font color="green">留言回复</font></strong>
</p>
<center>
    <form id="form1" runat="server">
    <div>
      <table border="1" width="500">
       <tr>
          <td align="center" bgcolor="#2CACFC" colspan="4"><small><font color='white'>[回复留言]</font></small></td>
        </tr>
        <tr height="25">
          <td width="17%" align="right" valign="top" bgcolor="#F0F8FF"><small><font color='black'>  回复主题：</font></small></td>
          <td bgcolor="#F0F8FF"><small><font color='black'><%=StrTitle%> </font></small></td>
        </tr>
        <tr height="40">
          <td align="right"  valign="top" bgcolor="#F0F8FF" ><small><font color='black'>主题内容：</font></small></td>
          <td bgcolor="#F0F8FF"><small><font color='black'><%= StrContent%></font></small></td>
        </tr>
        <tr>
          <td align="right" valign="top"  bgcolor="#F0F8FF"><small><font color='black'>回复内容：</font></small></td>
          <td bgcolor="#F0F8FF"> 
            <asp:textbox backcolor="#F0F8FF" id="Content" textmode="multiline" columns="45" rows="6" runat="server" />
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center" height="30" valign="bottom" bgcolor="#F0F8FF" >
            <asp:button id="sure" onclick="sure_click" text="确 定" runat="server" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:button id="clear" onclick="Clear_click" text="清 空" runat="server" />
          </td>
        </tr>
      </table>
  <span id="span1" runat="server" />
    </div>
    </form></center>
</body>
</html>
