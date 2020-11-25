<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JieDianModify.aspx.cs" Inherits="WorkFlow_JieDianModify" %>

<html>
	<head>
		<title>企业OA综合管理平台</title>
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
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;工作流程&nbsp;>>&nbsp;修改工作流节点
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
            <td align="right" colspan="2" style="height: 25px; background-color: #cccccc; text-align: center">
                <strong>节点基本属性</strong></td>
        </tr>
        
        <tr>
            <td align="right" style="width: 170px; background-color: #cccccc; height: 25px;" >
                节点序号：</td>
                <td style="background-color: #ffffff; height: 25px; padding-left:5px;" >
                    <asp:TextBox ID="TextBox1" runat="server" Width="350px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="*该项不可以为空" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="*必须为数字" MaximumValue="10000" MinimumValue="0" Type="Integer"></asp:RangeValidator></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #cccccc">
                节点名称：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:TextBox ID="TextBox2" runat="server" Width="350px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #cccccc">
                节点所处位置：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff"><asp:DropDownList ID="DropDownList4" runat="server" Width="350px">
                <asp:ListItem>开始</asp:ListItem>
                <asp:ListItem>中间段</asp:ListItem>
                <asp:ListItem>结束</asp:ListItem>
            </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #cccccc">
                下一节点(可多选)：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:TextBox ID="TextBox3" runat="server" Width="350px"></asp:TextBox>
                <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectJieDian.aspx?WorkFlowID=<%=Request.QueryString["WorkFlowID"].ToString() %>&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox3').value=wName;}"
                    src="../images/Button/search.gif" />
                <span style="color: darkgray">
                格式如：&nbsp; 3,5 多节点用逗号分隔</span></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #cccccc">
                评审模式：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff"><asp:DropDownList ID="DropDownList1" runat="server" Width="350px">
                <asp:ListItem>一人通过可向下流转</asp:ListItem>
                <asp:ListItem>全部通过可向下流转</asp:ListItem>
            </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #cccccc">
                审批人员选择：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:DropDownList ID="DropDownList5" runat="server" Width="350px">
                    <asp:ListItem>审批时自由指定</asp:ListItem>
                    <asp:ListItem>审批时从经办人列表中指定</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #cccccc">
                结束时间设置：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                超过<asp:TextBox ID="TextBox5" runat="server" Width="84px">24</asp:TextBox>个小时未办理，即流转到下一节点。</td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #cccccc">
                是否允许编辑附件：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:DropDownList ID="DropDownList2" runat="server" Width="350px">
                    <asp:ListItem>是</asp:ListItem>
                    <asp:ListItem>否</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #cccccc">
                是否允许删除附件：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:DropDownList ID="DropDownList3" runat="server" Width="350px">
                    <asp:ListItem>是</asp:ListItem>
                    <asp:ListItem>否</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="height: 25px; background-color: #cccccc; text-align: center">
                <strong>条件跳转设置</strong></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #cccccc">
                条件设置：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:DropDownList ID="DropDownList6" runat="server" Width="312px">
                </asp:DropDownList><asp:Button ID="Button1" runat="server" Text="删除" CausesValidation="False" OnClick="Button1_Click1" />
                <br />
                字段：<asp:DropDownList ID="DropDownList7" runat="server" Width="172px">
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList8" runat="server">
                    <asp:ListItem Value="&gt;">大于</asp:ListItem>
                    <asp:ListItem Value="&gt;=">大于等于</asp:ListItem>
                    <asp:ListItem Value="&lt;">小于</asp:ListItem>
                    <asp:ListItem Value="&lt;=">小于等于</asp:ListItem>
                    <asp:ListItem Value="=">等于</asp:ListItem>
                    <asp:ListItem Value="!=">不等于</asp:ListItem>
                    <asp:ListItem>包含</asp:ListItem>
                    <asp:ListItem>不包含</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TextBox4" runat="server" Width="53px"></asp:TextBox>
                跳转到节点：<asp:TextBox
                    ID="TextBox7" runat="server" Width="40px"></asp:TextBox><img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectJieDian.aspx?WorkFlowID=<%=Request.QueryString["WorkFlowID"].ToString() %>&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox7').value=wName;}"
                    src="../images/Button/search.gif" />
                <asp:Button ID="Button2" runat="server" Text="添加" CausesValidation="False" OnClick="Button2_Click1" />
                &nbsp;<br />
                <span style="color: darkgray">格式如： 请假天数&nbsp; 大于 10&nbsp; 跳转到&nbsp; 3 &nbsp; &nbsp;
                    其中 3 代表节点序号。</span></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="height: 25px; background-color: #cccccc; text-align: center">
                <strong>选择经办人</strong></td>
        </tr>
        <tr>
            <td align="right" style="width: 170px; height: 25px; background-color: #cccccc">
                该节点经办人：</td>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <asp:TextBox ID="TextBox6" runat="server" Width="350px"></asp:TextBox>
                <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectUser.aspx?TableName=ERPUser&LieName=UserName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox6').value=wName;}"
                    src="../images/Button/search.gif" /></td>
        </tr>
        </table></div>
    </form>
</body>
</html>