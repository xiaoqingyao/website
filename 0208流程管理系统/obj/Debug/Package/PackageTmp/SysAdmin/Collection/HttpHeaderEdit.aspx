<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HttpHeaderEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Collection.HttpHeaderEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>HttpHeader值编辑</title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
     <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script src="../JS/publicform.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
     <script type="text/javascript" src="../js/Collection.js"></script>
   <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">$(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });$(pageInitHttpHeaderEdit);</script>
</head>
<body style=" margin:0; padding:0;">
    <form id="theForm" runat="server">
    <div class="container" style=" margin:0; padding:0;">
        <div id="panel">
    <dl>
        <dd>&nbsp;&nbsp; Http请求头：</dd>
        <dd>
            <asp:TextBox ID="txtRequestHeader" runat="server" Width="250"></asp:TextBox>
            <select id="ProtectedHeader">
                <option value="Accept">Accept</option>
                <option value="Connection">Connection</option>
                <option value="ContentType">Content-Type </option>
                <option value="Expect">Expect</option>
                <option value="IfModifiedSince">If-Modified-Since </option>
                <option value="Referer">Referer</option>
                <option value="TransferEncoding">Transfer-Encoding</option>
                <option value="UserAgent">User-Agent</option>
                <option value="Accept-Language">Accept-Language</option>
                <option value="Accept-Encoding">Accept-Encoding</option>
            </select>
        </dd>
    </dl>
    <dl>
        <dd>Http请求头值：</dd>
        <dd><asp:TextBox ID="txtRequestValue" TextMode="MultiLine" Height="150" Width="450" runat="server"></asp:TextBox></dd>
    </dl>
    </div>
   <div class="Submit">
         <asp:Button ID="btnSave" class="subButton"  runat="server" Text="添 加" OnClick="Save" />
	    <input class="subButton" type="button"onclick="location.href='HttpHeaderList.aspx?ID=<%=ConfigID %>'" value="返回" />
   </div>
    </div>
    </form>
        <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
