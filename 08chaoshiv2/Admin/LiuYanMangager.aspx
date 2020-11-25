<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LiuYanMangager.aspx.cs" Inherits="Admin_LiuYanMangager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <table border="0" style="width: 100%">
            <tr>
                <td align="left" style="height: 17px">
                    &nbsp;<table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
                        cellpadding="4" cellspacing="0" style="width: 100%">
                        <tr bgcolor="#4296e7">
                            <td colspan="1" style="height: 24px" class="style1">
                                 留言管理 
                            </td>
                        </tr>
                        <tr>
                            <td width="79%">
                              <asp:DataList ID="dlTopic" runat="server" Width="480px">
                    <ItemTemplate>
                        <table border="1" bordercolor="#ffffff" cellspacing="0" style="width: 100%;">
                            <tr>
                                <td colspan="2" style="height: 18px">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" valign="top">
                                    用户:
                                    <%# Eval("MessageUser")%>
                                    ||留言时间:
                                    <%# Eval("MessageTime")%><a href='LiuYanD.aspx?id=<%# Eval("MessageID") %>'>删除</a>
                                    <a href='huifu.aspx?id=<%# Eval("MessageID") %>'>回复</a>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"   valign="top">
                                    留言内容:<br />
                                    <%# Eval("MessageContent")%>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="height: 22px" valign="top">
                                    回复时间：<%# Eval("HuiFuTime")%><br />
                                    回复内容：<%# Eval("HuiFuNeiRong")%><br />
                                    </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1">
                                <div align="center">
                                    &nbsp;</div>
                            </td>
                        </tr>
                        <tr bgcolor="#4296e7">
                            <td colspan="1">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
