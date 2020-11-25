<%@ Page Language="C#" MasterPageFile="~/SysManage/MasterPage.master" AutoEventWireup="true" CodeFile="NewsOper.aspx.cs" Inherits="SysManage_NewsOper" %>
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
                                        当前位置：<%=typeid == "1" ? "系统广播" : "信息"%>操作
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
                        <td width="8">&nbsp;</td>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#9FBD65" class="tab1">
                                <tr>
                                    <td width="100" align="right" style="height:50px"><%=typeid == "1" ? "系统广播" : "信息"%>标题：</td>
                                    <td>
                                        <asp:TextBox ID="txtTitle" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td width="100" align="right"><%=typeid == "1" ? "系统广播" : "信息"%>内容：</td>
                                    <td>
                                        <fckeditorv2:fckeditor id="txtContent" runat="server" Width="95%" Height="300px" ToolbarSet="MiNi" BasePath="../FCKeditor/"></fckeditorv2:fckeditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding:10px 0;">&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnSubmit" runat="server" Text=" 保存信息 " OnClick="btnSubmit_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
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