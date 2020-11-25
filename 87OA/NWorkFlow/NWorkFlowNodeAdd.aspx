<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NWorkFlowNodeAdd.aspx.cs" Inherits="NWorkFlow_NWorkFlowNodeAdd" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">

</head>
<body onload="javascript:document.getElementById('txtSPDefaultList').readOnly=true;">
    <form id="form1" runat="server">
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">&nbsp;<img src="../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">����</a>&nbsp;>>&nbsp;�ڵ㶨��&nbsp;>>&nbsp;�����Ϣ
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
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		�ڵ���ţ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtNodeSerils" runat="server" Width="350px"></asp:TextBox><asp:RequiredFieldValidator
            ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNodeSerils"
            Display="Dynamic" ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtNodeSerils"
            ErrorMessage="*����Ϊ����" MaximumValue="10000" MinimumValue="0" Type="Integer"></asp:RangeValidator></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		�ڵ����ƣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtNodeName" runat="server" Width="350px"></asp:TextBox></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		�ڵ�λ�ã�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList1" runat="server" Width="350px">
            <asp:ListItem>��ʼ</asp:ListItem>
            <asp:ListItem>�м��</asp:ListItem>
            <asp:ListItem>����</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		��һ��㣺
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtNextNode" runat="server" Width="350px"></asp:TextBox>
        <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectJieDian.aspx?WorkFlowID=<%=Request.QueryString["WorkFlowID"].ToString() %>&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtNextNode').value=wName;}"
            src="../images/Button/search.gif" /></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		�Ƿ�����ǿ����ת��
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList2" runat="server" Width="350px">
            <asp:ListItem>��</asp:ListItem>
            <asp:ListItem>��</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		�Ƿ�����鿴������
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList3" runat="server" Width="350px">
            <asp:ListItem>��</asp:ListItem>
            <asp:ListItem>��</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		�Ƿ�����༭������
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList4" runat="server" Width="350px">
            <asp:ListItem>��</asp:ListItem>
            <asp:ListItem>��</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		�Ƿ�����ɾ��������
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList5" runat="server" Width="350px">
            <asp:ListItem>��</asp:ListItem>
            <asp:ListItem>��</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		��ʱ���ã�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        ת��������ڵ��<asp:TextBox id="txtJieShuHours" runat="server" Width="49px">72</asp:TextBox>Сʱδ�����Զ����ʹ߰����ѣ�<asp:RequiredFieldValidator
            ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtJieShuHours"
            Display="Dynamic" ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator><asp:RangeValidator
                ID="RangeValidator2" runat="server" ControlToValidate="txtJieShuHours" ErrorMessage="*����Ϊ����"
                MaximumValue="10000" MinimumValue="0" Type="Integer"></asp:RangeValidator></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
        ����ģʽ��
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList6" runat="server" Width="350px">
            <asp:ListItem>һ��ͨ����������ת</asp:ListItem>
            <asp:ListItem>ȫ��ͨ����������ת</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
        ������ѡ��ģʽ��
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList7" onchange="SelectDefault(this);" runat="server" Width="350px">
            <asp:ListItem>����ʱ����ָ��</asp:ListItem>
            <asp:ListItem>��Ĭ����������ѡ��</asp:ListItem>
            <asp:ListItem>��Ĭ������������ѡ��</asp:ListItem>
            <asp:ListItem>��Ĭ��������ɫ��ѡ��</asp:ListItem>
            <asp:ListItem>�Զ�ѡ�����̷�����</asp:ListItem>
            <asp:ListItem>�Զ�ѡ�񱾲�������</asp:ListItem>
            <asp:ListItem>�Զ�ѡ���ϼ���������</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
        Ĭ������ѡ��
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtSPDefaultList" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="OnSelect();"  src="../images/Button/search.gif" /></td></tr>
</table>
		</div>
	</form>
</body>
</html>
  <script language="javascript" type="text/javascript" >
      function PrintTable() {
          document.getElementById("PrintHide").style.visibility = "hidden"
          print();
          document.getElementById("PrintHide").style.visibility = "visible"
      }

      var Selecttag = 0;
      document.getElementById('txtSPDefaultList').readOnly = true;
      function SelectDefault(OBJ) {

          document.getElementById('txtSPDefaultList').value = "";
          if (OBJ.options[OBJ.selectedIndex].value == "����ʱ����ָ��") {
              Selecttag = 0;
              document.getElementById('txtSPDefaultList').readOnly = true;
          }

          else if (OBJ.options[OBJ.selectedIndex].value == "��Ĭ����������ѡ��") {
              Selecttag = 1;
              document.getElementById('txtSPDefaultList').readOnly = false;
          }
          else if (OBJ.options[OBJ.selectedIndex].value == "��Ĭ������������ѡ��") {
              Selecttag = 2;
              document.getElementById('txtSPDefaultList').readOnly = false;
          }
          else if (OBJ.options[OBJ.selectedIndex].value == "��Ĭ��������ɫ��ѡ��") {
              Selecttag = 3;
              document.getElementById('txtSPDefaultList').readOnly = false;
          }
          else if (OBJ.options[OBJ.selectedIndex].value == "�Զ�ѡ�����̷�����") {
              Selecttag = 4;
              document.getElementById('txtSPDefaultList').readOnly = true;
          }
          else if (OBJ.options[OBJ.selectedIndex].value == "�Զ�ѡ�񱾲�������") {
              Selecttag = 5;
              document.getElementById('txtSPDefaultList').readOnly = true;
          }
          else if (OBJ.options[OBJ.selectedIndex].value == "�Զ�ѡ���ϼ���������") {
              Selecttag = 6;
              document.getElementById('txtSPDefaultList').readOnly = true;
          }
      }

      function OnSelect() {
          if (Selecttag == 1) {
              var wName;
              var RadNum = Math.random();
              wName = window.showModalDialog('../Main/SelectUser.aspx?TableName=ERPUser&LieName=UserName&Radstr=' + RadNum, '', 'dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
              if (wName == null)
              { }
              else
              { document.getElementById('txtSPDefaultList').value = wName; }
          }
          else if (Selecttag == 2) {
              var wName;
              var RadNum = Math.random();
              wName = window.showModalDialog('../Main/SelectDanWei.aspx?TableName=ERPBuMen&LieName=BuMenName&Radstr=' + RadNum, '', 'dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
              if (wName == null)
              { }
              else
              { document.getElementById('txtSPDefaultList').value = wName; }
          }
          else if (Selecttag == 3) {
              var wName;
              var RadNum = Math.random();
              wName = window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPJiaoSe&LieName=JiaoSeName&Radstr=' + RadNum, '', 'dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
              if (wName == null)
              { }
              else
              { document.getElementById('txtSPDefaultList').value = wName; }
          }
          else {
              document.getElementById('txtSPDefaultList').readOnly = true;
              alert('��������ѡ��ģʽ������ѡ��Ĭ��������');
          }
      }
    
  </script>