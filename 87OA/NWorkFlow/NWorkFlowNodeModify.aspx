<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NWorkFlowNodeModify.aspx.cs" Inherits="NWorkFlow_NWorkFlowNodeModify" %>
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
    
    
    var Selecttag=0;
    //document.getElementById('txtSPDefaultList').readOnly=true;            
    function SelectDefault(OBJ)
    {
    
        document.getElementById('txtSPDefaultList').value="";
        if(OBJ.options[OBJ.selectedIndex].value=="审批时自由指定")
        {
            Selecttag=0;
            document.getElementById('txtSPDefaultList').readOnly=true;            
        }
        
        else if(OBJ.options[OBJ.selectedIndex].value=="从默认审批人中选择")
        {
            Selecttag=1;
            document.getElementById('txtSPDefaultList').readOnly=false;
        }
        else if(OBJ.options[OBJ.selectedIndex].value=="从默认审批部门中选择")
        {
            Selecttag=2;
            document.getElementById('txtSPDefaultList').readOnly=false;
        }
        else if(OBJ.options[OBJ.selectedIndex].value=="从默认审批角色中选择")
        {
            Selecttag=3;
            document.getElementById('txtSPDefaultList').readOnly=false;
        }
        else if(OBJ.options[OBJ.selectedIndex].value=="自动选择流程发起人")
        {
            Selecttag=4;
            document.getElementById('txtSPDefaultList').readOnly=true;
        }
        else if(OBJ.options[OBJ.selectedIndex].value=="自动选择本部门主管")
        {
            Selecttag=5;
            document.getElementById('txtSPDefaultList').readOnly=true;
        }
        else if(OBJ.options[OBJ.selectedIndex].value=="自动选择上级部门主管")
        {
            Selecttag=6;
            document.getElementById('txtSPDefaultList').readOnly=true;
        }
    }
    
    function OnSelect()
    {    
        if(Selecttag==1)
        {
            var wName;
            var RadNum=Math.random();
            wName=window.showModalDialog('../Main/SelectUser.aspx?TableName=ERPUser&LieName=UserName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
            if(wName==null)
            {}
            else
            {document.getElementById('txtSPDefaultList').value=wName;}
        }
        else if(Selecttag==2)
        {
            var wName;
            var RadNum=Math.random();
            wName=window.showModalDialog('../Main/SelectDanWei.aspx?TableName=ERPBuMen&LieName=BuMenName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
            if(wName==null)
            {}
            else
            {document.getElementById('txtSPDefaultList').value=wName;}
        }
        else if(Selecttag==3)
        {
            var wName;
            var RadNum=Math.random();
            wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPJiaoSe&LieName=JiaoSeName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
            if(wName==null)
            {}
            else
            {document.getElementById('txtSPDefaultList').value=wName;}
        }
        else 
        {
            document.getElementById('txtSPDefaultList').readOnly=true;
            alert('此审批人选择模式下无须选择默认审批！');
        }
    }
  </script>
</head>
<body  onload="javascript:document.getElementById('txtSPDefaultList').readOnly=true;">
    <form id="form1" runat="server">
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">&nbsp;<img src="../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;节点定义&nbsp;>>&nbsp;修改信息
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
		节点序号：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtNodeSerils" runat="server" Width="350px"></asp:TextBox></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		节点名称：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtNodeName" runat="server" Width="350px"></asp:TextBox></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		节点位置：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList1" runat="server" Width="350px">
            <asp:ListItem>开始</asp:ListItem>
            <asp:ListItem>中间段</asp:ListItem>
            <asp:ListItem>结束</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		下一结点：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
		<asp:TextBox id="txtNextNode" runat="server" Width="350px"></asp:TextBox>
        <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectJieDian.aspx?WorkFlowID=<%=Request.QueryString["WorkFlowID"].ToString() %>&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtNextNode').value=wName;}"
            src="../images/Button/search.gif" /></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		是否允许强制跳转：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList2" runat="server" Width="350px">
            <asp:ListItem>是</asp:ListItem>
            <asp:ListItem>否</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		是否允许查看附件：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList3" runat="server" Width="350px">
            <asp:ListItem>是</asp:ListItem>
            <asp:ListItem>否</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		是否允许编辑附件：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList4" runat="server" Width="350px">
            <asp:ListItem>是</asp:ListItem>
            <asp:ListItem>否</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		是否允许删除附件：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList5" runat="server" Width="350px">
            <asp:ListItem>是</asp:ListItem>
            <asp:ListItem>否</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
		超时设置：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        转入此审批节点后，<asp:TextBox ID="txtJieShuHours" runat="server" Width="49px">72</asp:TextBox>小时未处理，自动发送催办提醒！<asp:RequiredFieldValidator
            ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtJieShuHours"
            Display="Dynamic" ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator><asp:RangeValidator
                ID="RangeValidator1" runat="server" ControlToValidate="txtJieShuHours" ErrorMessage="*必须为数字"
                MaximumValue="10000" MinimumValue="0" Type="Integer"></asp:RangeValidator></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
        评审模式：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList6" runat="server" Width="350px">
            <asp:ListItem>一人通过可向下流转</asp:ListItem>
            <asp:ListItem>全部通过可向下流转</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
        审批人选择模式：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:DropDownList ID="DropDownList7" runat="server" onchange="SelectDefault(this);"
            Width="350px">
            <asp:ListItem>审批时自由指定</asp:ListItem>
            <asp:ListItem>从默认审批人中选择</asp:ListItem>
            <asp:ListItem>从默认审批部门中选择</asp:ListItem>
            <asp:ListItem>从默认审批角色中选择</asp:ListItem>
            <asp:ListItem>自动选择流程发起人</asp:ListItem>
            <asp:ListItem>自动选择本部门主管</asp:ListItem>
            <asp:ListItem>自动选择上级部门主管</asp:ListItem>
        </asp:DropDownList></td></tr>
	<tr>
	<td style="width: 170px; height: 25px; background-color: #cccccc" align="right">
        默认审批选择：
	</td>
	<td style="padding-left: 5px; height: 25px; background-color: #ffffff" >
        <asp:TextBox ID="txtSPDefaultList" runat="server" Width="350px"></asp:TextBox>
        <img class="HerCss" onclick="OnSelect();" src="../images/Button/search.gif" /></td></tr>
</table>
		</div>
	</form>
</body>
</html>
