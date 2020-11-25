<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TiKuShiJuanAdd.aspx.cs" Inherits="DocFile_TiKuShiJuanAdd" %>
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
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;试卷管理&nbsp;>>&nbsp;添加信息
                </td>
                <td align="right" valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/Submit.jpg"
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
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		试卷标题：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtShiJuanTitle" runat="server" Width="350px"></asp:TextBox>
		<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtShiJuanTitle" ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		是否随机出题：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>是</asp:ListItem>
            <asp:ListItem Selected="True">否</asp:ListItem>
        </asp:RadioButtonList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		题目显示顺序：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <table bgcolor="#999999" border="0" cellpadding="2" cellspacing="1" style="width: 100px">
            <tr>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    <asp:ListBox ID="ListBox2" runat="server" BackColor="White" Height="100px" Rows="5"
                        Width="100px">
                        <asp:ListItem>判断题</asp:ListItem>
                        <asp:ListItem>单项选择题</asp:ListItem>
                        <asp:ListItem>多项选择题</asp:ListItem>
                        <asp:ListItem>填空题</asp:ListItem>
                        <asp:ListItem>简答题</asp:ListItem>
                    </asp:ListBox></td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" Height="20px"
                        ImageAlign="AbsMiddle" ImageUrl="~/images/Button/Up.gif" OnClick="ImageButton4_Click"
                        ToolTip="顺序提升向前" Width="20px" />
                    <br />
                    <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" Height="20px"
                        ImageAlign="AbsMiddle" ImageUrl="~/images/Button/Down.gif" OnClick="ImageButton5_Click"
                        ToolTip="顺序下降向后" Width="20px" /></td>
            </tr>
        </table>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		考试限时（分）：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtKaoShiXianShi" runat="server" Width="350px">120</asp:TextBox>
        分钟<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtKaoShiXianShi"
            Display="Dynamic" ErrorMessage="*该项不可为空"></asp:RequiredFieldValidator><asp:RangeValidator
                ID="RangeValidator1" runat="server" ControlToValidate="txtKaoShiXianShi" ErrorMessage="*必须为有效数字"
                MaximumValue="1000000" MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		判断题每题分数：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtPanDuanFenShu" runat="server" Width="350px">1</asp:TextBox>
        分<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPanDuanFenShu"
            Display="Dynamic" ErrorMessage="*该项不可为空"></asp:RequiredFieldValidator><asp:RangeValidator
                ID="RangeValidator2" runat="server" ControlToValidate="txtPanDuanFenShu" ErrorMessage="*必须为有效数字"
                MaximumValue="1000000" MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		单选题每题分数：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtDanXuanFenShu" runat="server" Width="350px">1</asp:TextBox>
        分<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDanXuanFenShu"
            Display="Dynamic" ErrorMessage="*该项不可为空"></asp:RequiredFieldValidator><asp:RangeValidator
                ID="RangeValidator3" runat="server" ControlToValidate="txtDanXuanFenShu" ErrorMessage="*必须为有效数字"
                MaximumValue="1000000" MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		多选题每题分数：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtDuoXuanFenShu" runat="server" Width="350px">2</asp:TextBox>
        分<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDuoXuanFenShu"
            Display="Dynamic" ErrorMessage="*该项不可为空"></asp:RequiredFieldValidator><asp:RangeValidator
                ID="RangeValidator4" runat="server" ControlToValidate="txtDuoXuanFenShu" ErrorMessage="*必须为有效数字"
                MaximumValue="1000000" MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		填空题每题分数：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtTianKongFenShu" runat="server" Width="350px">1</asp:TextBox>
        分<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTianKongFenShu"
            Display="Dynamic" ErrorMessage="*该项不可为空"></asp:RequiredFieldValidator><asp:RangeValidator
                ID="RangeValidator5" runat="server" ControlToValidate="txtTianKongFenShu" ErrorMessage="*必须为有效数字"
                MaximumValue="1000000" MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		简答题每题分数：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtJianDaFenShu" runat="server" Width="350px">10</asp:TextBox>
        分<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtJianDaFenShu"
            Display="Dynamic" ErrorMessage="*该项不可为空"></asp:RequiredFieldValidator><asp:RangeValidator
                ID="RangeValidator6" runat="server" ControlToValidate="txtJianDaFenShu" ErrorMessage="*必须为有效数字"
                MaximumValue="1000000" MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		备注说明：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtBackInfo" runat="server" Width="350px"></asp:TextBox></td></tr>
</table>
		</div>
	</form>
</body>
</html>
