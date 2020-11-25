<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GatherManager.aspx.cs" Inherits="Admin_GatherManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
    <style type="text/css">
        .dn
        {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellspacing="0" cellpadding="0" width="100%" border="0" style="border-top-width: 1px;
            border-left-width: 1px; border-left-color: #ff00ff; border-bottom-width: 1px;
            border-bottom-color: #ff00ff; border-top-color: #ff00ff; border-right-width: 1px;
            border-right-color: #ff00ff">
            <tr>
                <td valign="top" style="width: 9px">
                    <img height="7" src="../../Image/JiSu_Admin_22.gif" width="8" />
                </td>
                <td style="background-image: url(../../Image/JiSu_Admin_23.gif); height: 7px; width: 100%">
                </td>
                <td style="width: 9px">
                    <img height="7" src="../../Image/JiSu_Admin_25.gif" width="8" />
                </td>
            </tr>
            <tr>
                <td style="background-image: url(../../Image/JiSu_Admin_30.gif); width: 9px">
                </td>
                <td style="width: 100%">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td style="height: 152px">
                                <asp:Panel ID="pnlAddMark" runat="server" Width="100%">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td colspan="4" style="height: 18px">
                                                <h3>
                                                    添加团购</h3>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px;">
                                            </td>
                                            <td style="height: 24px">
                                                团购标题:
                                            </td>
                                            <td style="height: 24px">
                                                <asp:TextBox ID="txtGatherTitle" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtGatherTitle"
                                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px;">
                                            </td>
                                            <td style="height: 24px">
                                                团购类别:
                                            </td>
                                            <td style="height: 24px">
                                                <asp:DropDownList ID="ddlgathertype" runat="server">
                                                </asp:DropDownList>
                                                <asp:ImageButton ID="ibtnAdd" runat="server" ImageUrl="~/Image/add.jpg" OnClick="ibtnAdd_Click"
                                                    CausesValidation="False" />
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px;">
                                            </td>
                                            <td style="height: 24px">
                                                团购的产品:
                                            </td>
                                            <td style="height: 24px">
                                                <asp:TextBox ID="txtProduct" runat="server"></asp:TextBox>
                                                <asp:Button ID="btnbrowse" runat="server" Text="...." OnClick="btnbrowse_Click" CausesValidation="False" />
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px;">
                                            </td>
                                            <td style="height: 24px">
                                                团购价格:
                                            </td>
                                            <td style="height: 24px">
                                                <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px;">
                                            </td>
                                            <td style="height: 24px">
                                                团购起始人数:
                                            </td>
                                            <td style="height: 24px">
                                                <asp:TextBox ID="txtgahternum" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 27px;">
                                            </td>
                                            <td style="height: 27px">
                                                团购的说明:
                                            </td>
                                            <td style="height: 27px">
                                                <asp:TextBox ID="txtShow" runat="server" Height="112px" TextMode="MultiLine" Width="289px"></asp:TextBox>
                                            </td>
                                            <td style="height: 27px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="ibtnOk" runat="server" ImageUrl="~/Image/ok.jpg" OnClick="ibtnOk_Click" />
                                                <asp:ImageButton ID="ibtnCancel" runat="server" ImageUrl="~/Image/cancel.jpg" CausesValidation="False"
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
                            <td style="height: 19px">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; text-align: left; height: 47px;">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td class="Search_Border" style="height: 28px">
                                            通过(团购标题)快速搜索：&nbsp;
                                            <asp:TextBox ID="txtSechCompanyName" runat="server"></asp:TextBox>
                                            <asp:ImageButton ID="ibtnSreach" runat="server" CausesValidation="False" ImageUrl="~/Image/search.jpg"
                                                OnClick="ibtnSreach_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 20px">
                                <asp:GridView ID="gvGather" runat="server" Width="100%" AutoGenerateColumns="False"
                                    OnRowDataBound="gvGather_RowDataBound" OnRowDeleting="gvGather_RowDeleting" OnRowEditing="gvGather_RowEditing">
                                    <Columns>
                                        <asp:BoundField DataField="gatherId">
                                            <ItemStyle CssClass="dn" />
                                            <HeaderStyle CssClass="dn" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gatherTitle" HeaderText="标题" />
                                        <asp:BoundField DataField="productName" HeaderText="产品名" />
                                        <asp:BoundField DataField="gPrice" HeaderText="团购价格" />
                                        <asp:BoundField DataField="gatherNum" HeaderText="要求人数" />
                                        <asp:BoundField DataField="number" HeaderText="现在有人数" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibtnEidt" runat="server" ImageUrl="~/Image/update.jpg" CommandName="Edit"
                                                    CausesValidation="False" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Image/delete.jpg" CommandName="Delete"
                                                    CausesValidation="False" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
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
                <td style="background-image: url(../../Image/JiSu_Admin_49.gif); height: 8px; width: 100%">
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
