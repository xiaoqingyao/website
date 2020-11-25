<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DataManagement.aspx.cs" Inherits="Admin_DataManagement" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" cellpadding="1" cellspacing="1" bordercolor="#3366FF" style="width: 668px; font-family: 楷体_GB2312">
<tr>
            <td bgcolor="#66CCFF" colspan="2" style="height: 22px; text-align:center;">
                    添加数据
      </td>
      </tr>
        <tr>
            <td style="width: 16px">
                    单行<br />
                    添加
            </td>
            <td style="width: 352px">
                <table border="1" cellpadding="0" cellspacing="0" bordercolor="#2e90b0" style="font-family: 楷体_GB2312; width: 525px;">
      <tr>
                        <td style="width: 646px; height: 26px">
                            角色:<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odsrole"
                                DataTextField="RoleName" DataValueField="UID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList><asp:ObjectDataSource ID="odsrole" runat="server" SelectMethod="GetUserRole"
                                TypeName="ThesisManage.BLL.UserRoleManage"></asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 646px">
                            <asp:Panel ID="Panel1" runat="server" Height="150px" Width="640px">
                                <table border="1" cellpadding="0" cellspacing="0" bordercolor="#2e90b0" style="width: 595px; font-family: 楷体_GB2312">
                                    <tr>
                                        <td bgcolor="#66CCFF" colspan="4" style="height: 22px">
                                            <div align="center">
                                                添加学生用户</div>
                                      </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            学号:</td>
                                        <td align="left" >
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                                ErrorMessage="*" Style="position: absolute"></asp:RequiredFieldValidator>
                                        </td>
                                        <td align="right">
                                            姓名:</td>
                                        <td align="left">
                                            &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                                ErrorMessage="*" Style="position: absolute"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 104px">
                                            班级:</td>
                                        <td align="left" style="width: 182px">
                                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                                                ErrorMessage="*" Style="position: absolute"></asp:RequiredFieldValidator>
                                        </td>
                                        <td align="right" colspan="2">
                                            <asp:Label ID="Label1" runat="server" Text="添加后的默认密码为：333333" BackColor="#C0FFFF" BorderColor="#FFFFC0" Font-Size="X-Small"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="BtnOk" runat="server" Text="添加" OnClick="BtnOk_Click" />
                                            &nbsp;&nbsp;
                                        </td>
                                        <td align="left" colspan="2">
                                            &nbsp;&nbsp;
                                            <asp:Button ID="BtnReSet" runat="server" Text="重置" OnClick="BtnReSet_Click" /></td>
                                    </tr>
                              </table>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server" Height="150px" Width="640px">
                                <table border="1" cellpadding="0" cellspacing="0" bordercolor="#2e90b0" style="width: 596px; font-family: 楷体_GB2312">
                                    <tr>
                                        <td bgcolor="#66CCFF" colspan="4">
                                            <div align="center">
                                                添加教员帐户</div>
                                      </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 106px">
                                            教师号:</td>
                                        <td align="left" style="width: 202px">
                                            &nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4"
                                                ErrorMessage="*" Style="position: absolute"></asp:RequiredFieldValidator>
                                        </td>
                                        <td align="right" style="width: 71px">
                                            姓名:</td>
                                        <td align="left" style="width: 259px">
                                            &nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5"
                                                ErrorMessage="*" Style="position: absolute"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="4" style="height: 22px">
                                            <asp:Label ID="Label2" runat="server" Style="position: static" Text="添加后的默认密码为：111111" BackColor="#C0FFFF" BorderColor="#FFFFC0" Font-Size="X-Small"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2" style="height: 25px">
                                            <asp:Button ID="btnsubmint" runat="server"  Text="添加" OnClick="btnsubmint_Click" />&nbsp;
                                            &nbsp;</td>
                                        <td align="left" colspan="2" style="height: 25px">
                                            &nbsp;&nbsp;
                                            <asp:Button ID="btnesc" runat="server"  Text="重置" OnClick="btnesc_Click" /></td>
                                    </tr>
                              </table>
                            </asp:Panel>
                            <asp:Panel ID="Panel3" runat="server" Height="150px" Width="640px">
                                <table border="1" cellpadding="0" cellspacing="0" bordercolor="#2e90b0" style="width: 596px; font-family: 楷体_GB2312">
                                    <tr>
                                        <td bgcolor="#66CCFF" colspan="4" style="height: 22px">
                                            <div align="center">
                                                添加管理员帐户</div>
                                      </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 106px">
                                            帐号:</td>
                                        <td align="left" style="width: 202px">
                                            &nbsp;<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6"
                                                ErrorMessage="*" Style="position: absolute"></asp:RequiredFieldValidator>
                                        </td>
                                        <td align="right" colspan="2">
                                            <asp:Label ID="Label3" runat="server" Text="添加后的默认密码为：222222" BackColor="#C0FFFF" BorderColor="#FFFFC0" Font-Size="X-Small"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="Button1" runat="server" Text="添加" OnClick="Button1_Click" />&nbsp;
                                            &nbsp;</td>
                                        <td align="left" colspan="2">
                                            &nbsp;&nbsp;
                                            <asp:Button ID="Button2" runat="server" Text="重置" OnClick="Button2_Click" /></td>
                                    </tr>
                              </table>
                            </asp:Panel>
                      </td>
                    </tr>
                    <tr>
                        <td style="width: 646px; height: 22px;">&nbsp;
                            </td>
                    </tr>
                </table>
          </td>
        </tr>
        <tr>
            <td style="width: 16px; height: 66px;">
                多行<br />
                添加</td>
            <td style="width: 352px; height: 66px;">
                <table border="1" cellpadding="0" cellspacing="0" bordercolor="#2e90b0" style="font-family: 楷体_GB2312; width: 608px;">
      <tr>
                        <td>
                            选择Excel文件<asp:FileUpload ID="FileUpload1" runat="server" /></td>
                    </tr>
                    <tr>
                        <td style="height: 28px" align="center">
                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="添加" /></td>
                    </tr>
                </table>
          </td>
        </tr>
        <tr>
            <td style="width: 16px">&nbsp;
                </td>
            <td style="width: 352px">&nbsp;
                </td>
        </tr>
    </table>
</asp:Content>

