<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewFlowStateEdit.aspx.cs"
    Inherits="AllPower.Web.Admin.ReviewFlowStateEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加审核流程状态</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
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
            $("#theForm").validationEngine({ validationEventTriggers: "blur",  //触发的事件  validationEventTriggers:"keyup blur",
                inlineValidation: true, //是否即时验证，false为提交表单时验证,默认true
                success: false, //为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
                promptPosition: "topRight"//提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
            })
        });
        window.onload = function() {
            if (type > -1) {
                showEditMessage("审核流程状态", "ReviewFlowStateList.aspx<%=StrPageParams %>", "ReviewFlowStateEdit.aspx?NodeCode=<%=NodeCode %>", "ReviewFlowStateEdit.aspx?NodeCode=<%=NodeCode %>&action=edit&id=<%=ID %>");
            }
        }
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">系统管理</a> > <a href="ReviewFlowStateList.aspx?NodeCode=<%=NodeCode %>">
                ">审核流程状态管理</a> <span style="color: Blue">添加审核流程状态</span></h4>
        <dl>
            <dt>
                <%=Resources.Model.ModelValue%></dt>
            <dd>
                <asp:DropDownList ID="ddlValue" runat="server">
                </asp:DropDownList>
                <asp:Label ID="lblvalue" runat="server" Visible="false"></asp:Label>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.ModelFieldGroupName%></dt>
            <dd>
                <asp:TextBox ID="txtName" runat="server" CssClass="validate[required,length[1,64]"></asp:TextBox>*
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Common.Describe%></dt>
            <dd>
                <asp:TextBox ID="txtDescribe" runat="server" Height="150px" TextMode="MultiLine"
                    Width="273px"></asp:TextBox>*
            </dd>
        </dl>
        <div style="clear: left">
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Class="subButton" Text="<%$Resources:Common,Add %>"
                OnClick="btnSave_Click" />
            &nbsp;<input type="button" class="subButton" name="Submit422" value="<%= Resources.Common.Back %>"
                onclick='location.href="ReviewFlowStateList.aspx<%=StrPageParams %>";'>
        </div>
    </div>
    </form>
</body>
</html>
