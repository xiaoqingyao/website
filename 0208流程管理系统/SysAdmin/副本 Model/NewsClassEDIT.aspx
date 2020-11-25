<%@ Page Language="C#" AutoEventWireup="true"  Inherits="KingTop.Web.Admin.ControlManageEdit" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>模型修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
<script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>
<script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
<script src="../JS/Common.js" type="text/javascript"></script>
<script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery-validationEngine-cn.js"></script>
<script type="text/javascript">
    $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
</script>
</head>
<body>
    <form id="theForm" runat="server">
    <div>   
    <asp:HiddenField ID='hidModelId' runat='server' Value='5204ed1-a0fd-42' />
<%KingTop.BLL.Content.ModelField  bllModel = new KingTop.BLL.Content.ModelField();
DataSet ds = null;
int i = 0;
int iCount = 0;
string strChecked =""; %>
<table>
<tr class="btd2"><td width="4%" align="right">类型名称</td><td width="13%"><input type='text' id="ClassName" name="ClassName" width=10 maxlength=10 value='<%=DrModelTableRow!=null?DrModelTableRow["ClassName"].ToString():""%>' class='validate[required]' />&nbsp;&nbsp;</td></tr>
<tr class="btd2"><td width="4%" align="right">归属栏目</td><td width="13%"><select id="MenuID" name="MenuID">    <!--Menu 栏目表名  ID与name分别为栏目表的主键与栏目名称字段-->    <option value="{Menu.ID}">{Menu.Name}</option>  </select></td></tr>
<tr class="btd2"><td width="4%" align="right">县</td><td width="13%">{8090faf-4960-4f}</td></tr>
<tr class="btd2"><td width="4%" align="right">市</td><td width="13%">{8090faf-4960-4f}</td></tr>
<tr class="btd2"><td width="4%" align="right">简短标题</td><td width="13%"><input type="text" id="BriefTitle" css="validate[required]" value="$|value|$" name="BriefTitle"></input></td></tr>
<tr class="btd2"><td width="4%" align="right">省</td><td width="13%"><input type="text" name="province" />  <input type="text" name="city" />  <input type="text" name="town" /></td></tr>
<tr class="btd2"><td width="4%" align="right">简短标题</td><td width="13%"><input type="text" id="BriefTitle" css="validate[required]" value="$|value|$"  name="BriefTitle"></input></td></tr>
<tr class="btd2"><td width="4%" align="right">归属栏目</td><td width="13%"><select id="MenuID" name="MenuID">
  <!--Menu 栏目表名  ID与name分别为栏目表的主键与栏目名称字段-->
  <option value="{Menu.ID}">{Menu.Name}</option>
</select></td></tr>
</table>
<% if(ds!=null)
{ds.Dispose();} %>  
    </div>
    <input type="submit" runat="server" onserverclick="btnSave_Click" id="btnSave" value="确定" />
    </form>
</body>
</html>
