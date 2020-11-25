<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>网络在线考试系统</title>

</head>
<FRAMESET border=0 name=main frameSpacing=0 rows=91,* frameBorder=NO cols=*>
  <FRAME name=topFrame src="top.aspx" noResize scrolling=no>
  <FRAMESET id=setyou border=0 frameSpacing=1 rows=* frameBorder=no cols=150,10,*,10,198>
    <FRAME name=leftFrame src="mygo.aspx" noResize scrolling=no>
    <FRAME name=midFrame src="mid.htm" noResize scrolling=no>
    <FRAMESET border=0 frameSpacing=0 rows=*,23 frameBorder=NO>
      <FRAME name=fs_main src="sy.aspx" noResize scrolling=yes>
      <FRAME src="myol.htm" scrolling=no>
    </FRAMESET>
    
  
</FRAMESET>
<noframes></noframes>
</HTML>
