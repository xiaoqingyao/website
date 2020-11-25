<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TiKuKaoShiViewSP.aspx.cs" Inherits="DocFile_TiKuKaoShiViewSP" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
  <script language="javascript">
  function PrintTable()
    {
        document.getElementById("PrintHide") .style.visibility="hidden"    
        print();
        document.getElementById("PrintHide") .style.visibility="visible"    
    }
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">&nbsp;<img src="../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;在线考试&nbsp;>>&nbsp;人工阅卷
                </td>
                <td align="right" valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/Submit.jpg"
                        OnClick="ImageButton1_Click" />
                    <img src="../images/Button/JianGe.jpg" />&nbsp;
                    <img class="HerCss" onclick="javascript:window.history.go(-1)" src="../images/Button/BtnExit.jpg" />&nbsp;</td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
<table style="width: 100%" bgcolor="#999999" border="0" cellpadding="2" cellspacing="1">
	<tr>
	<td style="width: 180px; height: 25px; background-color: #D6E2F3" align="right">
		用户名：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblUserName" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 180px; height: 25px; background-color: #D6E2F3" align="right">
		考试时间：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblTimeStr" runat="server"></asp:Label>
        <asp:Label ID="Label2" runat="server" Height="0px" Width="0px" Visible="False"></asp:Label></td></tr>
	<tr>
	<td style="width: 180px; height: 25px; background-color: #D6E2F3" align="right">
		所用试卷：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblShiJuanName" runat="server"></asp:Label>
        &nbsp;<span style="color: #cc0000"> 注：人工阅卷只显示简答题</span></td></tr>
	<tr>
	<td style="width: 180px; height: 25px; background-color: #D6E2F3" align="right">
        试卷答题详细情况：</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:Label ID="Label1" runat="server"></asp:Label></td></tr>
</table>
		</div>
	</form>
</body>
</html>
