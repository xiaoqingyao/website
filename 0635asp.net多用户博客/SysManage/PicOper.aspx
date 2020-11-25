<%@ Page Language="C#" MasterPageFile="~/SysManage/MasterPage.master" AutoEventWireup="true" CodeFile="PicOper.aspx.cs" Inherits="SysManage_PicOper" %>
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
                                        当前位置：相册信息操作
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
                                    <td width="100" align="right" style="height:30px">相册名称：</td>
                                    <td>
                                        <asp:TextBox ID="txtPicName" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right" style="height:30px">所属分类：</td>
                                    <td>
                                        <asp:DropDownList ID="ddlPicClass" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height:35px">上传相册：</td>
                                    <td>
                                        <asp:FileUpload ID="FileUpload1" runat="server" Width="260px" /><br />
                                        <asp:Image ID="Image1" runat="server" Width="110px" Height="80px" />
                                    </td>
                                </tr>
                                <tr style="display:none;">
                                    <td width="100" align="right" style="height:30px">相册介绍：</td>
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