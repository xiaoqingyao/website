<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentConfigEdit.aspx.cs"
    Inherits="AllPower.Web.Admin.CommentConfigEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>评论配置</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
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
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidAction" runat ="server" value="New" />
    <div class="container">
        <h4>
            位置：
            <%--<%GetPageNav(NodeCode); %>--%>
            扩展应用&gt;评论管理&gt;<span class="breadcrumb_current">评论设置</span></h4>
        <dl>
            <dt>
                <%=Resources.Model.Authcode%></dt>
            <dd>
                <asp:CheckBox ID="cbIsAuthcode" runat="server" />
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsScore%></dt>
            <dd>
                <asp:CheckBox ID="cbIsScore" runat="server" />
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsSquare%></dt>
            <dd>
                <asp:CheckBox ID="cbIsSquare" runat="server" />
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.SquareName%></dt>
            <dd>
                <asp:TextBox ID="txtSquareName" CssClass="validate[required,length[1,15]]" runat="server"></asp:TextBox>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsCounter%></dt>
            <dd>
                <asp:CheckBox ID="cbIsCounter" runat="server" />
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.CounterName%></dt>
            <dd>
                <asp:TextBox ID="txtCounterName" CssClass="validate[required,length[1,15]]" runat="server"></asp:TextBox>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsNeutral%></dt>
            <dd>
                <asp:CheckBox ID="cbIsNeutral" runat="server" />
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.NeutralName%></dt>
            <dd>
                <asp:TextBox ID="txtNeutralName" CssClass="validate[required,length[1,15]]" runat="server"></asp:TextBox>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsReview%></dt>
            <dd>
                <asp:DropDownList ID="ddlReview" runat="server">
                    <asp:ListItem Value="1" Text='<%$Resources:Model,NoReview %>'></asp:ListItem>
                    <asp:ListItem Value="2" Text='<%$Resources:Model,UserNoReview %>'></asp:ListItem>
                    <asp:ListItem Value="3" Text='<%$Resources:Model,Review %>'></asp:ListItem>
                </asp:DropDownList>
            </dd>
        </dl>
        <dl style="display:none">
            <dt>
                <%=Resources.Model.ReviewFlow%></dt>
            <dd>
                <asp:DropDownList ID="ddlReviewFlow" runat="server">
                </asp:DropDownList>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.SubmitLimitTimeComment%></dt>
            <dd>
                <asp:TextBox ID="txtSubmitLimitTime" runat="server" CssClass="validate[required,custom[onlyNumber]]">0</asp:TextBox> 分钟，
                0为不限制提交时间
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.LimitTime%></dt>
            <dd>
                <asp:TextBox ID="txtLimitTime" runat="server" CssClass="validate[required,custom[onlyNumber]]">0</asp:TextBox> 分钟，
                0为不限制
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.SubmitLimitIP%></dt>
            <dd>
                <asp:TextBox ID="txtSubmitLimitIP" runat="server" Height="110px" TextMode="MultiLine"
                    Width="327px"></asp:TextBox>
                例如 192.168.0.*|192.168.1.50-198.168.1.100
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsUserSubmit%></dt>
            <dd>
                <asp:CheckBox ID="cbIsUserSubmit" runat="server" />
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsEnable.Replace("：", "")%></dt>
            <dd>
                <asp:CheckBox ID="IsEnable" runat="server" />
            </dd>
        </dl>
        <dl>
            <dt>是否显示最新五条<br />在内容下方显示最新5条评论</dt>
            <dd>
                <asp:CheckBox ID="ckbIsShowFifth" runat="server" Checked="true" />
            </dd>
        </dl>
        <div style="clear: left">
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Class="subButton" Text="确定"
                OnClick="btnSave_Click" />
        </div>
    </div>
    </form>
</body>
</html>
