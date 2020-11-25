<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateUserInfo.aspx.cs" Inherits="UpdateUserInfo" ValidateRequest="false" %>

<%@ Register assembly="DotNetTextBox" namespace="DotNetTextBox" tagprefix="DNTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">     
    <asp:Panel ID="Panel3" runat="server" Height="800px">
   <table class="style1">
            <tr>
                <td>
                    <asp:Image ID="Image3" runat="server" Height="31px" ImageUrl="~/images/用户注册.jpg" 
                        Width="583px" />
                </td>
            </tr>
            <tr>
                <td>
                    <table class="style1">
                        <tr>
                            <td>
                                用户名</td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="用户名不能为空">用户名不能为空</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                密码：</td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                    ErrorMessage="密码不能为空">密码不能为空</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                重复密码</td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToCompare="TextBox2" ControlToValidate="TextBox3" 
                                    ErrorMessage="两次密码必须一致">两次密码必须一致</asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                性别：</td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem>男</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                真实姓名：</td>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                地址：</td>
                            <td>
                                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                邮编：</td>
                            <td>
                                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                手机：</td>
                            <td>
                                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email：</td>
                            <td>
                                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="确定" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
      
 </asp:Panel>                                   
</asp:Content>

