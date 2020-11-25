<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoToNextNode.aspx.cs" Inherits="OA.aspx.NWorkFlow.GoToNextNode" %>

<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
  <LINK href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
  <script type="text/javascript" language="javascript" src="../../JS/calendar.js"></script>
  <script language="javascript">
      function PrintTable() {
          document.getElementById("PrintHide").style.visibility = "hidden"
          print();
          document.getElementById("PrintHide").style.visibility = "visible"
      }
  </script>
</head>
<body onload="javascript:document.getElementById('TextBox5').readOnly=true;" >
    <form id="form1" runat="server">
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style=" height: 30px;">&nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;审批流程&nbsp;>>&nbsp;继续办理工作
                </td>
                <td align="right" valign="middle" style=" height: 30px;">
                    
<asp:Button ID="iButton1" runat="server" CssClass="btn btn-blue" Text="提交" OnClick="iButton1_Click" />
                    
                    &nbsp;<button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">返回</button></td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
    <table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1">            
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                工作名称：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff"><asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:Label ID="Label4" runat="server" style="display:none;">表单内容</asp:Label></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="height: 25px; background-color: #f9f9f7; text-align: center">
                <strong>下一节点流程属性</strong></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                下一节点选择：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" Width="350px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="根据条件字段自动决定下一节点" /></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                评审模式：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" BorderWidth="0px" ReadOnly="True"
                    Width="350px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                审批人选择模式：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" BorderWidth="0px" ReadOnly="True"
                    Width="350px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                审批人选择：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:TextBox ID="TextBox5" runat="server" onKeyDown="javascript:return false;" Width="349px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox5"
                    Display="Dynamic" ErrorMessage="*必须指定审批人"></asp:RequiredFieldValidator><img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectUser.aspx?TableName=ERPUser&LieName=UserName&Condition='+document.getElementById('TextBox5').value+'&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox5').value=wName;}"
                    src="../../images/Button/search.gif" />
                <asp:CheckBox ID="CHKSMS" runat="server" Checked="True" /><img src="../../images/TreeImages/@sms.gif" />短消息<asp:CheckBox
                    ID="CHKMOB" runat="server" /><img src="../../images/TreeImages/mobile_sms.gif" />短信</td>
        </tr>
        </table></div>

    </form>
</body>
</html>