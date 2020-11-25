<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContractChanPinAdd.aspx.cs" Inherits="Sell_ContractChanPinAdd" %>
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
                <a class="hei" href="../Main/MyDesk.aspx">����</a>&nbsp;>>&nbsp;���۶��� &gt;&gt; ��Ӻ�ͬ��Ʒ��Ϣ
                </td>
                <td align="right" valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/Submit.jpg"
                        OnClick="ImageButton1_Click" />
                    <img src="../images/Button/JianGe.jpg" />&nbsp;
                    <img class="HerCss" onclick="javascript:window.history.go(-1);" src="../images/Button/BtnExit.jpg" />&nbsp;</td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
<table style="width: 100%" bgcolor="#999999" border="0" cellpadding="2" cellspacing="1">
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��ͬ���ƣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtHeTongName" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPContract&LieName=HeTongName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtHeTongName').value=wName;}"  src="../images/Button/search.gif" />
		<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHeTongName" ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��Ʒ���ƣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtChanPinName" runat="server" Width="350px" 
            AutoPostBack="True" ontextchanged="txtChanPinName_TextChanged"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPProduct&LieName=ProductName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtChanPinName').value=wName;__doPostBack('', '');}"  src="../images/Button/search.gif" />
	</td></tr>
    <tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		���ߴ磺
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtProductSize" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPProduct&LieName=ProductSize&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtProductSize').value=wName;}"  src="../images/Button/search.gif" />
	</td></tr>
    <tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		���ܣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtPerformance" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPProduct&LieName=Performance&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtPerformance').value=wName;}"  src="../images/Button/search.gif" />
	</td></tr>
    <tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		�Ʋ㣺
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtCoating" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPProduct&LieName=Coating&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtCoating').value=wName;}"  src="../images/Button/search.gif" />
	</td></tr>
    <tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		���洦��
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtSurfaceTreatment" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPProduct&LieName=SurfaceTreatment&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtSurfaceTreatment').value=wName;}"  src="../images/Button/search.gif" />
	</td></tr>
    <tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��ŷ���
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtMagnetizingDirection" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPProduct&LieName=MagnetizingDirection&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtMagnetizingDirection').value=wName;}"  src="../images/Button/search.gif" />
	</td></tr>
    <tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		���
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtTolerance" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPProduct&LieName=Tolerance&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtTolerance').value=wName;}"  src="../images/Button/search.gif" />
	</td></tr>
    <tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		�Ƿ�˰��
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:RadioButtonList ID="rdoIsContainingTax" runat="server" 
            RepeatDirection="Horizontal">
            <asp:ListItem Value="1">��</asp:ListItem>
            <asp:ListItem Selected="True" Value="0">��</asp:ListItem>
        </asp:RadioButtonList>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		���ۣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtDanJia" runat="server" Width="350px" AutoPostBack="True" 
            ontextchanged="txtDanJia_TextChanged"></asp:TextBox>
        Ԫ<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDanJia"
            Display="Dynamic" ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator><asp:RangeValidator
                ID="RangeValidator2" runat="server" ControlToValidate="txtDanJia" ErrorMessage="*���������дΪ����"
                MaximumValue="100000000" MinimumValue="-100000000" Type="Double"></asp:RangeValidator></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		������
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtShuLiang" runat="server" Width="350px" AutoPostBack="True" 
            ontextchanged="txtShuLiang_TextChanged"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtShuLiang"
            Display="Dynamic" ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtShuLiang"
            ErrorMessage="*���������дΪ����" MaximumValue="100000000" MinimumValue="-100000000"
            Type="Double"></asp:RangeValidator></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		�ܼۣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtZongJia" runat="server" Width="350px" AutoPostBack="True" 
            ontextchanged="txtZongJia_TextChanged"></asp:TextBox>
        Ԫ<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtZongJia"
            Display="Dynamic" ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator><asp:RangeValidator
                ID="RangeValidator3" runat="server" ControlToValidate="txtZongJia" ErrorMessage="*���������дΪ����"
                MaximumValue="100000000" MinimumValue="-100000000" Type="Double"></asp:RangeValidator></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		�Ѹ�������
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtYiFuKuan" runat="server" Width="350px" AutoPostBack="True" 
            ontextchanged="txtYiFuKuan_TextChanged"></asp:TextBox>
        Ԫ<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtYiFuKuan"
            Display="Dynamic" ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator><asp:RangeValidator
                ID="RangeValidator4" runat="server" ControlToValidate="txtYiFuKuan" ErrorMessage="*���������дΪ����"
                MaximumValue="100000000" MinimumValue="-100000000" Type="Double"></asp:RangeValidator></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		Ƿ������
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtQianKuanShu" runat="server" Width="350px"></asp:TextBox>
        Ԫ<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtQianKuanShu"
            Display="Dynamic" ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator><asp:RangeValidator
                ID="RangeValidator5" runat="server" ControlToValidate="txtQianKuanShu" ErrorMessage="*���������дΪ����"
                MaximumValue="100000000" MinimumValue="-100000000" Type="Double"></asp:RangeValidator></td></tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
            �Ƿ񽻸���</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>�ѽ���</asp:ListItem>
                <asp:ListItem Selected="True">δ����</asp:ListItem>
            </asp:RadioButtonList></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��ע˵����
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtBackInfo" runat="server" Width="350px" Height="60px" TextMode="MultiLine"></asp:TextBox></td></tr>
</table>
		</div>
	</form>
</body>
</html>
