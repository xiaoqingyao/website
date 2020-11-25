<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NWorkToDoAdd.aspx.cs" Inherits="OA.aspx.NWorkFlow.NWorkToDoAdd" %>
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
      //    function SelectDefault()
      //    {
      //    
      //        if(document.getElementById('TextBox2').value=="审批时自由指定")
      //        {
      //            document.getElementById("searchimg").style.visibility="visible";
      //        }        
      //        else if(document.getElementById('TextBox2').value=="从默认审批人中选择")
      //        {
      //            document.getElementById("searchimg").style.visibility="visible";
      //        }
      //        else if(document.getElementById('TextBox2').value=="从默认审批部门中选择")
      //        {
      //            document.getElementById("searchimg").style.visibility="visible";
      //        }
      //        else if(document.getElementById('TextBox2').value=="从默认审批角色中选择")
      //        {
      //            document.getElementById("searchimg").style.visibility="visible";
      //        }
      //        else if(document.getElementById('TextBox2').value=="自动选择流程发起人")
      //        {
      //            document.getElementById("searchimg").style.visibility="hidden";
      //        }
      //        else if(document.getElementById('TextBox2').value=="自动选择本部门主管")
      //        {
      //            document.getElementById("searchimg").style.visibility="hidden";
      //        }
      //        else if(document.getElementById('TextBox2').value=="自动选择上级部门主管")
      //        {
      //           document.getElementById("searchimg").style.visibility="hidden";
      //        }
      //    }

      function selectUser(imgidstr) {
          var wName;
          var RadNum = Math.random();
          wName = window.showModalDialog('../Main/SelectUser.aspx?Radstr=' + RadNum, '', 'dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
          if (wName == null || wName == "")
          { }
          else
          {
              imgidstr.value = wName;
          }
      }

      function selectBuMen(imgidstr) {
          var wName;
          var RadNum = Math.random();
          wName = window.showModalDialog('../Main/SelectDanWei.aspx?Radstr=' + RadNum, '', 'dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
          if (wName == null || wName == "")
          { }
          else
          {
              imgidstr.value = wName;
          }
      }


      function selectyinzhang(imgidstr) {
          var wName;
          var RadNum = Math.random();
          wName = window.showModalDialog('../Main/SelectYinZhang.aspx?Radstr=' + RadNum, '', 'dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
          if (wName == null || wName == "")
          { }
          else
          {
              imgidstr.src = "http://" + window.location.host + "<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/" + wName;
            }
        }
        function selectShouXie(imgidstr) {
            var wName;
            var RadNum = Math.random();
            wName = window.showModalDialog('../Main/InsertQianMing.aspx?Radstr=' + RadNum, '', 'dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
            if (wName == null || wName == "")
            { }
            else
            {
                imgidstr.src = "http://" + window.location.host + "<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/" + wName;
            }
        }

  </script>
</head>
<body onload="javascript:document.getElementById('TextBox5').readOnly=true;Load_Do();">
    <form id="form1" runat="server">
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style=" height: 30px;">&nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;工作管理&nbsp;>>&nbsp;添加新审批工作
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
        <td align="right" colspan="2" style="height: 25px; background-color: #f9f9f7; text-align: center">
            <strong>工作基本属性</strong></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		工作名称：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtWorkName" runat="server" Width="350px"></asp:TextBox>
		<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtWorkName" ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator>
	</td></tr>
	<tr>
        <td colspan="2" style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:Label ID="Label1" runat="server"></asp:Label><asp:TextBox ID="TextBox3" runat="server"
                Style="display: none"></asp:TextBox></td>
    </tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
		附件文件：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
<asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                </asp:CheckBoxList>&nbsp;
<asp:ImageButton ID="iButton3" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="../../images/Button/DelFile.jpg" OnClick="iButton3_Click" />
        &nbsp; &nbsp;
        
<asp:ImageButton ID="iButton5" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/ReadFile.gif" OnClick="iButton5_Click" />
        &nbsp; &nbsp;
        
<asp:ImageButton ID="iButton6" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/EditFile.gif" OnClick="iButton6_Click" /></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                上传附件：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="350px" />
                
<asp:Button ID="iButton2" runat="server" CausesValidation="False" CssClass="btn btn-blue" Text="上传" OnClick="iButton2_Click" />
	</td></tr>
    <tr>
        <td align="right" colspan="2" style="height: 25px; background-color: #f9f9f7; text-align: center">
            <strong>流程审批附加属性</strong></td>
    </tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
            下一节点选择：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"
                Width="350px">
            </asp:DropDownList>
            <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="根据条件自动决定下一节点" /></td>
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
            <asp:TextBox ID="TextBox5" runat="server" onkeydown="javascript:return false;" Width="349px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox5"
                Display="Dynamic" ErrorMessage="*必须指定审批人"></asp:RequiredFieldValidator><img class="HerCss" id="searchimg" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectUser.aspx?TableName=ERPUser&LieName=UserName&Condition='+document.getElementById('TextBox5').value+'&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox5').value=wName;}"
                src="../../images/Button/search.gif" /><asp:CheckBox ID="CHKSMS" runat="server" Checked="True" /><img
                    src="../../images/TreeImages/@sms.gif" />短消息<asp:CheckBox ID="CHKMOB" runat="server" /><img
                        src="../../images/TreeImages/mobile_sms.gif" />短信息</td>
    </tr>
    <tr>
        <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
            抄送人选择：</td>
        <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
            <asp:TextBox ID="txtChaoSong" runat="server" onkeydown="javascript:return false;" Width="349px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5"
                Display="Dynamic" ErrorMessage="*必须指定抄送人"></asp:RequiredFieldValidator><img class="HerCss" id="Img1" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectUser.aspx?TableName=ERPUser&LieName=UserName&Condition='+document.getElementById('txtChaoSong').value+'&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtChaoSong').value=wName;}"
                src="../../images/Button/search.gif" /><asp:CheckBox ID="CHKSMS1" runat="server" Checked="True" /><img
                    src="../../images/TreeImages/@sms.gif" />短消息<asp:CheckBox ID="CHKMOB1" runat="server" /><img
                        src="../../images/TreeImages/mobile_sms.gif" />短信息</td>
    </tr>
</table>
		</div>
		
		<script>
		    //批量设置字段的可写与保密属性
		    <%=PiLiangSet %>
		
		</script>
		
		<SCRIPT>
		    function Load_Do() {
		        setTimeout("Load_Do()", 0);
		        var content = document.getElementById("Label1").innerHTML
		        document.getElementById("TextBox3").value = content;
		    }
</SCRIPT> 
	</form>
</body>
</html>
