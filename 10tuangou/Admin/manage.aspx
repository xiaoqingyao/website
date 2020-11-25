<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage.aspx.cs" Inherits="Admin_manage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
      <title>系统管理平台</title>
</head>
	<frameset rows="60,81%" border="0" frameSpacing="0" frameBorder="0">
		<frame name="Top" src=topMenu.aspx scrolling="no" noresize>
		<frameset cols="200,100%" id="frame">
			<frame name="Left" src="leftMenu.aspx">
			<frame name="main" src=welcome.aspx>
		</frameset>
	</frameset><noframes></noframes>
</html>
