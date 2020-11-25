<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NetEmailView.aspx.cs" Inherits="OA.aspx.NetMail.NetEmailView" %>
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
      function DownloadFile(FileURL)   //下载附件
      {
          document.getElementById("hdnFileURL").value = FileURL;
          document.getElementById("btnDownloadFile").click();
      }
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <input id="hdnFileURL" runat="server" type="hidden" />
    <div style="width: 0px; height: 0px; display: none;">
        <asp:Button ID="btnDownloadFile" Width="0px" Height="0px" runat="server" Text="Button"
            OnClick="btnDownloadFile_Click" />
    </div>
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style=" height: 30px;">&nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;Internet邮件&nbsp;>>&nbsp;查看邮件
                </td>
                <td align="right" valign="middle" style=" height: 30px;"><button type="button" class="btn btn-blue" onclick="javascript:PrintTable()">打印</button>
                    
                    &nbsp;<button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">返回</button></td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
    <table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1">            
        
        <tr>
            <td align="right" style="width: 170px; background-color: #f9f9f7; height: 25px;" >
                邮件主题：</td>
                <td style="background-color: #ffffff; height: 25px; padding-left:5px;" >
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                发送人：</td>
            <td style="height: 25px; background-color: #ffffff; padding-left:5px;">
                <asp:Label ID="Label2" runat="server"></asp:Label>&nbsp; <a class="BlueCss" href='NetEmailAdd.aspx?Type=HuiFu&ID=<%=Request.QueryString["ID"].ToString()%>'>
                    回复</a> &nbsp; <a class="BlueCss"
                        href='NetEmailAdd.aspx?Type=ZhuanFa&ID=<%=Request.QueryString["ID"].ToString()%>'>
                       转发</a>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                接收人：</td>
            <td style="height: 25px; background-color: #ffffff; padding-left:5px;">
                <asp:Label ID="Label3" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                发送时间：</td>
            <td style="height: 25px; background-color: #ffffff; padding-left:5px;">
                <asp:Label ID="Label4" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                邮件附件：</td>
            <td style="height: 25px; background-color: #ffffff; padding-left:5px;">
                <asp:Label ID="Label5" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                邮件内容：</td>
            <td style="height: 25px; background-color: #ffffff; padding-left:5px;">
                <asp:Label ID="Label6" runat="server"></asp:Label></td>
        </tr>
        </table></div>
    </form>
</body>
</html>