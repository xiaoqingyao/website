<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="KingTop.Web.Admin.Template"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>模板管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <link href="../CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#theForm").validationEngine({ validationEventTriggers: "blur",  //触发的事件  validationEventTriggers:"keyup blur",
                inlineValidation: true, //是否即时验证，false为提交表单时验证,默认true
                success: false, //为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
                promptPosition: "topRight"//提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
            })
        });
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> > <a href="CustomFormList.aspx?NodeCode=<%=NodeCode %>">自定义表单管理</a>
            <span style="color: Blue">表单模板管理</span></h4>
        <dl>
            <dt>前台表单模板：</dt>
            <dd>
                <textarea id="txtCode" name="txtCode" rows="40" cols="130" runat="server"></textarea>*
            </dd>
        </dl>
        <div style="clear: left">
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Save %>" Class="subButton"
                OnClick="btnSave_Click" />
            &nbsp;<input type="button" class="subButton" onclick="location.href='CustomFormList.aspx<%=StrPageParams2("CustomFormList.aspx",NodeCode) %>'"
                name="Submit422" value="<%= Resources.Common.Back %>">
        </div>
    </div>
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
