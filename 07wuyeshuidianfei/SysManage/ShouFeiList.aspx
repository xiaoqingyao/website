<%@ Page Language="C#" MasterPageFile="~/SysManage/MasterPage.master" AutoEventWireup="true" CodeFile="ShouFeiList.aspx.cs" Inherits="SysManage_ShouFeiList" %>

<%@ Register assembly="AspNetPager" namespace="Wuqi.Webdiyer" tagprefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="30" background="images/tab_05.gif">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td valign="middle">
                                        <img src="images/tb.gif" width="16" height="16" align="absmiddle" />
                                        当前位置：统计抄表情况
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
                        <td width="8"></td>
                        <td>
                            
                        </td>
                        <td width="8"></td>
                    </tr>
                    <tr>
                        <td width="8">&nbsp;</td>
                        <td>
                        <br /><b>按年月查询台区抄表情况：</b><br />
                        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd" class="tab1">
                            <tr class="top_tr">
                                <td align="center">抄表月份</td>
                                <td align="center">台区</td>
                                <td align="center">抄表次数</td>
                                <td align="center">收费合计</td>
                            </tr>
                            <asp:Repeater ID="rptList1" runat="server">
                                <ItemTemplate>
                                    <tr style=" height:25px; font-size:16px;">
                                        <td align="center"><%#Eval("sftime")%></td>
                                        <td align="center"><%#Eval("qutype")%></td>
                                        <td align="center"><%#Eval("cs")%></td>
                                        <td align="center"><%#Eval("total")%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>    
                        </td>
                        <td width="8">&nbsp;</td>
                    </tr>
                    <tr>
                        <td width="8">&nbsp;</td>
                        <td>
                        <br /><b>按用电户查询抄表情况：</b><br />
                        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd" class="tab1">
                            <tr class="top_tr">
                                <td align="center">用电户</td>
                                <td align="center">抄表次数</td>
                                <td align="center">收费合计</td>
                            </tr>
                            <asp:Repeater ID="rptList2" runat="server">
                                <ItemTemplate>
                                    <tr style=" height:25px; font-size:16px;">
                                        <td align="center"><%#Eval("zhuhuname")%></td>
                                        <td align="center"><%#Eval("cs")%></td>
                                        <td align="center"><%#Eval("total")%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>    
                        </td>
                        <td width="8">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        
    </table>
</asp:Content>