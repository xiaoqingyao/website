<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractAdd.aspx.cs" Inherits="OA.aspx.Sell.ContractAdd" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
  <LINK href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
  <script src="../../UEditor/editor_config.js" type="text/javascript"></script>
    <script src="../../UEditor/editor_all.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../UEditor/themes/default/ueditor.css" />
    <script src="../../JS/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
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
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;销售订单&nbsp;>>&nbsp;添加销售订单
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
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		合同名称：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtHeTongName" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPContract&LieName=HeTongName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtHeTongName').value=wName;}"  src="../../images/Button/search.gif" />
		<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHeTongName" ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		合同编号：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtHeTongSerils" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPContract&LieName=HeTongSerils&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtHeTongSerils').value=wName;}"  src="../../images/Button/search.gif" />
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		合同类型：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtHeTongLeiXing" runat="server" Width="350px"></asp:TextBox>
		<img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPContract&LieName=HeTongLeiXing&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtHeTongLeiXing').value=wName;}"  src="../../images/Button/search.gif" />
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		签约客户：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtQianYueKeHu" runat="server" Width="350px"></asp:TextBox>
        <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPCustomInfo&LieName=CustomName&GetType=My&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtQianYueKeHu').value=wName;}"
            src="../../images/Button/search.gif" /></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		包装运输方式：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtHeTongMiaoShu" runat="server" Width="350px" Height="60px" TextMode="MultiLine"></asp:TextBox>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		合同条款：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtHeTongTiaoKuan" runat="server" Width="350px" Height="60px" TextMode="MultiLine"></asp:TextBox>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		合同内容：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		
         <asp:TextBox ID="txtHeTongContent" runat="server" Width="100%" Rows="10" TextMode="MultiLine"></asp:TextBox>
                    <script type="text/javascript">
                        var editor = new baidu.editor.ui.Editor({ id: 'editor', minFrameHeight: 300 }); editor.render("txtHeTongContent");
                    </script>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		生效日期：
	</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:TextBox ID="txtShengXiaoDate" runat="server" Width="350px"></asp:TextBox>
            <asp:TextBox id="TextBox1" runat="server" onClick="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" Width="350px" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtShengXiaoDate"
                Display="Dynamic" ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtShengXiaoDate"
                ErrorMessage="*格式必须如： 2010-01-01" Type="Date" MaximumValue="3099-12-01" MinimumValue="1900-12-01"></asp:RangeValidator></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		终止日期：
	</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:TextBox id="txtZhongZhiDate" runat="server" onClick="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" Width="350px" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtZhongZhiDate"
                Display="Dynamic" ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator><asp:RangeValidator
                    ID="RangeValidator2" runat="server" ControlToValidate="txtZhongZhiDate" ErrorMessage="*格式必须如： 2010-01-01"
                    Type="Date" MaximumValue="3099-12-01" MinimumValue="1900-12-01"></asp:RangeValidator></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		提醒日期：
	</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:TextBox id="txtTiXingDate" runat="server" onClick="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" Width="350px" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTiXingDate"
                Display="Dynamic" ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator><asp:RangeValidator
                    ID="RangeValidator3" runat="server" ControlToValidate="txtTiXingDate" ErrorMessage="*格式必须如： 2010-01-01"
                    Type="Date" MaximumValue="3099-12-01" MinimumValue="1900-12-01"></asp:RangeValidator></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		出货日期：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
	  <asp:TextBox id="txtQianYueRenBuy" runat="server" onClick="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" Width="350px" ></asp:TextBox>
	</td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		收款日期：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		  <asp:TextBox id="txtQianYueRenSell" runat="server" onClick="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" Width="350px" ></asp:TextBox>
	</td></tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
            附件：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
            </asp:CheckBoxList>&nbsp;
<asp:ImageButton ID="iButton3" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="../../images/Button/DelFile.jpg" OnClick="iButton3_Click" />
            &nbsp; &nbsp;
            
<asp:ImageButton ID="iButton4" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/ReadFile.gif" OnClick="iButton4_Click" />
            &nbsp; &nbsp;
            
<asp:ImageButton ID="iButton5" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/EditFile.gif" OnClick="iButton5_Click" /></td>
    </tr>
	<tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
            上传附件：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:FileUpload ID="FileUpload1" runat="server" Width="350px" />
            
<asp:Button ID="iButton2" runat="server" CausesValidation="False" CssClass="btn btn-blue" Text="上传" OnClick="iButton2_Click" /></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		备注信息：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtBackInfo" runat="server" Width="350px" Height="60px" TextMode="MultiLine"></asp:TextBox></td></tr>
</table>
		</div>
	</form>
</body>
</html>
