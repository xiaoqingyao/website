<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyItemEdit.aspx.cs"
    Inherits="KingTop.Web.Admin.SurveyItemEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加问卷调查选项</title>
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

    <script type="text/javascript" src="../js/SurveyItem.js"></script>

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
                showEditMessage("问卷调查选项", "SurveyItemList.aspx<%=StrPageParams %>", "SurveyItemEdit.aspx?NodeCode=<%=NodeCode %>&nid=<%=StrNid %>", "SurveyItemEdit.aspx?NodeCode=<%=NodeCode %>&nid=<%=StrNid %>&action=edit&id=<%=ID %>");
            }
        } 
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> > <a href="SurveyList.aspx?NodeCode=<%=NodeCode %>">问卷调查管理</a>
            > <a href="SurveyItemList.aspx?NodeCode=<%=NodeCode %>&nid=<%=StrNid %>">问卷调查选项管理</a>
            > <span style="color: Blue">添加/修改问卷调查选项</span></h4>
        <dl>
            <dt>
                <%=Resources.Model.ModelFieldGroupName%></dt>
            <dd>
                <asp:TextBox ID="txtName" runat="server" CssClass="validate[required,length[1,64]]"></asp:TextBox>*
            </dd>
        </dl>
        <dl>
            <dt>是否必填：</dt>
            <dd>
                <asp:CheckBox ID="cbIsRequired" runat="server" Checked="true" />
                <%=Resources.Common.Yes %>
            </dd>
        </dl>
        <dl>
            <dt>显示在投票详情列表：</dt>
            <dd>
                <asp:CheckBox ID="cbIsShow" runat="server" Checked="false" />
                <%=Resources.Common.Yes %>&nbsp; 注:此设置为"是"后在投票详情列表才会显示此问题选项和相关的投票信息
            </dd>
        </dl>
        <dl>
            <dt>问题类型：</dt>
            <dd>
                <asp:RadioButtonList ID="rbtlType" runat="server" RepeatDirection="Horizontal" RepeatColumns="5"
                    onclick="SurveyItem.TypeChange();">
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl id="dl1" runat="server">
            <dt>回答的最多字符数：</dt>
            <dd>
                <asp:TextBox ID="txtFontSize" runat="server" CssClass="validate[required,custom[onlyNumber],length[1,255]]"
                    Text="255" Width="45px"></asp:TextBox>*
            </dd>
        </dl>
        <dl id="dl2" style="display: none">
            <dt>问题选项</dt>
            <dd>
                <asp:TextBox ID="txtDataItemd" runat="server" Height="141px" TextMode="MultiLine"
                    Width="273px"></asp:TextBox>
                示例 男|女|保密
            </dd>
        </dl>
        <dl id="dl3" style="display: none">
            <dt>列表行数</dt>
            <dd>
                <asp:TextBox ID="txtRowCount" runat="server" CssClass="validate[required,custom[onlyNumber]]"
                    MaxLength="1" Text="0" Width="45px"></asp:TextBox>*
            </dd>
        </dl>
        <div style="clear: left">
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Class="subButton" Text="<%$Resources:Common,Add %>"
                OnClick="btnSave_Click" />&nbsp;<input type="button" name="Submit422" value="<%= Resources.Common.Back %>"
                    class="subButton" onclick='location.href="SurveyItemList.aspx<%=StrPageParams %>";'>
        </div>
    </div>
    </form>
</body>
</html>
