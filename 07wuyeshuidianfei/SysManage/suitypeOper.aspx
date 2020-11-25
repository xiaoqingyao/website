<%@ Page Language="C#" MasterPageFile="~/SysManage/MasterPage.master" AutoEventWireup="true" CodeFile="suitypeOper.aspx.cs" Inherits="SysManage_suitypeOper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript" src="js/date.js"></script>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="30" background="images/tab_05.gif">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="50%" valign="middle">
                                        <img src="images/tb.gif" width="16" height="16" align="absmiddle" />
                                        当前位置：<%=parentid == "1" ? "水价类别" : (parentid == "2" ? "台区" : "电价类别")%>设置
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="width: 8px">&nbsp;</td>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
                                class="tab1" style="margin-top:10px;">
                                
                                <tr>
                                    <td width="100" align="right" style="height:26px">类别名称：</td>
                                    <td>
                                        <asp:TextBox ID="suitypename" runat="server" CssClass="textbox" Width="220px"></asp:TextBox>
                                    </td>
                                </tr>
                                
                                
                                
                                <tr>
                                    <td align="right" style="padding:20px 0;">&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnSubmit" runat="server" Text=" 提交信息 " OnClick="btnSubmit_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="Button1" type="button" value="返回" onclick="javascript:history.go(-1);" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="8">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>