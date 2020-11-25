<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserMange.aspx.cs" Inherits="Admin_UserMange" %>

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
    <td   class='title'><span>用户信息管理</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>
        &nbsp;按姓名关键字查询：
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="查询" />
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label></td>
  </tr>
    <tr bgcolor="#ffffff">
        <td align="left" style="height: 20px">
            <asp:GridView ID="gvData" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                CellPadding="3" DataKeyNames="id" OnPageIndexChanging="gvData_PageIndexChanging"
                OnRowDataBound="gvData_RowDataBound" OnRowDeleting="gvData_RowDeleting" PageSize="6"
                Width="100%">
                <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PageButtonCount="12"
                    PreviousPageText="上一页" />
                <RowStyle ForeColor="#000066" HorizontalAlign="Left" />
                <Columns>
                    <asp:TemplateField HeaderText="姓名">
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="性别">
                        <ItemTemplate>
                            <asp:Label ID="Sex" runat="server" Text='<%# Bind("Sex") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="登陆密码">
                        <ItemTemplate>
                            <asp:Label ID="Pass" runat="server" Text='<%# Bind("Pass") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="登陆账号">
                        <ItemTemplate>
                            <asp:Label ID="loginName" runat="server" Text='<%# Bind("loginName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" />
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="年龄">
                        <ItemTemplate>
                            <asp:Label ID="NianLing" runat="server" Text='<%# Bind("NianLing") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="用户角色">
                        <ItemTemplate>
                            <asp:Label ID="LoginRoule" runat="server" Text='<%# Bind("LoginRoule") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" />
                    </asp:TemplateField>
                         
                        <asp:TemplateField HeaderText="称呼">
                        <ItemTemplate>
                            <asp:Label ID="DepName" runat="server" Text='<%# Bind("DepName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" />
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="联系电话">
                        <ItemTemplate>
                            <asp:Label ID="TEl" runat="server" Text='<%# Bind("TEl") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" />
                    </asp:TemplateField>
                               <asp:TemplateField HeaderText="添加时间">
                        <ItemTemplate>
                            <asp:Label ID="Addtime" runat="server" Text='<%# Bind("Addtime","{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="80px" />
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="修改">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "ModifyUser.aspx?id="+Eval("id") %>'
                                Text="修改" Width="30px"></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="删除" Width="30px"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
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
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </td>
    </tr>
</table>
    </div>
    </form>
</body>
</html>
