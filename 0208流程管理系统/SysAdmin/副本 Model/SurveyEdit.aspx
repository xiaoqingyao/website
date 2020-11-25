<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyEdit.aspx.cs" Inherits="KingTop.Web.Admin.SurveyEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加问卷调查</title>
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

    <script type="text/javascript" src="../js/Advertising.js"></script>

    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>

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
                showEditMessage("问卷调查", "SurveyList.aspx<%=StrPageParams %>", "SurveyEdit.aspx?NodeCode=<%=NodeCode %>", "SurveyEdit.aspx?NodeCode=<%=NodeCode %>&action=edit&id=<%=ID %>");
            }
        }      
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> > <a href="SurveyList.aspx?Action=ALL&NodeCode=<%=NodeCode %>">
                问卷调查管理</a> &gt;<span style="color: Blue">添加/修改问卷调查</span></h4>
        <dl>
            <dt>
                <%=Resources.Common.Name%></dt>
            <dd>
                <asp:TextBox ID="txtName" runat="server" CssClass="validate[required,length[1,64]]"></asp:TextBox>*
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Common.Describe%></dt>
            <dd>
                <asp:TextBox ID="txtDesc" runat="server" Height="99px" Width="365px"></asp:TextBox>*
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.SubmitLimitIP%></dt>
            <dd>
                <asp:TextBox ID="txtIPLimit" runat="server" TextMode="MultiLine" Height="110px" Width="370px"></asp:TextBox>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.VoteIPCount%></dt>
            <dd>
                <asp:TextBox ID="txtSurveyIPCount" runat="server" Text="0" CssClass="validate[required,length[1,6]]"></asp:TextBox>
                <%=Resources.Model.VoteIPCountMessage%>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Content.PwdText%></dt>
            <dd>
                <asp:TextBox ID="txtPwd" runat="server"></asp:TextBox>
                <%=Resources.Content.PwdTextDesc%>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.LastTime%></dt>
            <dd>
                <asp:TextBox ID="txtExpiredTime" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"
                    CssClass="validate[required]" runat="server"></asp:TextBox>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsUserVote%></dt>
            <dd>
                <asp:CheckBox ID="cbIsUserSurvey" runat="server" />
                <%=Resources.Common.Yes%>
            </dd>
        </dl>
        <dl style="display: none">
            <dt>会员允许投票次数<%=Resources.Common.Name%></dt>
            <dd>
                <asp:TextBox ID="txtSurveyUserCount" runat="server" Text="0" CssClass="validate[required,length[1,6]]"></asp:TextBox>
                <%=Resources.Model.VoteIPCountMessage%>
            </dd>
        </dl>
        <div style="clear: left">
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Class="subButton" Text="<%$Resources:Common,Add %>"
                OnClick="btnSave_Click" />
            &nbsp;<input type="button" name="Submit422" class="subButton" value="<%= Resources.Common.Back %>"
                onclick='location.href="SurveyList.aspx<%=StrPageParams %>";'>
        </div>
    </div>
    </form>
</body>
</html>
