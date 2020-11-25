<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LiuYan.aspx.cs" Inherits="LiuYan" ValidateRequest="false" %>

<%@ Register assembly="DotNetTextBox" namespace="DotNetTextBox" tagprefix="DNTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
   
        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                   
                    <asp:DataList ID="dlTopic" runat="server" Width="508px">
                        <ItemTemplate>
                            <table border="1" bordercolor="#ffffff" cellspacing="0" style="width: 100%;">
                                <tr>
                                    <td colspan="2" style="height: 18px">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" valign="top">
                                        用户: <%# Eval("MessageUser")%>||留言时间: <%# Eval("MessageTime")%>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" valign="top">
                                        留言内容:<br /> <%# Eval("MessageContent")%>
                                    </td>
                                </tr><tr>
                                    <td style="height: 22px" colspan="2" valign="top">
                                        回复时间：<%# Eval("HuiFuTime")%><br >
                                        回复内容：<%# Eval("HuiFuNeiRong")%><br>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList></td>
            </tr>
            <tr>
                <td>
                       <table align="center" border="1" bordercolordark="#9cc7ef" 
                        bordercolorlight="#145aa0" cellpadding="4" cellspacing="0" style="width: 536px" >
                        <tr bgcolor="#4296e7">
                            <td colspan="2" style="HEIGHT: 26px">
                                <div align="center">
                                </div>
                            </td>
                        </tr>
                        <tr style="FONT-FAMILY: Times New Roman">
                            <td nowrap style="WIDTH: 164px; HEIGHT: 34px" width="30">
                                用户名：</td>
                            <td style="HEIGHT: 34px"  >
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                （空为匿名）</td>
                        </tr>
                        <tr style="FONT-FAMILY: Times New Roman">
                            <td colspan="2" nowrap>
                                <DNTB:WebEditor ID="WebEditor1" runat="server" />
                            </td>
                        </tr>
                        <tr style="FONT-FAMILY: Times New Roman">
                            <td colspan="2">
                                <div align="center">
                                    &nbsp;<asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="确定" 
                                        Width="41px" />
                                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="取消" />
                                </div>
                            </td>
                        </tr>
                        <tr bgcolor="#4296e7" style="FONT-FAMILY: Times New Roman">
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                    </table></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
                                   
</asp:Content>

