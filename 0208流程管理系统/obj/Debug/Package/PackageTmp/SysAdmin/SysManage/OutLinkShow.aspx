<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutLinkShow.aspx.cs" Inherits="AllPower.Web.Admin.OutLinkShow" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>外部链接栏目</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="con">
            <div id="panel">

                <br />
                <br />
                <br />
                 <div style="padding:20px">外部链接栏目，链接地址是：<a href="<%=OutUrl %>" target="_blank" style="color:Blue"><%=OutUrl %></a></div>
                <br />
                <br />

            </div>
        </div>
        </div>
    </form>
</body>
</html>
