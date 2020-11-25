<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Flow.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Model.Flow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link type="text/css"
	href="../css/jquery-ui-1.8.4.custom.css" rel="stylesheet" />
    <link href="../js/artDialog4.1.6/skins/blue.css" rel="stylesheet" type="text/css" />
    <script src="../js/artDialog4.1.6/artDialog.js"></script>
    <script src="../js/artDialog4.1.6/plugins/iframeTools.js"></script>
<script type="text/javascript" src="../js/raphael-min.js"></script>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.8.4.custom.min.js"></script>
<script type="text/javascript" src="../js/flow.js"></script>
<script type="text/javascript" src="../js/flow.txt.js"></script>
<script type="text/javascript" src="../js/flow.editors.js"></script>
<script type="text/javascript">
    $(function () {
        $('#myflow')
				.myflow(
						{
						    basePath: "",
						    restore: eval("({states:{},paths:{},props:{props:{name:{value:'新建流程'},key:{value:''},desc:{value:''}}}})"),
						    tools: {
						        save: {
						            onclick: function (data) {
						                $("#txtDaima").val(data);
						                art.dialog({ content: document.getElementById('myflow_SaveTB'), title: '新建流程', background: '#aaa', opacity: 0.7, lock: true });
						                //alert('save:\n' + data);
						            }
						        }
						    }
						});

    });
</script>
<style type="text/css">
body {
	margin: 0;
	pading: 0;
	text-align: left;
	font-family: Arial, sans-serif, Helvetica, Tahoma;
	font-size: 12px;
	line-height: 1.5;
	color: black;
	background-image: url(../Images/bg.png);
}

.node {
	width: 30px;
	text-align: center;
	vertical-align: middle;
    height:20px;
    padding-top:4px;
}

.mover {
 background:#ff0000;
}

.selected {
background-color: #ddd;
}

.state {
	
}

#myflow_props table {
	
}

#myflow_props th {
	letter-spacing: 2px;
	text-align: right;
	padding: 6px;
	width:60px;
	background: #bdd8ee;
}

#myflow_props td {
	background: #fff;
	padding: 6px;
}

#myflow_SaveTB table {
	
}

#myflow_SaveTB th {
	letter-spacing: 2px;
	text-align: right;
	padding: 6px;
	background: #bdd8ee;
}

#myflow_SaveTB td {
	background: #fff;
	padding: 6px;
}

#pointer {
	background-repeat: no-repeat;
	background-position: center;
}

#path {
	background-repeat: no-repeat;
	background-position: center;
}

#task {
	background-repeat: no-repeat;
	background-position: center;
}

#state {
	background-repeat: no-repeat;
	background-position: center;
}

