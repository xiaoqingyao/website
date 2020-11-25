<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContractModify.aspx.cs" Inherits="Sell_ContractModify" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
  <script src="../UEditor/editor_config.js" type="text/javascript"></script>
    <script src="../UEditor/editor_all.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../UEditor/themes/default/ueditor.css" />
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
                <a class="hei" href="../Main/MyDesk.aspx">����</a>&nbsp;>>&nbsp;���۶���&nbsp;>>&nbsp;�޸����۶���
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
		��ͬ���ƣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtHeTongName" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPContract&LieName=HeTongName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtHeTongName').value=wName;}"  src="../images/Button/search.gif" />
		<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHeTongName" ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��ͬ��ţ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtHeTongSerils" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPContract&LieName=HeTongSerils&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtHeTongSerils').value=wName;}"  src="../images/Button/search.gif" />
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��ͬ���ͣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtHeTongLeiXing" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPContract&LieName=HeTongLeiXing&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtHeTongLeiXing').value=wName;}"  src="../images/Button/search.gif" />
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		ǩԼ�ͻ���
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtQianYueKeHu" runat="server" Width="350px" ReadOnly="true"></asp:TextBox>
        <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPCustomInfo&LieName=CustomName&GetType=My&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtQianYueKeHu').value=wName;}"
            src="../images/Button/search.gif" /></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��װ���䷽ʽ��
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtHeTongMiaoShu" runat="server" Width="350px" Height="60px" TextMode="MultiLine"></asp:TextBox>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��ͬ���
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtHeTongTiaoKuan" runat="server" Width="350px" Height="60px" TextMode="MultiLine"></asp:TextBox>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��ͬ���ݣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
	  <asp:TextBox ID="txtHeTongContent" runat="server" Width="100%" Rows="10" TextMode="MultiLine"></asp:TextBox>
                    <script type="text/javascript">
                        var editor = new baidu.editor.ui.Editor({ id: 'editor', minFrameHeight: 300 }); editor.render("txtHeTongContent");
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��Ч���ڣ�
	</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:TextBox ID="txtShengXiaoDate" runat="server" Width="350px"></asp:TextBox>
            <img class="HerCss" onclick="var dataString = showModalDialog('../JS/calendar.htm', 'yyyy-mm-dd' ,'dialogWidth:286px;dialogHeight:221px;status:no;help:no;');if(dataString==null){}else{document.getElementById('txtShengXiaoDate').value=dataString;}"
                src="../images/Button/search.gif" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtShengXiaoDate"
                Display="Dynamic" ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtShengXiaoDate"
                ErrorMessage="*��ʽ�����磺 2010-01-01" Type="Date" MaximumValue="3099-12-01" MinimumValue="1900-12-01"></asp:RangeValidator></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��ֹ���ڣ�
	</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:TextBox ID="txtZhongZhiDate" runat="server" Width="350px"></asp:TextBox>
            <img class="HerCss" onclick="var dataString = showModalDialog('../JS/calendar.htm', 'yyyy-mm-dd' ,'dialogWidth:286px;dialogHeight:221px;status:no;help:no;');if(dataString==null){}else{document.getElementById('txtZhongZhiDate').value=dataString;}"
                src="../images/Button/search.gif" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtZhongZhiDate"
                Display="Dynamic" ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator><asp:RangeValidator
                    ID="RangeValidator2" runat="server" ControlToValidate="txtZhongZhiDate" ErrorMessage="*��ʽ�����磺 2010-01-01"
                    Type="Date" MaximumValue="3099-12-01" MinimumValue="1900-12-01"></asp:RangeValidator></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		�������ڣ�
	</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:TextBox ID="txtTiXingDate" runat="server" Width="350px"></asp:TextBox>
            <img class="HerCss" onclick="var dataString = showModalDialog('../JS/calendar.htm', 'yyyy-mm-dd' ,'dialogWidth:286px;dialogHeight:221px;status:no;help:no;');if(dataString==null){}else{document.getElementById('txtTiXingDate').value=dataString;}"
                src="../images/Button/search.gif" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTiXingDate"
                Display="Dynamic" ErrorMessage="*�������Ϊ��"></asp:RequiredFieldValidator><asp:RangeValidator
                    ID="RangeValidator3" runat="server" ControlToValidate="txtTiXingDate" ErrorMessage="*��ʽ�����磺 2010-01-01"
                    Type="Date" MaximumValue="3099-12-01" MinimumValue="1900-12-01"></asp:RangeValidator></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		�������ڣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtQianYueRenBuy" runat="server" Width="350px"></asp:TextBox>
	  <img class="HerCss" onclick="var dataString = showModalDialog('../JS/calendar.htm', 'yyyy-mm-dd' ,'dialogWidth:286px;dialogHeight:221px;status:no;help:no;');if(dataString==null){}else{document.getElementById('txtQianYueRenBuy').value=dataString;}"
                src="../images/Button/search.gif" />
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		�տ����ڣ�
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtQianYueRenSell" runat="server" Width="350px"></asp:TextBox>
		  <img class="HerCss" onclick="var dataString = showModalDialog('../JS/calendar.htm', 'yyyy-mm-dd' ,'dialogWidth:286px;dialogHeight:221px;status:no;help:no;');if(dataString==null){}else{document.getElementById('txtQianYueRenSell').value=dataString;}"
                src="../images/Button/search.gif" />
	</td></tr>
	
	
	
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
            ������</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
            </asp:CheckBoxList>&nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False"
                ImageAlign="AbsMiddle" ImageUrl="../images/Button/DelFile.jpg" OnClick="ImageButton3_Click" />
            &nbsp; &nbsp;
            <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" ImageAlign="AbsMiddle"
                ImageUrl="~/images/Button/ReadFile.gif" OnClick="ImageButton4_Click" />
            &nbsp; &nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" ImageAlign="AbsMiddle"
                ImageUrl="~/images/Button/EditFile.gif" OnClick="ImageButton5_Click" /></td>
    </tr>
	<tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
            �ϴ�������</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:FileUpload ID="FileUpload1" runat="server" Width="350px" />
            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" ImageAlign="AbsMiddle"
                ImageUrl="../images/Button/UpLoad.jpg" OnClick="ImageButton2_Click" /></td>
    </tr>
    
    
    
    
	<tr>
	<td style="width: 170px; height: 25px; background-color: #D6E2F3" align="right">
		��ע��Ϣ��
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtBackInfo" runat="server" Width="350px" Height="60px" TextMode="MultiLine"></asp:TextBox></td></tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
            �����ˣ�</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:Label ID="Label1" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
            ����ʱ�䣺</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:Label ID="Label2" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #D6E2F3">
            ��ǰ״̬��</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:Label ID="Label3" runat="server"></asp:Label></td>
    </tr>
</table>
		</div>
	</form>
</body>
</html>
