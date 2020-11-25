<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NWorkToDoAdd.aspx.cs" Inherits="NWorkFlow_NWorkToDoAdd" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
  <script type="text/javascript" language="javascript" src="../JS/calendar.js"></script>
  <script language="javascript">
  function PrintTable()
    {
        document.getElementById("PrintHide") .style.visibility="hidden"    
        print();
        document.getElementById("PrintHide") .style.visibility="visible"    
    }
//    function SelectDefault()
//    {
//    
//        if(document.getElementById('TextBox2').value=="����ʱ����ָ��")
//        {
//            document.getElementById("searchimg").style.visibility="visible";
//        }        
//        else if(document.getElementById('TextBox2').value=="��Ĭ����������ѡ��")
//        {
//            document.getElementById("searchimg").style.visibility="visible";
//        }
//        else if(document.getElementById('TextBox2').value=="��Ĭ������������ѡ��")
//        {
//            document.getElementById("searchimg").style.visibility="visible";
//        }
//        else if(document.getElementById('TextBox2').value=="��Ĭ��������ɫ��ѡ��")
//        {
//            document.getElementById("searchimg").style.visibility="visible";
//        }
//        else if(document.getElementById('TextBox2').value=="�Զ�ѡ�����̷�����")
//        {
//            document.getElementById("searchimg").style.visibility="hidden";
//        }
//        else if(document.getElementById('TextBox2').value=="�Զ�ѡ�񱾲�������")
//        {
//            document.getElementById("searchimg").style.visibility="hidden";
//        }
//        else if(document.getElementById('TextBox2').value=="�Զ�ѡ���ϼ���������")
//        {
//           document.getElementById("searchimg").style.visibility="hidden";
//        }
//    }
    
    function selectUser(imgidstr)
        {            
            var wName;
            var RadNum=Math.random();            
            wName=window.showModalDialog('../Main/SelectUser.aspx?Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');            
            if(wName==null||wName=="")
            {}
            else
            {
                imgidstr.value=wName;                          
            }                
        }
        
function selectBuMen(imgidstr)
        {            
            var wName;
            var RadNum=Math.random();            
            wName=window.showModalDialog('../Main/SelectDanWei.aspx?Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');            
            if(wName==null||wName=="")
            {}
            else
            {
                imgidstr.value=wName;                          
            }                
        }


function selectyinzhang(imgidstr)
        {            
            var wName;
            var RadNum=Math.random();            
            wName=window.showModalDialog('../Main/SelectYinZhang.aspx?Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');            
            if(wName==null||wName=="")
            {}
            else
            {
                imgidstr.src="http://"+window.location.host+"<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/"+wName;                          
            }                
        }
  function selectShouXie(imgidstr)
        {            
            var wName;
            var RadNum=Math.random();            
            wName=window.showModalDialog('../Main/InsertQianMing.aspx?Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');            
            if(wName==null||wName=="")
            {}
            else
            {
                imgidstr.src="http://"+window.location.host+"<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/"+wName;                          
            }                
        }
        
  </script>
</head>
<body onload="javascript:document.getElementById('TextBox5').readOnly=true;Load_Do();">
    <form id="form1" runat="server">
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">&nbsp;<img src="../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">����</a>&nbsp;>>&nbsp;��������&nbsp;>>&nbsp;�������������
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
        <td align="right" colspan="2" style="height: 25px; background-color: #D6E2F3; text-align: center">
            <strong>������������</strong></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		�������ƣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtWorkName" runat="server" Width="350px"></asp:TextBox>
		<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtWorkName" ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator>
	</td></tr>
	<tr>
        <td colspan="2" style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:Label ID="Label1" runat="server"></asp:Label><asp:TextBox ID="TextBox3" runat="server"
                Style="display: none"></asp:TextBox></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		�����ļ���
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
<asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                </asp:CheckBoxList>&nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False"
                    ImageAlign="AbsMiddle" ImageUrl="../images/Button/DelFile.jpg" OnClick="ImageButton3_Click" />
        &nbsp; &nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" ImageAlign="AbsMiddle"
            ImageUrl="~/images/Button/ReadFile.gif" OnClick="ImageButton5_Click" />
        &nbsp; &nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="False" ImageAlign="AbsMiddle"
            ImageUrl="~/images/Button/EditFile.gif" OnClick="ImageButton6_Click" /></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
                �ϴ�������</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="350px" />
                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" ImageAlign="AbsMiddle"
                    ImageUrl="../images/Button/UpLoad.jpg" OnClick="ImageButton2_Click" />
	</td></tr>
    <tr>
        <td align="right" colspan="2" style="height: 25px; background-color: #D6E2F3; text-align: center">
            <strong>����������������</strong></td>
    </tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
            ��һ�ڵ�ѡ��</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"
                Width="350px">
            </asp:DropDownList>
            <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="���������Զ�������һ�ڵ�" /></td>
    </tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
            ����ģʽ��</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" BorderWidth="0px" ReadOnly="True"
                Width="350px"></asp:TextBox></td>
    </tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
            ������ѡ��ģʽ��</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" BorderWidth="0px" ReadOnly="True"
                Width="350px"></asp:TextBox></td>
    </tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
            ������ѡ��</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:TextBox ID="TextBox5" runat="server" onkeydown="javascript:return false;" Width="349px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox5"
                Display="Dynamic" ErrorMessage="*����ָ��������"></asp:RequiredFieldValidator><img class="HerCss" id="searchimg" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectUser.aspx?TableName=ERPUser&LieName=UserName&Condition='+document.getElementById('TextBox5').value+'&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox5').value=wName;}"
                src="../images/Button/search.gif" /><asp:CheckBox ID="CHKSMS" runat="server" Checked="True" /><img
                    src="../images/TreeImages/@sms.gif" />����Ϣ<asp:CheckBox ID="CHKMOB" runat="server" /><img
                        src="../images/TreeImages/mobile_sms.gif" />����Ϣ</td>
    </tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
            ������ѡ��</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:TextBox ID="txtChaoSong" runat="server" onkeydown="javascript:return false;" Width="349px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5"
                Display="Dynamic" ErrorMessage="*����ָ��������"></asp:RequiredFieldValidator><img class="HerCss" id="Img1" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectUser.aspx?TableName=ERPUser&LieName=UserName&Condition='+document.getElementById('txtChaoSong').value+'&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtChaoSong').value=wName;}"
                src="../images/Button/search.gif" /><asp:CheckBox ID="CHKSMS1" runat="server" Checked="True" /><img
                    src="../images/TreeImages/@sms.gif" />����Ϣ<asp:CheckBox ID="CHKMOB1" runat="server" /><img
                        src="../images/TreeImages/mobile_sms.gif" />����Ϣ</td>
    </tr>
</table>
		</div>
		
		<script>
		//���������ֶεĿ�д�뱣������
		<%=PiLiangSet %>
		
		</script>
		
		<SCRIPT>
function Load_Do()
{
setTimeout("Load_Do()",0);
var content = document.getElementById("Label1").innerHTML
document.getElementById("TextBox3").value=content;
}
</SCRIPT> 
	</form>
</body>
</html>