#mytools
{
    height:33px;
    background:url(../Images/bar.png);
    position:fixed;
    width:100%;
    z-index:100;
    top:0;
    _position:absolute;
}
.nodebg
{
    width:30px;
    background:url(../Images/statebg.png) no-repeat;
    height:25px;
    cursor:pointer;
}
.bartable
{
    width:470px;
    margin-left:100px;
}
.propstable
{
  border: 1px solid #60a5e6;
}
.propstable td
{
  border: 1px solid #60a5e6;
}
.propstable th
{
  border: 1px solid #60a5e6;
  color:#333;
}
</style>
</head>
<body>
<div id="mytools"><table cellpadding="0" cellspacing="0" class="bartable" style="padding-top:3px">
<tr><td><div class="nodebg"><div class="node" id="myflow_save" title="保存流程" ><img title="保存流程" src="../Images/16/btn1.png" /></div></div></td>
<td style="width:15px; padding-left:7px; "><div style="border-right:1px solid #bbb; height:25px; float:left;" ></div><div style="border-left:1px solid #eee; height:25px; float:left;" ></div></td>
<td><div class="nodebg"><div class="node selectable" id="pointer" title="选择"><img title="选择" src="../Images/select16.gif" /></div></div></td>
    <td><div class="nodebg"><div class="node selectable" id="path" title="连线"><img title="连线" src="../Images/16/flow_sequence.png" /></div></div></td>
    <td style="width:15px; padding-left:7px; "><div style="border-right:1px solid #bbb; height:25px; float:left;" ></div><div style="border-left:1px solid #eee; height:25px; float:left;" ></div></td>
    <td><div class="nodebg"><div class="node state" id="start" type="start" title="开始节点"><img
	 alt="ddd" src="../Images/16/start_event_empty.png" title="开始节点"/></div></div></td>
    <td><div class="nodebg"><div class="node state" id="Div5" type="state" title="状态"><img
	src="../Images/16/event.gif" title="状态"/></div></div></td>
    <td><div class="nodebg"><div class="node state" id="Div6" type="task" title="任务"><img
	src="../Images/16/task_java.png" title="任务"/></div></div></td>
    <td><div class="nodebg"><div class="node state" id="Div7" type="fork" title="分支"><img
	src="../Images/16/gateway_parallel.png" title="分支"/></div></div></td>
    <td><div class="nodebg"><div class="node state" id="Div8" type="join" title="合并"><img
	src="../Images/16/gateway_exclusive.png" title="合并"/></div></div></td>
    <td><div class="nodebg"><div class="node state" id="Div9" type="end" title="流程结束"><img
	src="../Images/16/end_event_terminate.png" title="结束节点"/></div></div></td>
    <td><div class="nodebg"><div class="node state" id="Div10" type="end-cancel" title="任务取消"><img
	src="../Images/16/end_event_cancel.png" title="任务取消"/></div></div></td>
    <td><div class="nodebg"><div class="node state" id="Div11" type="end-error" title="任务错误"><img
	src="../Images/16/end_event_error.png" title="任务错误"/></div></div></td>
    </tr></table></div>
<div id="myflow_props"
	style="display:none; background-color: #fff; width: 300px;">
<table class="propstable" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td>aaa</td>
	</tr>
	<tr>
		<td>aaa</td>
	</tr>
</table>
<div>&nbsp;</div>
</div>

<div id="myflow_SaveTB"
	style="display:none; background-color: #fff; width: 500px;">
        <form id="form" runat="server">
<table class="propstable" width="100%" cellpadding="0" cellspacing="0">
	<tr>
    <th>
    流程名称
    </th>
		<td><input id="txtName" type="text"  value="流程1"/></td>
	</tr>
	<tr>
    <th>
    流程类型
    </th>
    <td><select id="txtType">
        <option value="考勤">考勤</option>
        <option value="出差">出差</option>
        <option value="会议">会议</option>
        <option value="报销">报错</option>
    </select></td>
	</tr>
    <tr>
    <th>
    直属部门
    </th>
    <td><select id="Select1">
        <option value="研发部">研发部</option>
        <option value="市场部">市场部</option>
        <option value="客服部">客服部</option>
        <option value="实施部">实施部</option>
    </select></td>
    </tr>
    <tr>
    <th>
    流程描述
    </th>
    <td>
        <textarea id="txtDesc" cols="40" rows="5" style="width:380px;"></textarea>
    </td>
    </tr>
        <tr>
    <th>
    转换代码
    </th>
    <td>
        <textarea id="txtDaima" cols="40" rows="5" style="width:380px;"></textarea>
    </td>
    </tr>
    <tr>
    <td>
    </td><td>
    <asp:Button ID="savebt" runat="server" OnClientClick="alert('数据已经提交到后台！')" style="float:left; width:77px; height:28px; cursor:pointer; background:url(../Images/savebt.jpg) no-repeat; border:0; text-indent:-9999px; display:block;"  onclick="savebt_Click"  />
    </td>
    </tr>
</table>
    </form>
<div>&nbsp;</div>
</div>
<div id="myflow"></div>
</body>
</html>
