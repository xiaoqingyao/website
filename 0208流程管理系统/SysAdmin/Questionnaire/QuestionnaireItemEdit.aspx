<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionnaireItemEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Questionnaire.QuestionnaireItemEdit" %>
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
            <dt>标题：</dt>
            <dd><asp:TextBox ID="txtTitle" runat="server" Width="200" ></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>状态：</dt>
            <dd><asp:CheckBox ID="chkIsEnable" Text="启用" Checked="true" runat="server" /></dd>
        </dl>
        <dl>
            <dt>问题类型：</dt>
            <dd>
                <asp:RadioButtonList ID="radlItemType" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" onclick="$('#Answer').css('display','block')"  Selected="True" Text="单选"></asp:ListItem>
                    <asp:ListItem Value="2" onclick="$('#Answer').css('display','block')"  Text="多选"></asp:ListItem>
                    <asp:ListItem Value="3" onclick="$('#Answer').css('display','none')" Text="问答"></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl id="Answer">
            <dt>备选答案：</dt>
            <dd>
                <asp:TextBox ID="txtItem" style=" width:500px; height:280px;" TextMode="MultiLine" runat="server"></asp:TextBox> <span style=" color:red;">*每个备选答案为一行</span>
            </dd>
        </dl>
        <div class="Submit">
            <asp:Button ID="btnEdit" OnClick="btnEdit_Click" runat="server" Text="添加" />
            <input type="button" value="返回" onclick="location.href='QuestionnaireItemList.aspx?QID=<%=Request.QueryString["QID"] %>'"
        </div>
    </div>
    </form>
    <script type="text/javascript">
        <%= jsMessage%>
    </script>
</body>
</html>
