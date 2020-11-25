<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowWorkFlow.aspx.cs" Inherits="WorkFlow_ShowWorkFlow" %>
<HTML xmlns:vml = "urn:schemas-microsoft-com:vml">
<head id="Head1" runat="server">

<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="../Style/WorkFlowCss/style.css" type=text/css rel=stylesheet>

<OBJECT id=vmlRender classid=CLSID:10072CEC-8CC1-11D1-986E-00A0C955B42E VIEWASTEXT></OBJECT>
<STYLE>vml\:* {FONT-SIZE: 12px; BEHAVIOR: url(#VMLRender)}</STYLE>



<SCRIPT language=javascript src="../JS/WorkFlow.js"></SCRIPT>
<META content="MSHTML 6.00.3790.3041" name=GENERATOR>
    <title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
</head>
<body oncontextmenu=nocontextmenu(); onmousedown=DoRightClick(); leftMargin=2 opMargin=2>
    <form id="form1" runat="server">
    <script language=javascript>
		//不显示所有JS错误
        function killErrors() 
        {
            return true;
        }
        window.onerror =killErrors;
        </script>
<vml:Line id=line1 
style="DISPLAY: none; Z-INDEX: 15; POSITION: absolute" to="0,0" from="0,0"><!--直线可视化--><vml:Stroke 
dashstyle="shortDash"></vml:Stroke></vml:Line>
<%=LineContent %>
<%=ContentLable %>
 
        <asp:TextBox ID="SET_SQL" runat="server" style="DISPLAY: none"></asp:TextBox>
        <asp:TextBox ID="FlowNumber" runat="server" style="DISPLAY: none"></asp:TextBox>
    </form>
</body>
</html>