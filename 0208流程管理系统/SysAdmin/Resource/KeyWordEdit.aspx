<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KeyWordEdit.aspx.cs" Inherits="AllPower.Web.Admin.KeywordEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>编辑关键字</title>
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

    <script type="text/javascript">
        var id;
       <%=jsMessage %>
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        $(function() {
            var name = "关键字编辑";
            var listUrl = "KeyWordList.aspx?<%=BackParam %>";
            var addUrl = "KeywordEdit.aspx?action=add&NodeCode=<%=NodeCode%>";
            var updateUrl = "KeywordEdit.aspx?action=edit&NodeCode=<%=NodeCode%>&id=" + id;
            showEditMessage(name, listUrl, addUrl, updateUrl);
        });
    </script>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置:<%GetPageNav(NodeCode);%>
        </h4>
        <dl>
            <dt>*<asp:Literal ID="Literal1" Text='<%$Resources:Resource,ResourceKeyWordName %>'
                runat="server"></asp:Literal>：</dt>
            <dd>
                <asp:TextBox ID="txtName" CssClass="validate[required,length[1,64]]" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>*<asp:Literal ID="Literal2" Text='<%$Resources:Resource,ResourceKeyWordOrders %>'
                runat="server"></asp:Literal>：</dt>
            <dd>
                <asp:TextBox ID="txtOrders" runat="server" ReadOnly="true"></asp:TextBox>
            </dd>
        </dl>
        <dl>
            <dt>
                <asp:Literal ID="Literal3" Text='<%$Resources:Resource,ResourceKeyWordTypeName %>'
                    runat="server"></asp:Literal>： </dt>
            <dd>
                <asp:RadioButtonList ID="radlTypeName" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Value="搜索关键字" Selected="True" Text="搜索关键字"></asp:ListItem>
                    <asp:ListItem Value="常规关键字" Text="常规关键字"></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <div class="Submit">
            <asp:Button ID="btnKeyWord" runat="server" Text="添加" OnCommand="Keyword_Edit" />
            &nbsp;<input type="button" name="Submit422" value="返 回" onclick="location.href='KeyWordList.aspx?<%=BackParam %>';">
            <asp:HiddenField ID="hdnID" Value="" runat="server" />
        </div>
    </div>
    </form>
</body>
</html>
