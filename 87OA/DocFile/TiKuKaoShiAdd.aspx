<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TiKuKaoShiAdd.aspx.cs" Inherits="DocFile_TiKuKaoShiAdd" %>
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
  
  
  <SCRIPT LANGUAGE="JavaScript">   
<!--   
var maxtime = <%=MaxTime %> //һ��Сʱ��������㣬�Լ�����!   
function CountDown(){   
if(maxtime>=0){
minutes = Math.floor(maxtime/60);   
seconds = Math.floor(maxtime%60);   
msg = "���뿼�Խ�������"+minutes+"��"+seconds+"��";   
document.all["timer"].innerHTML=msg;   
if(maxtime == 5*60) alert('ע�⣬����5����!');   
--maxtime;   
}   
else{   
clearInterval(timer);   
alert("ʱ�䵽������!");
document.getElementById('ImageButton1').click();
}
}
timer = setInterval("CountDown()",1000);  
//-->   
</SCRIPT>   



</head>
<body>
    <form id="form1" runat="server">
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">&nbsp;<img src="../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">����</a>&nbsp;>>&nbsp;���߿���&nbsp;>>&nbsp;�����Ϣ
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
        ��ѡ���Ծ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ȷ��ѡ����Ծ�" />
        
        <asp:Label ID="Lab1" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Lab2" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Lab3" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Lab4" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Lab5" runat="server" Visible="False"></asp:Label>
        
        </td>
        <td style="padding-left: 5px; height: 25px; width:300px; background-color: #ffffff">
        
            <asp:Panel ID="Panel1" runat="server" Height="25px" Width="300px" Visible="False">
            <div id="timer" style="color:red; font-weight:bold;"></div> 
            </asp:Panel>
            
        </td>
    </tr>
    <tr>
        <td colspan="3" style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:Label ID="Label1" runat="server"></asp:Label></td>
    </tr>
</table>
		</div>
	</form>
</body>
</html>
