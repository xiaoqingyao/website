<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataBaseExecSql.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.DataBaseExecSql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>在线执行sql</title>
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
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>
    <style type="text/css">
    td
    {
        padding:5px;
    }
    th
    {
        padding:5px;
    }
    </style>

</head>
<body>
  <form id="theForm" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="con">
            <div id="searchContainer" style="padding-left: 10px;">
                <img src="../img/dialogImage/iconAlert.gif" style="height: 19px; width: 22px; vertical-align: bottom" />请把要执行的SQL语句粘贴到下面的文本框
            </div>
            <ul style="padding-top: 10px; padding-left:20px">
                <asp:TextBox ID="txtSql" runat="server" TextMode="MultiLine" Width="70%" Height="260px" CssClass="validate[required]"></asp:TextBox></ul>
            <br clear="left" />
            <div class="Submit">
                <asp:Button ID="btnSave" CssClass="subButton" runat="server" Text="执行sql" OnClick="btnSave_Click" /></div>
            <br />
            <ul>
                <asp:GridView ID="gvSelectData" runat="server" Width="100%">
                <HeaderStyle CssClass="ulheader" />
                </asp:GridView>
            </ul>
        </div>
    </div>
    </form>
</body>
</html>
