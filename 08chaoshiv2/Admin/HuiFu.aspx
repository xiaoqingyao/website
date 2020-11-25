<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HuiFu.aspx.cs" Inherits="HuiFu" %>

<%@ Register Assembly="DotNetTextBox" Namespace="DotNetTextBox" TagPrefix="DNTB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
 
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dntb:webeditor id="WebEditor1" runat="server"></dntb:webeditor>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="回复" /></div>
    </form>
</body>
</html>
