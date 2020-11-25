<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetNodeSecret.aspx.cs" Inherits="NWorkFlow_SetNodeSecret" %>
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
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;流程定义&nbsp;>>&nbsp;设置保密字段
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
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center;" >
        <table bgcolor="#999999" border="0" cellpadding="2" cellspacing="1" style="width: 600px">
            <tr>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    <strong>备选字段列表</strong></td>
                <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    <strong>已选字段列表</strong></td>
            </tr>
            <tr>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    <asp:ListBox ID="ListBox1" runat="server" Height="310px" SelectionMode="Multiple"
                        Width="210px"></asp:ListBox></td>
                <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3; text-align: center">
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="40px" ImageAlign="AbsMiddle"
                        ImageUrl="~/images/Button/Right.gif" OnClick="ImageButton2_Click" ToolTip="添加到已选项" />
                    <br />
                    <br />
                    <asp:ImageButton ID="ImageButton3" runat="server" Height="40px" ImageAlign="AbsMiddle"
                        ImageUrl="~/images/Button/Left.gif" OnClick="ImageButton3_Click" ToolTip="删除已选项" /></td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    <asp:ListBox ID="ListBox2" runat="server" Height="310px" SelectionMode="Multiple"
                        Width="210px"></asp:ListBox></td>
            </tr>
        </table>
        <strong>点击条目时，可以组合CTRL或SHIFT键进行多选</strong></td></tr>
</table>
		</div>
	</form>
</body>
</html>
