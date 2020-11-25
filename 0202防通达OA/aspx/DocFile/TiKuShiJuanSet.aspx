<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TiKuShiJuanSet.aspx.cs" Inherits="OA.aspx.DocFile.TiKuShiJuanSet" %>
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
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;试卷管理&nbsp;>>&nbsp;题目设置
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
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
        题目选择：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <table bgcolor="#999999" border="0" cellpadding="2" cellspacing="1" style="width: 600px">
            <tr>
                <td colspan="3" style="padding-left: 5px; height: 38px; background-color: #ffffff;
                    text-align: center">
                    选择题库：<asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                    类别：<asp:Label ID="Label1" runat="server"></asp:Label>
                                &nbsp; &nbsp;标题：<asp:TextBox ID="TextBox3" runat="server" Height="30px" Width="94px"></asp:TextBox>
<asp:Button ID="iButton4" runat="server" CssClass="btn btn-blue" Text="查询" OnClick="iButton4_Click" />
                    <asp:TextBox ID="TextBox4" runat="server" Enabled="False" Height="0px" Width="0px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    <strong>备选题目列表</strong></td>
                <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                    <strong>已选题目列表</strong></td>
            </tr>
            <tr>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                                <asp:ListBox ID="ListBox1" runat="server" Height="300px" SelectionMode="Multiple"
                                    Style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                                    border-bottom: gray 1px solid" Width="300px"></asp:ListBox></td>
                <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7; text-align: center">
                                
<asp:ImageButton ID="iButton2" runat="server" CausesValidation="False" ImageUrl="../../images/AddTo.gif" OnClick="iButton2_Click" ToolTip="选中加入" /><br />
                    <br />
                                
<asp:ImageButton ID="iButton3" runat="server" CausesValidation="False" ImageUrl="../../images/AddAll.gif" OnClick="iButton3_Click" ToolTip="全部加入" /><br />
                    <br />
                                
<asp:ImageButton ID="iButton40" runat="server" CausesValidation="False" ImageUrl="../../images/Remove.gif" OnClick="iButton40_Click" ToolTip="选中去除" /><br />
                    <br />
                                
<asp:ImageButton ID="iButton5" runat="server" CausesValidation="False" ImageUrl="../../images/RemoveAll.gif" OnClick="iButton5_Click" ToolTip="全部去除" /></td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff; text-align: center">
                                <asp:ListBox ID="ListBox2" runat="server" Height="300px" SelectionMode="Multiple"
                                    Style="border-right: gray 1px solid; border-top: gray 1px solid; border-left: gray 1px solid;
                                    border-bottom: gray 1px solid" Width="300px"></asp:ListBox></td>
            </tr>
            <tr>
                <td colspan="3" style="padding-left: 5px; height: 36px; background-color: #ffffff;
                    text-align: center">
                    <strong>点击条目时，可以组合CTRL或SHIFT键进行多选</strong></td>
            </tr>
        </table>
	</td></tr>
</table>
		</div>
	</form>
</body>
</html>
