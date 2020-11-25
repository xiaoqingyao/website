<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentForm.aspx.cs" Inherits="AllPower.WEB.main.Plus.Comment.CommentForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>评论表单模板</title>
    <meta http-equiv="Content-Type" content="text/html; charset=uft-8" />
    <link rel="stylesheet" href="/SysAdmin/CSS/mm.css" type="text/css" />
    <link rel="stylesheet" href="/SysAdmin/CSS/main.css" type="text/css" />
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
    <form id="frmCF" runat="server">
    <asp:Panel ID="plFifth" runat="server">
        <table width="680px" border="0" cellspacing="10" cellpadding="0">
            <tr>
                <td>
                    <h3 style="color: #0080FF; size: 10px; font: 黑体">
                        最新的评论</h3>
                </td>
                <td align="right">
                    <a href="CommentListTemp.aspx?NewsId=<%=StrNewsId %>&NodeCode=<%=NodeCode%>" target="_blank">
                        <img src="../Common/images/more.gif" alt="更多" style="border: 0" /></a>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table border="0" cellspacing="1" cellpadding="3" width="100%">
                        <tr>
                            <td colspan="2" class="btd">
                            </td>
                        </tr>
                        <asp:Repeater ID="rptModelFileGroup" runat="server">
                            <ItemTemplate>
                                <tr class="btd2">
                                    <td align="center">
                                        <%#Eval("username")%>
                                    </td>
                                    <td colspan="5" style="text-align: right">
                                        <%#Eval("AddDate") %>发表
                                    </td>
                                </tr>
                                <tr class="btd2">
                                    <td colspan="6">
                                        <%#Eval("Content")%>
                                    </td>
                                </tr>
                                <tr class="btd2">
                                    <td>
                                        <asp:Label ID="lblScore" runat="server" Text='<%#"评分:"+Eval("Score") %>' Visible='<%#GetLinkButtonVisible("IsScore") %>'></asp:Label>
                                    </td>
                                    <td colspan="5" align="right">
                                        <asp:LinkButton ID="lbtnSquare" runat="server" CommandArgument='<%#Eval("id").ToString()+"|Square" %>'
                                            OnCommand="lbtnl_Click" Visible='<%#GetLinkButtonVisible("IsSquare") %>' Text='<%#GetLinkButtonText("SquareName",Eval("SquareCount").ToString()) %>'></asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="lbtnNeutral" runat="server" CommandArgument='<%#Eval("id").ToString()+"|Neutral" %>'
                                            OnCommand="lbtnl_Click" Visible='<%#GetLinkButtonVisible("isNeutral") %>' Text='<%#GetLinkButtonText("NeutralName",Eval("NeutralCount").ToString()) %>'></asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="lbtnCounter" runat="server" CommandArgument='<%#Eval("id").ToString()+"|Counter" %>'
                                            OnCommand="lbtnl_Click" Visible='<%#GetLinkButtonVisible("isCounter") %>' Text='<%#GetLinkButtonText("CounterName",Eval("CounterCount").ToString()) %>'></asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="height: 2px">
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <table border="0" cellspacing="2" cellpadding="3" width="680px">
        <tr>
            <td colspan="2">
                <h3 style="color: #0080FF; font: 黑体">
                    我要评论</h3>
                <br />
            </td>
            <td>
                <a href="CommentListTemp.aspx?NewsId=<%=StrNewsId %>&NodeCode=<%=NodeCode%>" class="abtn"
                    target="_blank">查看评论</a>
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
        <asp:Panel ID="plLogin" runat="server" Visible="false">
            <tr>
                <td>
                    用户名:
                </td>
                <td>
                    <input type="text" id="txtUserName" name="txtUserName" class="<%=className %>" value="<%=userName %>" />
                </td>
                <td>
                    密 码:
                </td>
                <td>
                    <input id="txtPwd" name="txtPwd" class="<%=className %>" type="password" />&nbsp;&nbsp;<a
                        href="../Member/Register.aspx" target="_blank" title="注册"><font color="blue">注册</font></a>
                </td>
            </tr>
        </asp:Panel>
        <asp:Panel ID="plLoginAfter" runat="server">
            <tr>
                <td align="right">
                    评论发言者:
                </td>
                <td colspan="2" width="80%">
                    <h4 style="color: #1E50A2; font-family: 宋体,serif;">
                        <asp:Literal ID="ltUserName" runat="server"></asp:Literal></h4>
                </td>
            </tr>
        </asp:Panel>
        <tr>
            <td width="8%" align="right">
                内 &nbsp;容:
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtDescribe" runat="server" Height="150px" TextMode="MultiLine"
                    Width="90%" CssClass="validate[required,length[1,500]]"></asp:TextBox><font color="red">
                        *</font>
            </td>
        </tr>
        <tr>
            <asp:Panel ID="plcode" runat="server" Visible="false">
                <td width="8%" align="right">
                    验证码:
                </td>
                <td width="30%">
                    <input name="validate" id='validate' type="text" size="8" class="validate[required]"
                        maxlength="6" onfocus="this.select()" /><img src='ValidateCode.aspx' alt='点击刷新验证码'
                            style='cursor: pointer' onclick="src='ValidateCode.aspx?s='+Math.random()" />
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
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
