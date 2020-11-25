<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Questionnaire.Template" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
    <dl>
        <dt></dt>
        <dd style=" color:red;">注：[#content#] 为替换内容   [loop]....[/loop] 为循环标签</dd>
    </dl>
        <dl>
            <dt>单选标题：</dt>
            <dd><asp:TextBox ID="txtSingleSelTitle" style=" width:500px; height:60px;" TextMode="MultiLine" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>单选：</dt>
            <dd><asp:TextBox ID="txtSingleSel" style=" width:500px; height:120px;" TextMode="MultiLine" runat="server"></asp:TextBox></dd>
        </dl>
         <dl>
            <dt>多选标题：</dt>
            <dd><asp:TextBox ID="txtMultiSelTitle" style=" width:500px; height:60px;"  TextMode="MultiLine" runat="server"></asp:TextBox></dd>
        </dl>
         <dl>
            <dt>多选：</dt>
            <dd><asp:TextBox ID="txtMultiSel" style=" width:500px; height:120px;"  TextMode="MultiLine" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>问答标题：</dt>
            <dd><asp:TextBox ID="txtAnswerTitle" style=" width:500px; height:60px;"  TextMode="MultiLine" runat="server"></asp:TextBox></dd>
        </dl>
         <dl>
            <dt>问答：</dt>
            <dd><asp:TextBox ID="txtAnswer" style=" width:500px; height:120px;"  TextMode="MultiLine" runat="server"></asp:TextBox></dd>
        </dl>
       <div class="Submit">
            <asp:Button ID="btnEdit" runat="server" Text="确定" onclick="btnEdit_Click" />&nbsp;&nbsp;
            <input type="button" value="返回" onclick="location.href='QuestionnaireList.aspx'" />
        </div>
    </div>
    </form>
    <script type="text/javascript">
    <%=jsMessage %>
    </script>
</body>
</html>
