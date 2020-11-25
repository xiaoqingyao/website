<%@ Page Language="C#" AutoEventWireup="true" CodeFile="companyManager.aspx.cs" Inherits="Admin_companyManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="border-top-width: 1px; border-left-width: 1px;
            border-left-color: #ff00ff; border-bottom-width: 1px; border-bottom-color: #ff00ff;
            border-top-color: #ff00ff; border-right-width: 1px; border-right-color: #ff00ff"
            width="100%">
            <tr>
                <td style="width: 8px" valign="top">
                    <img height="7" src="../../Image/JiSu_Admin_22.gif" width="8" />
                </td>
                <td style="background-image: url(../../Image/JiSu_Admin_23.gif); width: 100%; height: 7px">
                </td>
                <td style="width: 9px">
                    <img height="7" src="../../Image/JiSu_Admin_25.gif" width="8" />
                </td>
            </tr>
            <tr>
                <td style="width: 100%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td>
                                <asp:Panel ID="pnlAddMark" runat="server" Width="100%">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td colspan="4">
                                                <h3>添加公司</h3>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px">
                                            </td>
                                            <td style="height: 24px">
                                                公司名字:
                                            </td>
                                            <td style="height: 24px">
                                                <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompanyName"
                                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px">
                                            </td>
                                            <td style="height: 24px">
                                                公司地址:
                                            </td>
                                            <td style="height: 24px">
                                                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress"
                                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px">
                                            </td>
                                            <td style="height: 24px">
                                                公司联系人:
                                            </td>
                                            <td style="height: 24px">
                                                <asp:TextBox ID="txtContactMan" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContactMan"
                                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px">
                                            </td>
                                            <td style="height: 24px">
                                                电话:
                                            </td>
                                            <td style="height: 24px">
                                                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="ibtnOk" runat="server" ImageUrl="~/Image/ok.jpg" OnClick="ibtnOk_Click" />
                                                <asp:ImageButton ID="ibtnCancel" runat="server" CausesValidation="False" ImageUrl="~/Image/cancel.jpg"
                                                    OnClick="ibtnCancel_Click" />
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; height: 47px; text-align: left">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td class="Search_Border" style="height: 28px">
                                            通过(公司名字)快速搜索：&nbsp;
                                            <asp:TextBox ID="txtSechCompanyName" runat="server"></asp:TextBox>
                                            <asp:ImageButton ID="ibtnSreach" runat="server" CausesValidation="False" ImageUrl="~/Image/search.jpg"
                                                OnClick="ibtnSreach_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 19px">
                                <asp:GridView ID="gvCompany" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvCompany_RowDataBound"
                                    OnRowDeleting="gvCompany_RowDeleting" OnRowEditing="gvCompany_RowEditing" OnRowUpdating="gvCompany_RowUpdating"
                                    Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="companyId">
                                            <ItemStyle CssClass="dn" />
                                            <HeaderStyle CssClass="dn" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="companyName" HeaderText="公司名字" />
                                        <asp:BoundField DataField="contactMan" HeaderText="公司联系人" />
                                        <asp:BoundField DataField="phone" HeaderText="联系人电话" />
                                        <asp:BoundField DataField="address" HeaderText="公司地址" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibtnEite" runat="server" CausesValidation="False" CommandName="Edit"
                                                    ImageUrl="~/Image/update.jpg" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibtndelete" runat="server" CommandName="delete" ImageUrl="~/Image/delete.jpg" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 19px">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 17px">
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="background-image: url(../../Image/JiSu_Admin_32.gif); width: 9px">
                </td>
            </tr>
            <tr>
                <td style="width: 9px">
                    <img height="8" src="../../Image/JiSu_Admin_48.gif" width="8" />
                </td>
                <td style="background-image: url(../../Image/JiSu_Admin_49.gif); width: 100%; height: 8px">
                </td>
                <td style="width: 9px">
                    <img height="8" src="../../Image/JiSu_Admin_51.gif" width="8" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
