<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportViewData.aspx.cs" Inherits="OA.aspx.ReportCenter.ReportViewData" %>
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
                <td valign="middle" style=" height: 30px; width: 202px;">&nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;报表管理&nbsp;>>&nbsp;查看报表
                </td>
                <td align="right" style="width: 242px;  height: 30px"
                    valign="middle">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">电子表格</asp:ListItem>
                        <asp:ListItem>网页HTM</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td align="right" style="width: 57px;  height: 30px;
                    text-align: left" valign="middle">
                    &nbsp;
<asp:Button ID="iButton2" runat="server" CssClass="btn btn-aqua" Text="导出" OnClick="iButton2_Click" /></td>
                <td align="right" valign="middle" style=" height: 30px;">
                    <button type="button" class="btn btn-blue" onclick="javascript:PrintTable()">打印</button>&nbsp;<button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">返回</button></td>
            </tr>
            <tr>
            <td height="3px" colspan="4" style="background-color: #ffffff"></td>
        </tr>
        </table>
<asp:GridView ID="GVData" CssClass="gridview_m"  runat="server" BorderStyle="Groove"
            BorderWidth="1px" Width="100%">
            <PagerSettings Mode="NumericFirstLast" Visible="False" />
            <RowStyle Height="25px" HorizontalAlign="Center" />
            <EmptyDataTemplate>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="center" style="border-right: black 1px; border-top: black 1px; border-left: black 1px;
                            border-bottom: black 1px; background-color: #f9f9f7;">
                            该列表中暂时无数据！</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <PagerStyle BackColor="LightSteelBlue" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#F3F3F3" Font-Size="12px" ForeColor="Black" Height="30px" />
            <AlternatingRowStyle BackColor="#f9f9f7" />
        </asp:GridView>
		</div>
	</form>
</body>
</html>
