<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoWork.aspx.cs" Inherits="OA.aspx.NWorkFlow.DoWork" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
  <LINK href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
    <script type="text/javascript" language="javascript" src="../../JS/calendar.js"></script>
  <script language="javascript">
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
    //for chrome 
            if (wName == undefined) {
                imgidstr.src = "http://" + window.location.host + "<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/" + window.returnValue;
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

        function PrintTable() {
            document.getElementById("PrintHide").style.visibility = "hidden"
            print();
            document.getElementById("PrintHide").style.visibility = "visible"
        }


        function _change() {
            var text = form1.DropDownList1.value;
            if (text != "请选择") {
                document.getElementById('TextBox1').value += text + "\r\n";
            }
        }

  </script>
</head>
<body onload="Load_Do();">
    <form id="form1" runat="server">
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style=" height: 30px;">&nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;审批流程&nbsp;>>&nbsp;办理工作
                </td>
                <td align="right" valign="middle" style=" height: 30px;">
                    &nbsp;
<asp:Button ID="iButton1" runat="server" CssClass="btn btn-blue" Text="打印" OnClick="iButton1_Click" />
                    
                    &nbsp;<button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">返回</button></td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
    <table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1">            
        
        <tr>
            <td align="right" style="width: 170px; background-color: #f9f9f7; height: 25px;" >
                工作名称：</td>
                <td style="background-color: #ffffff; height: 25px; padding-left:5px;" >
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    &nbsp; &nbsp; 当前节点：<asp:Label ID="Label2" runat="server"></asp:Label>
                    &nbsp; &nbsp; &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="False" ForeColor="green"
                        Target="_blank">流程图</asp:HyperLink></td>
        </tr>
        <tr>
            <td colspan="2" style="border-right: #eeeeee 1px solid; border-top: #eeeeee 1px solid;
                padding-left: 5px; border-left: #eeeeee 1px solid; border-bottom: #eeeeee 1px solid;
                height: 25px; background-color: #ffffff">
                <asp:Label ID="Label3" runat="server"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" Style="display: none"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                附件列表：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                </asp:CheckBoxList>&nbsp;
<asp:ImageButton ID="iButton3" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="../../images/Button/DelFile.jpg" OnClick="iButton3_Click" />
                &nbsp;
                
<asp:ImageButton ID="iButton4" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/ReadFile.gif" OnClick="iButton4_Click" />
                &nbsp; &nbsp;
                
<asp:ImageButton ID="iButton5" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/EditFile.gif" OnClick="iButton5_Click" /></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="height: 25px; background-color: #f9f9f7; text-align: center">
                <strong>我的审批</strong></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                常用审批：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:DropDownList ID="DropDownList1" onchange="_change()" runat="server" Width="350px">
                    <asp:ListItem>请选择</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                审批意见：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:TextBox ID="TextBox1" runat="server" Height="100px" TextMode="MultiLine" Width="350px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                审批附件：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="351px" /></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
            </td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:Button ID="Button1" runat="server" Text="保存并通过" OnClick="Button1_Click" Width="78px" />
                <asp:Button ID="Button2" runat="server" Text="保存并驳回到发文人" OnClick="Button2_Click" Width="127px" />
                <asp:Button ID="Button3" runat="server" Text="保存并驳回到其他节点" OnClick="Button3_Click" Width="144px" /></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="height: 25px; background-color: #f9f9f7; text-align: center">
                <strong>审批记录</strong></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">
                审批记录：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:Label ID="Label5" runat="server"></asp:Label></td>
        </tr>
        </table></div>
        
        <script>
            //批量设置字段的可写与保密属性
            <%=PiLiangSet %>
		
		</script>
        
                 <SCRIPT>
                     function Load_Do() {
                         setTimeout("Load_Do()", 0);
                         var content = document.getElementById("Label3").innerHTML
                         document.getElementById("TextBox3").value = content;
                     }
</SCRIPT> 

    </form>
</body>
</html>