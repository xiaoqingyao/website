<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentPageEdit.aspx.cs"
    Inherits="KingTop.WEB.SysAdmin.Model.CommentPageEdit" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>评论模板编辑</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script type="text/javascript" language="">
        function checkForm() {
            var code = document.getElementById("<%=txtCode.ClientID %>").value;
            if (code.length == 0 || code == "") {
                alert({ msg: "内容不能为空！", title: "操作提示" });
                return false;
            }
        }
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> > <a href="CommentTemplateList.aspx?Action=ALL&NodeCode=<%=NodeCode %>">
                评论模板列表</a> &gt;<span style="color: Blue">前台页面编辑</span>
        </h4>
        <dl>
            <dt>模板内容：</dt>
            <dd>
                <asp:TextBox ID="txtCode" runat="server" TextMode="MultiLine" Height="560px" Width="800px"></asp:TextBox><font
                    color="red">*</font>
            </dd>
        </dl>
        <div style="clear: left">
        </div>
        <div class="Submit" style="text-align: center">
            <asp:Button ID="btnSave" Class="subButton" runat="server" Text="<%$Resources:Common,Save %>"
                OnClick="btnSave_Click" OnClientClick="checkForm()" />
            &nbsp;<input type="button" class="subButton" onclick="location.href='CommentTemplateList.aspx<%=StrPageParams2("CommentTemplateList.aspx",NodeCode) %>'"
                name="Submit422" value="<%= Resources.Common.Back %>" />
        </div>
    </div>
    </form>
</body>
</html>
