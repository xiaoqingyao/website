<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentForm.aspx.cs" Inherits="AllPower.WEB.main.Plus.Comment.CommentForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>���۱�ģ��</title>
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
            $("#frmComment").validationEngine({ validationEventTriggers: "blur", //�������¼�  validationEventTriggers:"keyup blur",
                inlineValidation: true,                                          //�Ƿ�ʱ��֤��falseΪ�ύ��ʱ��֤,Ĭ��true
                success: false,                                                  //Ϊtrueʱ��ʹ�в����ϵ�Ҳ�ύ��,false��ʾֻ��ȫ��ͨ����֤�˲����ύ��,Ĭ��false
                promptPosition: "topRight"                                       //��ʾ���ڵ�λ�ã�topLeft, topRight, bottomLeft,  centerRight, bottomRight
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
                    <h3 style="color: #0080FF; size: 10px; font: ����">
                        ���µ�����</h3>
                </td>
                <td align="right">
                    <a href="CommentListTemp.aspx?NewsId=<%=StrNewsId %>&NodeCode=<%=NodeCode%>" target="_blank">
                        <img src="../Common/images/more.gif" alt="����" style="border: 0" /></a>
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
                                        <%#Eval("AddDate") %>����
                                    </td>
                                </tr>
                                <tr class="btd2">
                                    <td colspan="6">
                                        <%#Eval("Content")%>
                                    </td>
                                </tr>
                                <tr class="btd2">
                                    <td>
                                        <asp:Label ID="lblScore" runat="server" Text='<%#"����:"+Eval("Score") %>' Visible='<%#GetLinkButtonVisible("IsScore") %>'></asp:Label>
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
                <h3 style="color: #0080FF; font: ����">
                    ��Ҫ����</h3>
                <br />
            </td>
            <td>
                <a href="CommentListTemp.aspx?NewsId=<%=StrNewsId %>&NodeCode=<%=NodeCode%>" class="abtn"
                    target="_blank">�鿴����</a>
            </td>
        </tr>
        <tr>
            <asp:Panel ID="plScore" runat="server" Visible="false">
                <td width="5%" align="right">
                    ����:
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
                    �û���:
                </td>
                <td>
                    <input type="text" id="txtUserName" name="txtUserName" class="<%=className %>" value="<%=userName %>" />
                </td>
                <td>
                    �� ��:
                </td>
                <td>
                    <input id="txtPwd" name="txtPwd" class="<%=className %>" type="password" />&nbsp;&nbsp;<a
                        href="../Member/Register.aspx" target="_blank" title="ע��"><font color="blue">ע��</font></a>
                </td>
            </tr>
        </asp:Panel>
        <asp:Panel ID="plLoginAfter" runat="server">
            <tr>
                <td align="right">
                    ���۷�����:
                </td>
                <td colspan="2" width="80%">
                    <h4 style="color: #1E50A2; font-family: ����,serif;">
                        <asp:Literal ID="ltUserName" runat="server"></asp:Literal></h4>
                </td>
            </tr>
        </asp:Panel>
        <tr>
            <td width="8%" align="right">
                �� &nbsp;��:
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
                    ��֤��:
                </td>
                <td width="30%">
                    <input name="validate" id='validate' type="text" size="8" class="validate[required]"
                        maxlength="6" onfocus="this.select()" /><img src='ValidateCode.aspx' alt='���ˢ����֤��'
                            style='cursor: pointer' onclick="src='ValidateCode.aspx?s='+Math.random()" />
                </td>
            </asp:Panel>
            <td align="left">
                <asp:Button ID="btnSave" runat="server" Text="��������" OnClick="btnSave_Click" CssClass="subButton"
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
