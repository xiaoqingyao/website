<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModelListConfig.aspx.cs" Inherits="KingTop.WEB.SysAdmin.Model.ModelLisConfig" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/Common.js"></script>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .config li {	color:#333;float:left;border:#e4e4e4 1px solid;margin:2px; margin-left:10px; padding:2px 3px;display:block;white-space:nowrap}
        #AdvanceConfig ul li{ padding:5px;	margin-top:5px;color:#333;float:left;display:block;white-space:nowrap;}
         #AdvanceConfig ul{  border-bottom:#e4e4e4 1px solid;}
    </style>

</head>
<body>
    <form id="theForm" runat="server">
    <div  class="container">
    <%=sbListInfo[0] %>
    <%=Server.HtmlDecode(sbListInfo[1].ToString())%>
    <br />
    <h4>列宽设置 【数字(像素)或百分比（如:30%）】 </h4>
    <%=sbListInfo[2] %>
    <br />
    <h4 style=" clear:both;">列顺序设置【只能为整数】</h4>
    <%=sbListInfo[3]%>
      <h4 style=" clear:both;">列高设置</h4>
      <ul  class="config"><li>列表高设置（px) ：<input type="text" value="<%=modelListConfig.HsModel["ListHeight"] %>"  style=" width:150px;" name="ListHeight" />（可选）</li></ul>
        <h4 style=" clear:both;"><a href="javascript:void(0)" onclick="$('#AdvanceConfig').toggle()">▼高级设置</a></h4>
        <div id="AdvanceConfig" style="display:none;">
        <ul>
             <li style=" width:285px;">不参与列表显示查询的字段：<input type="text" value="<%=modelListConfig.HsModel["NotSearchField"] %>" name="NotSearchField" /></li>
             <li> URL传递且参与查询的参数：<input type="text" value="<%=modelListConfig.HsModel["DeliverAndSearchUrlParam"] %>"  style=" width:150px;" name="DeliverAndSearchUrlParam" /></li>
        </ul>
        <ul>
             <li> URL传递参数：<input type="text" value="<%=modelListConfig.HsModel["DeliverUrlParam"] %>"  style=" width:150px;" name="DeliverUrlParam" /></li>
             <li>返回调用页时需传递的URL参数：<input type="text" value="<%=modelListConfig.HsModel["BackDeliverUrlParam"] %>" name="BackDeliverUrlParam" /></li>
        </ul>
        <ul>
             <li>字段值来源于URL参数值的字段：<input type="text" value="<%=modelListConfig.HsModel["FieldFromUrlParamValue"] %>"  style=" width:150px;" name="FieldFromUrlParamValue" /></li>
         </ul>    
         
         <p style=" color:Red; clear:both; margin:10px;">各参数均可选，配置多个值时用逗号隔开</p>
        </div>
     </div>
    <center><div style=" margin:10px; clear:both;">
        <asp:Button ID="Button1" runat="server" Text="确定" OnCommand="Save" />&nbsp;&nbsp;<input type="button" value="返回" onclick="location.href='<%=backUrl %>'" /></div></center>
    </form>
     <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
