<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaskPS.aspx.cs" Inherits="Subaltern_TaskHB" %>
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
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;任务分配&nbsp;>>&nbsp;任务批示
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
		任务标题：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblTaskTitle" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		任务内容：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblTaskContent" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		分配人：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblFromUser" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		执行人：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblToUserList" runat="server"></asp:Label>
	</td></tr>
    <tr>
        <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		任务进度：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblJinDu" runat="server"></asp:Label>
	</td>
    </tr>
    <tr>
        <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
            完成情况：
        </td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblWanCheng" runat="server"></asp:Label>
	</td>
    </tr>
    <tr>
        <td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		当前状态：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblNowState" runat="server"></asp:Label>
	</td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		汇报与批示：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:Label id="lblXinXiGouTong" runat="server"></asp:Label>
	</td></tr>
    <tr>
        <td colspan="2" style="padding-left: 5px; height: 25px; background-color: #ffffff;
            text-align: center">
            <strong>我的汇报</strong></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
        我的批示：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
            <asp:TextBox ID="TextBox1" runat="server" Height="60px" TextMode="MultiLine" Width="350px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1"
                Display="Dynamic" ErrorMessage="*该项必须输入"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
            任务状态：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:DropDownList ID="DropDownList1" runat="server" Width="350px">
                <asp:ListItem>任务添加</asp:ListItem>
                <asp:ListItem>等待执行</asp:ListItem>
                <asp:ListItem>正在执行</asp:ListItem>
                <asp:ListItem>任务完成</asp:ListItem>
                <asp:ListItem>任务暂停</asp:ListItem>
                <asp:ListItem>任务取消</asp:ListItem>
                <asp:ListItem>其他情况</asp:ListItem>
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
        </td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/Submit.jpg"
                OnClick="ImageButton1_Click" /></td>
    </tr>
</table>
		</div>
	</form>
</body>
</html>
