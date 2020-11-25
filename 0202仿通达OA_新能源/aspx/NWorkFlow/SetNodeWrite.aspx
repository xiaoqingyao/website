<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetNodeWrite.aspx.cs" Inherits="OA.aspx.NWorkFlow.SetNodeWrite" %>
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
<body>
    <form id="form1" runat="server">
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style=" height: 30px;">&nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;流程定义&nbsp;>>&nbsp;设置可写字段
                </td>
                <td align="right" valign="middle" style=" height: 30px;">
                    &nbsp;
<asp:Button ID="iButton1" runat="server" CssClass="btn btn-blue" Text="提交" OnClick="iButton1_Click" />
                    
                    &nbsp;<button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">返回</button></td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
<table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1">
	<tr>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center;" >
        <table bgcolor="#999999" border="0" cellpadding="2" cellspacing="1" style="width: 600px">
            <tr>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    <strong>备选字段列表</strong></td>
                <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    <strong>已选字段列表</strong></td>
            </tr>
            <tr>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    <asp:ListBox ID="ListBox1" runat="server" Height="310px" SelectionMode="Multiple"
                        Width="210px"></asp:ListBox></td>
                <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7; text-align: center">
                    
<asp:ImageButton ID="iButton2" runat="server" Height="40px" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/Right.gif" OnClick="iButton2_Click" ToolTip="添加到已选项" />
                    <br />
                    <br />
                    
<asp:ImageButton ID="iButton3" runat="server" Height="40px" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/Left.gif" OnClick="iButton3_Click" ToolTip="删除已选项" /></td>
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
