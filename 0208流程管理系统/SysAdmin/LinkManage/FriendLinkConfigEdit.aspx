<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FriendLinkConfigEdit.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.LinkManage.FriendLinkConfigEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>友情链接配置</title>
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
                inlineValidation: true,                                        //是否即时验证，false为提交表单时验证,默认true
                success: false,                                                //为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
                promptPosition: "topRight"                                     //提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
            })
        });
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置： 扩展应用&gt;友情链接管理&gt; <span class="breadcrumb_current">友情链接设置</span></h4>
        <div style="text-align: center">
            <%-- <dl>
                <dt>链接类型：</dt>
                <dd>
                    <asp:RadioButtonList ID="rblLinkType" runat="server" RepeatDirection="Horizontal"
                        RepeatLayout="Flow">
                        <asp:ListItem Value="1" Text="文字链接" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Logo链接"></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>--%>
            <dl>
                <dt>所属的分类：</dt>
                <dd>
                    <asp:TextBox ID="txtLinkClass" runat="server" Text="0" Width="160px"></asp:TextBox><font
                        color="red">*</font>
                    <asp:DropDownList ID="ddlLinkClass" runat="server">
                    </asp:DropDownList>
                    【<span style="color: #077AC7">注：不填或为0表示显示所有分类</span>】
                </dd>
            </dl>
            <dl>
                <dt>是否推荐：</dt>
                <dd>
                    <asp:RadioButtonList ID="rblRecomment" runat="server" RepeatDirection="Horizontal"
                        RepeatLayout="Flow">
                        <asp:ListItem Value="0" Text="不推荐" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="1" Text="推荐"></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>
            <dl>
                <dt>显示的链接数：</dt>
                <dd>
                    <asp:TextBox ID="txtLinkCounts" runat="server" CssClass="validate[required,custom[onlyNumber]]"
                        Text="18" Width="50px"></asp:TextBox><font color="red">*</font>&nbsp;<span style="color: #077AC7">注：这里是指显示在前台的链接条数</span>
                </dd>
            </dl>
            <dl>
                <dt>是否启用：</dt>
                <dd>
                    <asp:CheckBox ID="IsEnable" runat="server" />
                </dd>
            </dl>
            <div style="clear: left">
            </div>
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Class="subButton" Text="保存设置" OnClick="btnSave_Click" />
        </div>
    </div>
    </form>
</body>
</html>
