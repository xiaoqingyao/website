<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mycenter.aspx.cs" Inherits="users_mycenter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>心灵阶梯博客会员管理中心</title>
    <style type="text/css">
        .bj
        {
            background-color: #EEF2FB;
        }
    </style>
</head>
<frameset rows="68,*" frameborder="NO" border="0" class="bj" framespacing="0">
	<frame src="top.aspx" noresize="noresize" frameborder="NO" name="topFrame" scrolling="no" marginwidth="0" marginheight="0" target="main" />
  <frameset cols="200,*"  id="frame">
	<frame src="left.aspx" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" target="main" />
	<frame src="center.aspx" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" target="_self" />
  </frameset>
<noframes>
    </noframes>
</html>
