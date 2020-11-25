<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Left.aspx.cs" Inherits="AllPower.Web.Admin.console.left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>menu</title>
<link rel="stylesheet" type="text/css" href="base.css" />
    <script type="text/javascript" src="dtree.js"></script>
     <script type="text/javascript" src="../JS/jquery-3.2.min.js"></script>

</head>
<body id="leftPage" style="overflow-x:auto;overflow-y:auto; width:260px;">
<form id="formleft" runat="server">
<div id="getscroll" style="overflow:auto;width:180px"> 
<br>
切换站点:<asp:DropDownList ID="ddlChangeSite" runat="server" AutoPostBack="true" 
        onselectedindexchanged="ddlChangeSite_SelectedIndexChanged"></asp:DropDownList>
<div class="dtree" style="margin-left:8px;">
<%--<h4><%=strTopName%></h4>--%>
<script type="text/javascript">
	<!--
    //createTree(Tree);
    //setOpenNodes('<%=Request.QueryString["moduleCode"] %>');
    

        d = new dTree('d','');
        d.add(0,-1,'管理系统');
        <%=strTree%>
        document.write(d);
        <%if (Request.QueryString["parentNo"]!="00"){ %>
        d.openAll1();
        <%} %>
        d.closeLevel("10");
        function closeMenu()
        {
            d.closeAll();
        }
		//-->
    </script>
    <p style="padding-left:30px;"><a href="javascript: d.openAll();">展开全部</a> | <a href="javascript: d.closeAll();">收起全部</a></p>
    

</div>
</div>
</form>
<script language="javascript">
<%if(!string.IsNullOrEmpty(curLink)){ %>
    parent.frameRight.location.href = '<%=curLink %>';
<%} %>
document.getElementById("getscroll").style.height=parent.document.getElementById("leftMenu").style.height;
</script>
</body>
</html>
