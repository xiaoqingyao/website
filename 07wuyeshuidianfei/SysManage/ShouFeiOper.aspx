<%@ Page Language="C#" MasterPageFile="~/SysManage/MasterPage.master" AutoEventWireup="true" CodeFile="ShouFeiOper.aspx.cs" Inherits="SysManage_ShouFeiOper" %>
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
                                        当前位置：抄表操作
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
                                    <td width="100" align="right" style="height:35px">抄表日期：</td>
                                    <td>
                                        <asp:TextBox ID="txtShouFeiDate" runat="server" CssClass="textbox" Width="80px" onclick="ShowCalendar(this)"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right" style="height:35px">所属台区：</td>
                                    <td>
                                        <asp:DropDownList ID="qutype" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right" style="height:35px">抄表类型：</td>
                                    <td>
                                        <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                        <asp:ListItem Value="1">水费</asp:ListItem>
                                        <asp:ListItem Value="3">电费</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="suidiantype" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right" style="height:35px">用户：</td>
                                    <td>
                                        <asp:TextBox ID="zhuhuname" runat="server" CssClass="textbox" Width="150px" Text=""></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right" style="height:35px">用量：</td>
                                    <td>
                                        <asp:TextBox ID="txtLiang" runat="server" CssClass="textbox" Width="150px" Text="1" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right" style="height:35px">应交费：</td>
                                    <td>
                                        <asp:TextBox ID="total" runat="server" CssClass="textbox" Width="150px" Text="0" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"></asp:TextBox> 元
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right" style="height:35px">交费状态：</td>
                                    <td>
                                        <asp:DropDownList ID="isjiaofei" runat="server">
                                        <asp:ListItem Value="欠费">欠费</asp:ListItem>
                                        <asp:ListItem Value="缴费">缴费</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right" style="height:35px">缴费方式：</td>
                                    <td>
                                        <asp:DropDownList ID="jiaofeitype" runat="server">
                                        <asp:ListItem Value="">--选择--</asp:ListItem>
                                        <asp:ListItem Value="支付宝">支付宝</asp:ListItem>
                                        <asp:ListItem Value="网银">网银</asp:ListItem>
                                        <asp:ListItem Value="现金">现金</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right" style="height:35px">交费日期：</td>
                                    <td>
                                        <asp:TextBox ID="jiaofeitime" runat="server" CssClass="textbox" Width="100px" onclick="ShowCalendar(this)"></asp:TextBox>
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