<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FriendLinkClassEdit.aspx.cs"
    Inherits="AllPower.Web.Admin.FriendLinkClassEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加分类</title>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script type="text/javascript" src="../Editor/ckeditor/ckeditor.js"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
            var id = "<%=Request.QueryString["id"] %>";
        window.onload = function() {
            if (type > -1) {
                var name = "友情链接分类";
                var listUrl = "FriendLinkClassList.aspx<%=StrPageParams %>";
                var addUrl = "FriendLinkClassEdit.aspx?action=NEW&NodeCode=<%=NodeCode%>";
                var updateUrl = "?action=edit&NodeCode=<%=NodeCode%>&id="+id;
                showEditMessage(name, listUrl, addUrl, updateUrl);
            }
        }
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a><a> &gt;</a> <a href="FriendLinkClassList.aspx?NodeCode=<%=NodeCode %>">
                友情链接分类</a><a> &gt;</a> <span style="color: Blue">添加/编辑分类</span>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt>
                        <%=Resources.FriendLink.ClassName%></dt>
                    <dd>
                        <asp:TextBox ID="txtClassName" runat="server" CssClass="validate[required,length[3,20]]"></asp:TextBox>
                        <font color="red">*</font></dd>
                </dl>
                <dl>
                    <dt>
                        <%=Resources.FriendLink.LinkColor%></dt>
                    <dd>
                        <asp:DropDownList ID="dropLinkColor" runat="server">
                        </asp:DropDownList>
                        <asp:CheckBox ID="chkIsBold" runat="server" /><%=Resources.FriendLink.Bold%></dd>
                </dl>
                <dl>
                    <dt>
                        <%=Resources.FriendLink.ClassDesc%></dt>
                    <dd>
                        <asp:TextBox ID="txtDesc" TextMode="MultiLine" Rows="5" Columns="50" runat="server"></asp:TextBox></dd>
                </dl>
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnSave_Click"
                CssClass="subButton" />
            <input type="button" name="Submit422" value="<%= Resources.Common.Back %>" onclick='location.href="FriendLinkClassList.aspx<%=StrPageParams %>";'
                class="subButton" />
        </div>
    </div>
    </form>
</body>
</html>
