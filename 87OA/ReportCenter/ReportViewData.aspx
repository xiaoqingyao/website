<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportViewData.aspx.cs" Inherits="ReportCenter_ReportViewData" %>
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
                <td valign="middle" style="border-bottom: #006633 1px dashed; height: 30px; width: 202px;">&nbsp;<img src="../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;报表管理&nbsp;>>&nbsp;查看报表
                </td>
                <td align="right" style="width: 242px; border-bottom: #006633 1px dashed; height: 30px"
                    valign="middle">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">电子表格</asp:ListItem>
                        <asp:ListItem>网页HTM</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td align="right" style="width: 57px; border-bottom: #006633 1px dashed; height: 30px;
                    text-align: left" valign="middle">
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" ImageAlign="AbsMiddle"
                        ImageUrl="../images/Button/BtnReport.jpg" OnClick="ImageButton2_Click" /></td>
                <td align="right" valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    <img class="HerCss" onclick="PrintTable()" src="../images/Button/BtnPrint.jpg" />&nbsp;<img src="../images/Button/JianGe.jpg" />&nbsp;<img class="HerCss" onclick="javascript:window.history.go(-1)" src="../images/Button/BtnExit.jpg" />&nbsp;</td>
            </tr>
            <tr>
            <td height="3px" colspan="4" style="background-color: #ffffff"></td>
        </tr>
        </table>
<asp:GridView ID="GVData" runat="server" BorderStyle="Groove"
            BorderWidth="1px" Width="100%">
            <PagerSettings Mode="NumericFirstLast" Visible="False" />
            <RowStyle Height="25px" HorizontalAlign="Center" />
            <EmptyDataTemplate>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="center" style="border-right: black 1px; border-top: black 1px; border-left: black 1px;
                            border-bottom: black 1px; background-color: whitesmoke;">
                            该列表中暂时无数据！</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <PagerStyle BackColor="LightSteelBlue" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#F3F3F3" Font-Size="12px" ForeColor="Black" Height="20px" />
            <AlternatingRowStyle BackColor="WhiteSmoke" />
        </asp:GridView>
		</div>
	</form>
</body>
</html>
