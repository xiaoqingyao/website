<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FieldReplaceEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Collection.FieldReplaceEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
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
   <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
            <h4>位置： <a href="#">信息采集</a> > <a href="#">采集任务</a> > 采集字段 > 字段结果替换</h4> 

        <dl>
            <dt>原内容：</dt>
            <dd><asp:TextBox ID="txtOldContent" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>新内容：</dt>
            <dd><asp:TextBox ID="txtNewContent" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt></dt>
            <dd><asp:CheckBox ID="chkIsReplaceFirst" Text="先于HTML标签处理" runat="server" /></dd>
             <dd><asp:CheckBox ID="chkIsRegex" Text="使用正则表达式" runat="server" /></dd>
            <dd><asp:CheckBox ID="chkIsObtainOldVlaue" Text="只提取旧值" runat="server" /></dd>
             <dd><asp:CheckBox ID="chkIsRepeat" Text="重复提取" runat="server" /></dd>
       </dl>
         <div class="Submit">
            <asp:Button ID="btnSave" CssClass="subButton" OnClick="Save" runat="server" Text="添 加" />&nbsp;&nbsp;
            <input class="subButton" type="button" onclick="location.href='FieldReplaceList.aspx?ID=<%=FieldID %>&TaskID=<%=TaskID %>'" value="返 回" />
        </div>
    </div>
    </form>
    <script type="text/javascript"> <%=jsMessage %></script>
   
</body>
</html>
