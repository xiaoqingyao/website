<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MobileSmsAdd.aspx.cs" Inherits="OA.aspx.Mobile.MobileSmsAdd" %>
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
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;手机短信&nbsp;>>&nbsp;新信息
                </td>
                <td align="right" valign="middle" style=" height: 30px;">
                    &nbsp; &nbsp;
                    &nbsp;<button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">返回</button></td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
    <table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1">            
        <tr>
            <td align="right" colspan="2" style="height: 25px; background-color: #f9f9f7; text-align: center">
                <strong><span style="font-size: 10pt">内部短信群发</span></strong></td>
        </tr>
        
        <tr>
            <td align="right" style="width: 170px; background-color: #f9f9f7; height: 25px;" >
                接收用户：</td>
                <td style="background-color: #ffffff; height: 25px; padding-left:5px;" >
                    <asp:TextBox ID="TextBox1" runat="server" Width="350px"></asp:TextBox>
                   <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectUser.aspx?TableName=ERPUser&LieName=UserName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox1').value=wName;}"
                    src="../../images/Button/search.gif" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="*该项不可以为空" Display="Dynamic" ValidationGroup="Neibu"></asp:RequiredFieldValidator>&nbsp;
                    <span style="color: darkgray">* 请选择用户名，用于内部人员短信</span></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                信息内容：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:TextBox ID="TextBox2" runat="server" Width="350px" Height="50px" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
            </td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                
<asp:Button ID="iButton1" runat="server" CssClass="btn btn-blue" Text="提交" OnClick="iButton1_Click" ValidationGroup="Neibu"/></td>
        </tr>
        <tr>
            <td colspan="2" style="padding-left: 5px; height: 25px; background-color: #ffffff">
            </td>
        </tr><tr>
            <td align="right" style="height: 25px; background-color: #f9f9f7; text-align: center;" colspan="2">
                <strong><span style="font-size: 10pt">外部短信群发</span></strong></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; background-color: #f9f9f7; height: 25px;" >
                接收用户：</td>
            <td style="background-color: #ffffff; height: 25px; padding-left:5px;" >
                <asp:TextBox ID="TextBox3" runat="server" Height="90px" TextMode="MultiLine" Width="350px"></asp:TextBox>
                <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectTXL.aspx?TableName=ERPUser&LieName=UserName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox3').value=wName;}"
                    src="../../images/Button/search.gif" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                    Display="Dynamic" ErrorMessage="*该项不可以为空" ValidationGroup="WaiBu"></asp:RequiredFieldValidator>&nbsp;
                <span style="color: darkgray">* 请输入手机号码列表，用 "," 分隔。</span></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                信息内容：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:TextBox ID="TextBox4" runat="server" Height="50px" TextMode="MultiLine" Width="350px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
            </td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                
<asp:Button ID="iButton2" runat="server" CssClass="btn btn-blue" Text="提交" OnClick="iButton2_Click"  ValidationGroup="WaiBu" /></td>
        </tr>
        </table></div>
    </form>
</body>
</html>