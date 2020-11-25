<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TreeListView.aspx.cs" Inherits="SystemManage_TreeListView" %>
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
                <a class="hei" href="../Main/MyDesk.aspx">����</a>&nbsp;>>&nbsp;�˵�����&nbsp;>>&nbsp;�鿴��Ϣ
                </td>
                <td align="right" valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    <img class="HerCss" onclick="PrintTable()" src="../images/Button/BtnPrint.jpg" />
                    <img src="../images/Button/JianGe.jpg" />&nbsp;
                    <img class="HerCss" onclick="javascript:window.history.go(-1)" src="../images/Button/BtnExit.jpg" />&nbsp;</td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
<table style="width: 100%" bgcolor="#999999" border="0" cellpadding="2" cellspacing="1">
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��ʾ���֣�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblTextStr" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		����ͼƬ��
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblImageUrlStr" runat="server"></asp:Label>
	</td></tr>
    <tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		���˵���ʽ��
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblClass" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��̨��ֵ��
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblValueStr" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		���ӵ�ַ��
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblNavigateUrlStr" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		Ŀ���ܣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblTarget" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		���ڵ㣺
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblParentID" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		Ȩ�ޣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblQuanXianList" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		����
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblPaiXuStr" runat="server"></asp:Label>
	</td></tr>
</table>
		</div>
	</form>
</body>
</html>
