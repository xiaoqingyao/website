<%@ Page Language="C#"   AutoEventWireup="true" CodeFile="TJMoney.aspx.cs" Inherits="TJMoney" Title="Untitled Page" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>家庭财务管理系统</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
<link rel="stylesheet" type="text/css" href="skin/css/main.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
<table width="100%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td  class='title'><span>
                        家庭收支信息统计</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="left">
    
    
<table cellpadding="0" cellspacing="0" style="width:100%;">
    <tr>
        <td rowspan="3" valign="top" style="width: 706px" align="center" >
            <table style="width:100%;">
                <tr>
                    <td align="left" style="text-align: center" valign="top">
                        收支类型：<asp:DropDownList ID="drpSubItem" runat="server" Width="133px">
                            <asp:ListItem Value="收入"></asp:ListItem>
                            <asp:ListItem>支出</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="133px">
                            <asp:ListItem>本周</asp:ListItem>
                            <asp:ListItem>本月</asp:ListItem>
                            <asp:ListItem>本年</asp:ListItem>
                            <asp:ListItem>全部</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="统计" /></td>
                </tr>
                <tr>
                    <td style="text-align: left;" valign="top" align="left">
                        <asp:GridView ID="GvInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            BackColor="White" CellPadding="5" DataKeyNames="id" OnPageIndexChanging="GvInfo_PageIndexChanging"
                            OnRowDataBound="GvInfo_RowDataBound" PageSize="12" Width="100%">
                            <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPreviousFirstLast"
                                NextPageText="下一页" PageButtonCount="12" PreviousPageText="上一页" />
                            <RowStyle HorizontalAlign="Left" />
                            <Columns>
                                <asp:TemplateField HeaderText="收支项目">
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
                                <asp:TemplateField HeaderText="查看修改">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "ModifyMoney.aspx?id="+Eval("id") %>'
                                            Text="查看修改" Width="96px"></asp:HyperLink>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
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
                                        <td align="right" width="20%">
                                        </td>
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
                        </td>
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

