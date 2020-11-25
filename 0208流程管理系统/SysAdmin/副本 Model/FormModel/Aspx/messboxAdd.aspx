<%@ Page Language="C#" AutoEventWireup="true"  Inherits="KingTop.Web.Admin.ControlFormEdit" %>

<%@ Import Namespace="System.Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" ><head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<script src="../../../JS/Common.js" type="text/javascript"></script>

<link href="../../../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

<script src="../../../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>

<script src="../../../JS/jquery-3.2.min.js" type="text/javascript"></script>

<script src="../../../JS/jquery-validationEngine.js" type="text/javascript"></script>

<script type="text/javascript" src="../../../js/jquery-validationEngine-cn.js"></script>

<script type="text/javascript">$(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });</script>

</head><body>

<form id='theForm' runat='server'><asp:HiddenField ID='hidModelId' runat='server' Value='000000000132380' />

<%KingTop.BLL.Content.ModelField  bllModel = new KingTop.BLL.Content.ModelField();

DataSet ds = null;

int i = 0;

int iCount = 0;

string strChecked =""; %>

<table>

<!--验证码-->

<tr><td>

验证码

</td><td>

<input name="validate" id='validate' type="text" size="6" class="validate[required]" maxlength="6" onfocus="this.select()"/><img src='../../../ValidateCode.aspx' alt='看不清楚？点击刷新验证码！' style='cursor:pointer' onclick="src='../../../ValidateCode.aspx?s='+Math.random()" />&nbsp;&nbsp;请输入验证码</td>

</tr>

</table>

<table><tr><td><input type="submit" runat="server" onserverclick="btnSave_Click" id="btnSave" value="确定" /></td></tr></table></form>

</body></html>