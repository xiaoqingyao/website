<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Main_About" %>
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
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;系统组件
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
	<td style="width: 232px; height: 25px; background-color: #D6E2F3" align="right">
        开发商名称：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        信息设计有限公司</td></tr>
    <tr>
        <td align="right" style="width: 232px; height: 25px; background-color: #D6E2F3">
            网址：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            http://jinmapu.taobao.com/ </td>
    </tr>
    <tr>
        <td colspan="2" style="padding-left: 5px; height: 25px; background-color: #ffffff;
            text-align: center">
            <strong>系统常用组件</strong></td>
    </tr>
    <tr>
        <td align="right" style="width: 232px; height: 25px; background-color: #D6E2F3">
            在线阅读编辑Office文件：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            微软DSO组件&nbsp; [<a class="na" href="../SetupFile/在线OfficeDSO插件.rar" target="_blank">鼠标右键点此另存为下载</a>] &nbsp; &nbsp;
        </td>
    </tr>
    <tr>
        <td align="right" style="width: 232px; height: 25px; background-color: #D6E2F3">
            Jmail收发Internet邮件：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            Jmail收发组件 [<a class="na" href="../SetupFile/收发邮件JMail44_pro.exe" target="_blank">鼠标右键点此另存为下载</a>] &nbsp; &nbsp;
        </td>
    </tr>
    <tr>
        <td align="right" style="width: 232px; height: 25px; background-color: #D6E2F3">
            微软Netmeeting程序：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            微软Netmeeting视频会议 [<a class="na" href="../SetupFile/微软网络会议NetMetting.exe" target="_blank">鼠标右键点此另存为下载</a>] &nbsp; &nbsp;
        </td>
    </tr>
    <tr>
        <td align="right" style="width: 232px; height: 25px; background-color: #D6E2F3">
            在线使用手写插件SW：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            直接使用手写功能组件&nbsp; [<a class="na" href="../SetupFile/手写插件SW.rar" target="_blank">鼠标右键点此另存为下载</a>] &nbsp; &nbsp;
        </td>
    </tr>
    <tr>
        <td align="right" style="width: 232px; height: 25px; background-color: #D6E2F3">
            特别说明：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            win7 下注册 DLL 或 OCX 文件步骤：<br />
            一：点击 "开始"—程序 - 附件 - 命令提示符， 在“命令提示符”上点击鼠标右键， 选择“以管理员身份运行”命令，这个时候将打开 Dos 命令窗口<br />
            二：执行 regsvr32.exe C:\dsoframer.ocx (前提是将dsoframer.ocx 文件复制到C盘根目录下)</td>
    </tr>
</table>
		</div>
	</form>
</body>
</html>
