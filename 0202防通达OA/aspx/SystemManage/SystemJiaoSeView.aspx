<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemJiaoSeView.aspx.cs" Inherits="OA.aspx.SystemManage.SystemJiaoSeView" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
  <LINK href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
  <script language="javascript">
      function PrintTable() {
          document.getElementById("PrintHide").style.visibility = "hidden"
          print();
          document.getElementById("PrintHide").style.visibility = "visible"
      }
  </script>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style=" height: 30px;">&nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;系统管理&nbsp;>>&nbsp;查看角色
                </td>
                <td align="right" valign="middle" style=" height: 30px;">
                    &nbsp;<img class="HerCss" onclick="PrintTable()" src="../../images/Button/BtnPrint.jpg" id="IMG1" />&nbsp;
                    &nbsp;
                    &nbsp;<button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">返回</button></td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
    <table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1">            
        
        <tr>
            <td align="right" style="width: 170px; background-color: #f9f9f7; height: 25px;" >
                角色名称：</td>
                <td style="background-color: #ffffff; height: 25px; padding-left:5px;" >
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                备注信息：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:Label ID="Label2" runat="server"></asp:Label></td>
        </tr>        
        <tr>
            
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                权限配置：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                </td>
        </tr>
        </table></div>
        <table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1">
        <tr>
            
            <td align="center" style="height: 25px; background-color: #ffffff">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="8" RepeatDirection="Horizontal" Width="100%">
                   
                </asp:CheckBoxList></td>
        </tr>
        </table>
                
    </form>
</body>
</html>