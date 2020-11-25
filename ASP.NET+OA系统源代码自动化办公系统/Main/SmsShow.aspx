<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SmsShow.aspx.cs" Inherits="Main_SmsShow" %>
<html>
	<head>
		<title>新邮件提醒</title>
		<base target=_self />		
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
<SCRIPT language=JavaScript>
TimeStart=20;
function MyTimer()
{
   if(TimeStart==0)
      window.close();

   if(document.getElementById("TimeShow"))
      document.getElementById("TimeShow").innerHTML=TimeStart;
   TimeStart--;

   var timer=setTimeout("MyTimer()",1000);
}

</SCRIPT>
</head>
<body onload="MyTimer();">
    <form id="form1" runat="server">
    <div>
    <TABLE width="100%" align=center>
  <TBODY>
  <TR>
    <TD>
      <TABLE class=TableHeader cellSpacing=0 cellPadding=3 width="100%" 
border=0>
        <TBODY>
        <TR>
          <TD><IMG alt=个人短信 src="../images/comm.gif" align=absMiddle width="16"> 
            个人短信<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="0" height="0"><param name="movie" value="../Flash/Sms.swf"><param name="quality" value="high"><param name="wmode" value="transparent"><embed src="../Flash/Sms.swf" width="0" height="0" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed></object></TD>
          <TD class=small align=right>共 &nbsp;<SPAN class=big4><a target="rform" onclick='window.close();' href="../LanEmail/LanEmailShou.aspx" ><asp:Label
              ID="Label1" runat="server" Text="0" Font-Bold="True" ForeColor="Red"></asp:Label></a>
              </SPAN>封新邮件 窗口<SPAN 
            id=TimeShow 
            style="FONT-WEIGHT: bold; COLOR: #ff0000"></SPAN>&nbsp;秒后关闭
        </TD></TR></TBODY></TABLE></TD></TR>
  <TR class=TableData>
    <TD>
      <TABLE class=small cellSpacing=0 cellPadding=5 width="100%" border=0>
        <TBODY>
        <TR>
          <TD style="COLOR: #0000ff">
              <asp:Label ID="Label2" runat="server" Text="发送人"></asp:Label>&nbsp;&nbsp;<asp:Label
                  ID="Label3" runat="server" Text="发送时间"></asp:Label></TD>
          <TD style="COLOR: #0000ff" align=right>收信人：<asp:Label ID="Label4" runat="server" Text="收信人"></asp:Label></TD></TR>
        <TR vAlign=top height=40>
          <TD colSpan=2>
              <asp:Label ID="Label5" runat="server" Text="标题"></asp:Label><hr/>
              <asp:Label ID="Label6" runat="server" Text="内容"></asp:Label></TD>
        </TR>
        <TR>
          <TD colSpan=2>
            <DIV align=right>
                <asp:Label ID="Label7" runat="server" Text="EmailID" Visible="False"></asp:Label>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='javascript:void(0);'
                    onclick="window.close();">关闭</asp:HyperLink>
                &nbsp;
                <asp:LinkButton ID="LinkButton4"  runat="server" OnClick="LinkButton4_Click">我知道了</asp:LinkButton>&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="../LanEmail/LanEmailShou.aspx" onclick='window.close();' Target="rform">查看详情</asp:HyperLink>&nbsp;&nbsp; 
           <asp:LinkButton ID="LinkButton1"  runat="server" OnClick="LinkButton1_Click">删除</asp:LinkButton>&nbsp;&nbsp; 
            </DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
    </div>
    </form>
</body>
</html>