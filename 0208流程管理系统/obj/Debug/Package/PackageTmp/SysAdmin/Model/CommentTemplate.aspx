<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentTemplate.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.Model.CommentTemplate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>前台评论模板</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta name="Microsoft Theme" content="none, default" />
    <meta name="Microsoft Border" content="none, default" />
    <link href="/SysAdmin/css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="/SysAdmin/js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="/SysAdmin/js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="/SysAdmin/js/publicform.js"></script>

    <link href="/SysAdmin/CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

    <script src="/SysAdmin/JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="/SysAdmin/JS/jquery-validationEngine-cn.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#frmComment").validationEngine({ validationEventTriggers: "blur", //触发的事件  validationEventTriggers:"keyup blur",
                inlineValidation: true,                                          //是否即时验证，false为提交表单时验证,默认true
                success: false,                                                  //为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
                promptPosition: "topRight"                                       //提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
            })
        });
    </script>

</head>
<body>
    <form id="frmComment" runat="server">
    <div>
        <table border="0" cellspacing="2" cellpadding="3" width="75%">
            <tr>
                <td colspan="3">
                    <h3 style="color: #0080FF; size: 10px; font: 黑体">
                        我要评论</h3>
                    <br />
                </td>
            </tr>
            <tr>
                <asp:Panel ID="plScore" runat="server" Visible="false">
                    <td width="5%" align="right">
                        评分:
                    </td>
                    <td colspan="2">
                        <asp:RadioButtonList ID="rbtlScore" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem Selected="True">5</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td colspan="2">
                    用户名:<input type="text" id="txtUserName" name="txtUserName" class="<%=className %>"
                        value="<%=userName %>" />
                </td>
                <td>
                    密 &nbsp;码:<input type="text" id="txtPwd" name="txtPwd" class="<%=className %>" />
                </td>
            </tr>
            <tr>
                <td width="8%" align="right">
                    内 &nbsp;容:
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtDescribe" runat="server" Height="150px" TextMode="MultiLine"
                        Width="80%" CssClass="validate[required,length[1,500]]"></asp:TextBox><font color="red">*</font>
                </td>
            </tr>
            <tr>
                <asp:Panel ID="plcode" runat="server" Visible="false">
                    <td width="8%" align="right">
                        验证码:
                    </td>
                    <td width="30%">
                        <input name="validate" id='validate' type="text" size="8" class="validate[required]"
                            maxlength="6" onfocus="this.select()" /><img src='/SysAdmin/ValidateCode.aspx' alt='点击刷新验证码'
                                style='cursor: pointer' onclick="src='/SysAdmin/ValidateCode.aspx?s='+Math.random()" />
                    </td>
                </asp:Panel>
                <td align="left">
                    <asp:Button ID="btnSave" runat="server" Text="发表评论" OnClick="btnSave_Click" CssClass="subButton"
                        Height="100%" />
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
