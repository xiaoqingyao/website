﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MoneyManger.aspx.cs" Inherits="MoneyManger" Title="Untitled Page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>家庭理财管理系统</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
    <link rel="stylesheet" type="text/css" href="skin/css/main.css" />
        <script src="../JavaScript/WdatePicker.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom: 8px; margin-top: 8px;">
                <tr>
                    <td class='title'><span>收支管理</span></td>
                </tr>
                <tr bgcolor="#FFFFFF">
                    <td align="left">
                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                            <tr>
                                <td colspan="1" style="height: 6px; width: 1188px;">
                                    查询时间从： 
                                    <asp:TextBox runat="server" ID="df" onclick="WdatePicker()" ></asp:TextBox>到：<asp:TextBox runat="server" ID="dt" onclick="WdatePicker()" ></asp:TextBox>&nbsp; 
                                    <asp:Button ID="Button2" runat="server" Text="点击查询" OnClick="Button2_Click" /></td>
                            </tr>
                            <tr>
                                <td rowspan="3" valign="top" style="width: 1188px" align="center">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="text-align: left;" valign="top" align="left">
                                                <asp:GridView ID="GvInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    BackColor="White" CellPadding="5" DataKeyNames="id" OnPageIndexChanging="GvInfo_PageIndexChanging"
                                                    OnRowDataBound="GvInfo_RowDataBound" PageSize="12" Width="100%" ShowFooter="true">
                                                    <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPreviousFirstLast"
                                                        NextPageText="下一页" PageButtonCount="12" PreviousPageText="上一页" />
                                                    <RowStyle HorizontalAlign="Left" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="收支科目">
                                                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="收支类型">
                                                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Type" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="收支日期">
                                                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("Addtime","{0:d}") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="收支人">
                                                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label14" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="收支金额">
                                                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("AddMoney") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="备注">
                                                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label16" runat="server" Text='<%# Bind("Ds") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="修改" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl='<%# "ModifyMoney.aspx?id="+Eval("id") %>'
                                                                    Text="修改" Width="50px"></asp:HyperLink>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="left" Width="50px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="选择">
                                                            <EditItemTemplate>
                                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                                            </EditItemTemplate>
                                                            <HeaderTemplate>
                                                                选择
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSelect" runat="server" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" Width="40px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <PagerTemplate>
                                                        <table border="0" width="100%">
                                                            <tr>
                                                                <td>
                                                                    <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                                                                        Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">首页 </asp:LinkButton>
                                                                    <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                                                                        CommandName="Page" Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">上一页 </asp:LinkButton>
                                                                    <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                                                                        Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">下一页 </asp:LinkButton>
                                                                    <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                                                                        Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">尾页 </asp:LinkButton>
                                                                    共
                                            <asp:Label ID="LabelPageCount" runat="server" Text=" <%# ((GridView)Container.NamingContainer).PageCount %>"> </asp:Label>页
                                            第
                                            <asp:Label ID="Label2" runat="server" Text=" <%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"> </asp:Label>页
                                                                </td>
                                                                <td align="right" width="20%"></td>
                                                            </tr>
                                                        </table>
                                                    </PagerTemplate>
                                                    <PagerStyle BackColor="#F6F6F6" HorizontalAlign="Left" />
                                                    <HeaderStyle BackColor="#F6F6F6" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="text-align: center" valign="top">
                                                <asp:Button ID="btnSelectAll" runat="server" OnClick="btnSelectAll_Click" Text="全选" /><asp:Button
                                                    ID="btnDel" runat="server" OnClick="btnDel_Click" OnClientClick="javascript:return confirm('确定删除么？');"
                                                    Text="删除" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
