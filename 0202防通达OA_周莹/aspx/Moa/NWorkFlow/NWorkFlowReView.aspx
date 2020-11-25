<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NWorkFlowReView.aspx.cs" Inherits="OA.aspx.Moa.NWorkFlow.NWorkFlowReView" %>
<HTML xmlns:vml = "urn:schemas-microsoft-com:vml">

<head id="Head1" runat="server">

<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="../../Style/WorkFlowCss/style.css" type=text/css rel=stylesheet>

<OBJECT id=vmlRender classid=CLSID:10072CEC-8CC1-11D1-986E-00A0C955B42E VIEWASTEXT></OBJECT>
<STYLE>vml\:* {FONT-SIZE: 12px; BEHAVIOR: url(#VMLRender)}</STYLE>


<SCRIPT language=javascript src="../../JS/ShowWorkFlow.js"></SCRIPT>
<META content="MSHTML 6.00.3790.3041" name=GENERATOR>

<meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />
    <link href="../../Style/Mobile/css/style.css" rel="stylesheet" media="screen" type="text/css" />

    <title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
</head>
<body  leftMargin=2 opMargin=2>
    <form id="form1" runat="server">
    <script language=javascript>
        //涓嶆樉绀烘墍鏈塉S閿欒
        function killErrors() {
            return true;
        }
        window.onerror = killErrors;
        </script>
    <div id="topbar">
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="title">
            娴佺▼鍥?/div>
    </div>
    <div id="content">
<vml:Line id=line1 
style="DISPLAY: none; Z-INDEX: 15; POSITION: absolute" to="0,0" from="0,0"><!--鐩寸嚎鍙鍖?-><vml:Stroke 
dashstyle="shortDash"></vml:Stroke></vml:Line>
<%=LineContent %>
<%=ContentLable %>
        <asp:TextBox ID="SET_SQL" runat="server" style="DISPLAY: none"></asp:TextBox>
        <asp:TextBox ID="FlowNumber" runat="server" style="DISPLAY: none"></asp:TextBox>
    </div>
    
    </form>
</body>
</html>