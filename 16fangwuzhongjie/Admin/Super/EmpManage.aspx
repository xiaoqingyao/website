<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="EmpManage.aspx.cs" Inherits="houseIntermediaryMIS.Admin.Super.EmpManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table width="650px">
        <tr>
            <td valign="top" height="22">
                <font color="#373737" style="font-size: 18px;"></font>
                <asp:Repeater ID="Repeater1" runat="server" EnableViewState="False" OnItemCommand="Repeater1_ItemCommand">
                    <HeaderTemplate>
                        <table style="font-size: 13px; border-right: #d2d2d2 1px solid; border-top: #d2d2d2 1px solid;
                            border-left: #d2d2d2 1px solid; border-bottom: #d2d2d2 1px solid; border-collapse: collapse"
                            bordercolor="#d2d2d2" cellspacing="0" cellpadding="0" width="100%" border="1"
                            id="table3" class="tableDataCss">
                            <tr height="26" align="center" class="tableTitle">
                                <td width="8%">
                                    编号
                                </td>
                                <td width="12%">
                                    员工用户名
                                </td>
                                <td width="12%">
                                    真实姓名
                                </td>
                                <td width="8%" align="center">
                                    性别
                                </td>
                                <td width="15%">
                                    联系方式
                                </td>
                                <td width="18%" align="left">
                                    电子邮箱
                                </td>
                                <td width="10%">
                                    创建时间
                                </td>
                                <td width="9%">
                                    状 态
                                </td>
                                <td width="8%">
                                    删除
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr height="26" class="cp" onmouseover="this.style.backgroundColor='#C5D5E5'" onmouseout="this.style.backgroundColor=''">
                            <td align="left">
                                <%# DataBinder.Eval(Container.DataItem, "empID")%>
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, "empName")%>
                            </td>
                            <td align="center">
                                <%# DataBinder.Eval(Container.DataItem, "empRName")%>
                            </td>
                            <td align="center">
                                <%# DataBinder.Eval( Container.DataItem,"empSex").ToString()=="1"?"男":"女"%>
                            </td>
                            <td align="left">
                                <%# DataBinder.Eval(Container.DataItem, "empTel")%>
                            </td>
                            <td align="left">
                                <%# DataBinder.Eval(Container.DataItem, "empEmail")%>
                            </td>
                            <td align="center">
                                <%# DataBinder.Eval( Container.DataItem,"CreateTime","{0:d}")%>
                            </td>
                            <td align="center">
                                <asp:LinkButton ID="lbtChangeState" ToolTip="点击可切换状态" runat="server" Text="" CommandName='<%# DataBinder.Eval(Container.DataItem,"empID").ToString() %>'
                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem,"state") %>'>
                                <%# GetShowedStateByNum(DataBinder.Eval(Container.DataItem, "state"))%>
                                </asp:LinkButton>
                            </td>
                            <td align="center">
                                <asp:LinkButton ID="lkbDelete" runat="server" OnClientClick="return confirm('确认要删除该员工用户吗？') "
                                    OnClick="lkbDelete_Click" CommandName='<%# DataBinder.Eval(Container.DataItem,"empID").ToString() %>'>删除</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbResult" runat="server" Text="" ForeColor="Green" Font-Size="15px"></asp:Label>
                <div style="text-align: right">
                    <asp:LinkButton ID="lkbAddUser" runat="server" Font-Size="16px" OnClick="lkbAddUser_Click">添加新员工</asp:LinkButton>
                </div>
            </td>
        </tr>
    </table>
    <asp:Panel ID="plAddEmp" runat="server" Visible="false">
        <hr style="width: 550px" />
        <table style="padding-left: 100px">
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td align="right">
                    登录名：
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    真实姓名：
                </td>
                <td>
                    <asp:TextBox ID="txtRName" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    性别：
                </td>
                <td>
                    <asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">男</asp:ListItem>
                        <asp:ListItem Value="0">女</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    联系方式：
                </td>
                <td>
                    <asp:TextBox ID="txtTel" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    电子邮箱：
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="lkbSubmit" runat="server" OnClick="lkbSubmit_Click" Text="确认添加" />
                    &nbsp;
                    <asp:LinkButton ID="lkbCancel" runat="server" OnClick="lkbCancel_Click">取消</asp:LinkButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
