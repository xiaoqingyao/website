<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvertisementConfigEdit.aspx.cs"
    Inherits="AllPower.Web.Admin.AdvertisementConfigEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>广告配置</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <link href="../CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#theForm").validationEngine({ validationEventTriggers: "blur",       //触发的事件  validationEventTriggers:"keyup blur",
                inlineValidation: true,                                             //是否即时验证，false为提交表单时验证,默认true
                success: false,                                                     //为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
                promptPosition: "topRight"                                          //提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
            })
        });
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> > <a href="#">广告管理</a> > <span style="color: Blue">广告设置</span>
        </h4>
        <dl>
            <dt>
                <%=Resources.Model.IsReview%></dt>
            <dd>
                <asp:CheckBox ID="cbIsReview" runat="server" />
                <%=Resources.Common.ON %>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.ReviewFlow%></dt>
            <dd>
                <asp:DropDownList ID="ddlReviewFlow" runat="server">
                </asp:DropDownList>
            </dd>
        </dl>
        <div style="clear: left">
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" Class="subButton" runat="server" Text="<%$Resources:Common,Add %>"
                OnClick="btnSave_Click" />
        </div>
    </div>
    </form>
</body>
</html>
