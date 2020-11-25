<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Master.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Email.Master" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
</head>
<frameset rows="*" cols="120,*" framespacing="1"> 
    <frame src="EmailMenu.aspx" cols="120"  frameborder="no" border="1" name="left" scrolling="yes" noresize="noresize" id="left" title="left" />
    <frame src="EmailList.aspx" name="main"  frameborder="no" border="1" id="main" title="main" />
</frameset>
</html>