<%@ Page Language="C#" MasterPageFile="~/SysManage/MasterPage.master" AutoEventWireup="true" CodeFile="suitypeManage.aspx.cs" Inherits="SysManage_suitypeManage" %>

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
                        <td width="8"></td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td style="padding:3px 0;">
                                    &nbsp;&nbsp;关键字：
                                    <asp:TextBox ID="txtKey" runat="server" CssClass="textbox"></asp:TextBox>
                                    <asp:Button ID="btnSearch" runat="server" CssClass="btn" OnClick="btnSearch_Click" Text="查  询" />&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnShowAll" runat="server" CssClass="btn" OnClick="btnShowAll_Click" Text="全  显" />&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input id="Button1" type="button" value="添  加" onclick="javascript:location.href='suitypeoper.aspx?parentid=<%=parentid %>';" />
                                </td>
                              </tr>
                            </table>
                        </td>
                        <td width="8"></td>
                    </tr>
                    <tr>
                        <td width="8" style="height:52px">&nbsp;</td>
                        <td style="height:52px">
                        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd" onmouseover="changeto()"  onmouseout="changeback()" class="tab1">
                            <tr class="top_tr">
                                <td align="center">编号</td>
                                <td align="center">类别名称</td>
                                
                                <td align="center">操作</td>
                            </tr>
                            <asp:Repeater ID="rptList" runat="server"   onitemcommand="rptList_ItemCommand">
                                <ItemTemplate>
                                    <tr style=" height:25px;">
                                        <td align="center"><%#Eval("suitypeID")%></td>
                                        <td align="center"><%#Eval("suitypename")%></td>
                                        
                                        <td align="center">
                                            <a href="suitypeoper.aspx?parentid=<%#parentid %>&Id=<%#Eval("suitypeID") %>"><img src="images/edt.gif" width="16" height="16" style="border:none;" /></a>&nbsp; &nbsp;
                                            <asp:LinkButton ID="LinkButton1"  OnClientClick="JavaScript:return confirm('确定要删除吗？')" runat="server" CommandArgument='<%#Eval("suitypeID") %>' CommandName="del"><img src="images/del.gif" width="16" height="16" style="border:none" /></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>    
                        </td>
                        <td width="8" style="height: 52px">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        
    </table>
</asp:Content>