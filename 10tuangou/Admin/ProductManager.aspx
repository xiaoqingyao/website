<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductManager.aspx.cs" Inherits="Admin_ProductManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        .dn
        {
            display: none;
        }
    </style>

    <script type="text/javascript">
        var i=1
        function addFile()
        {
     
         if (i<8)
            {var str = '<BR> <input type="file" name="File" runat="server" style="width: 300px"/>'
            document.getElementById('MyFile').insertAdjacentHTML("beforeEnd",str)
            }
        else
            {
                alert("您一次最多只能上传8张图片！")
            }
            i++
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="border-top-width: 1px; border-left-width: 1px;
            border-left-color: #ff00ff; border-bottom-width: 1px; border-bottom-color: #ff00ff;
            border-top-color: #ff00ff; border-right-width: 1px; border-right-color: #ff00ff"
            width="100%">
            <tr>
                <td style="width: 9px" valign="top">
                    <img height="7" src="../../Image/JiSu_Admin_22.gif" width="8" />
                </td>
                <td style="background-image: url(../../Image/JiSu_Admin_23.gif); width: 100%; height: 7px">
                </td>
                <td style="width: 9px">
                    <img height="7" src="../../Image/JiSu_Admin_25.gif" width="8" />
                </td>
            </tr>
            <tr>
                <td style="background-image: url(../../Image/JiSu_Admin_30.gif); width: 9px">
                </td>
                <td style="width: 100%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="height: 152px">
                                <asp:Panel ID="pnlAddMark" runat="server" Width="100%">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td colspan="4" style="height: 18px">
                                                <h3>
                                                    添加产品</h3>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px">
                                            </td>
                                            <td style="height: 24px">
                                                产品名字:
                                            </td>
                                            <td style="height: 24px">
                                                <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px">
                                            </td>
                                            <td style="height: 24px">
                                                产品类别:
                                            </td>
                                            <td style="height: 24px">
                                                <asp:DropDownList ID="ddlproducttype" runat="server">
                                                </asp:DropDownList>
                                                <asp:Button ID="btnAddType" runat="server" OnClick="btnAddType_Click" Text="添 加" />
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 23px">
                                            </td>
                                            <td style="height: 23px">
                                                价格:
                                            </td>
                                            <td style="height: 23px">
                                                <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="height: 23px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px">
                                            </td>
                                            <td style="height: 24px">
                                                所属公司:
                                            </td>
                                            <td style="height: 24px">
                                                <asp:TextBox ID="txtcompanyname" runat="server"></asp:TextBox>
                                                <asp:Button ID="btnbrowse" runat="server" OnClick="btnbrowse_Click" Text="...." />
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px">
                                            </td>
                                            <td style="height: 24px">
                                                产品图标
                                            </td>
                                            <td style="height: 24px">
                                                <asp:FileUpload ID="fuico" runat="server" />
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px">
                                            </td>
                                            <td style="height: 24px">
                                                产品简介:
                                            </td>
                                            <td style="height: 24px">
                                                <asp:TextBox ID="txtintroduct" runat="server" Height="87px" TextMode="MultiLine"
                                                    Width="330px"></asp:TextBox>
                                            </td>
                                            <td style="height: 24px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 87px; height: 24px">
                                            </td>
                                            <td style="height: 24px">
                                                产品相关的图片:
                                            </td>
                                            <td style="height: 24px">
                                                <p id="MyFile">
                                                    <input id="File1" runat="server" name="File" style="width: 300px" type="file" /><input
                                                        id="Button1" onclick="addFile();" type="button" value="继续添加" />
                                                </p>
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
                            <td style="height: 19px">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; height: 47px; text-align: left">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td class="Search_Border" style="height: 28px">
                                            通过(产品名字)快速搜索：&nbsp;
                                            <asp:TextBox ID="txtSechCompanyName" runat="server"></asp:TextBox>
                                            <asp:ImageButton ID="ibtnSreach" runat="server" CausesValidation="False" ImageUrl="~/Image/search.jpg"
                                                OnClick="ibtnSreach_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="Search_Border">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 19px">
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound"
                                    OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="productId">
                                            <ItemStyle CssClass="dn" />
                                            <HeaderStyle CssClass="dn" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="companyId">
                                            <ItemStyle CssClass="dn" />
                                            <HeaderStyle CssClass="dn" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="productName" HeaderText="产品名" />
                                        <asp:BoundField DataField="pdTypeId">
                                            <ItemStyle CssClass="dn" />
                                            <HeaderStyle CssClass="dn" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pdPrice" HeaderText="产品价格" />
                                        <asp:BoundField DataField="pdphoto">
                                            <ItemStyle CssClass="dn" />
                                            <HeaderStyle CssClass="dn" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="time" HeaderText="加入时间" />
                                        <asp:BoundField DataField="companyName" HeaderText="所属公司" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibtnEdit" runat="server" CommandName="Edit" ImageUrl="~/Image/update.jpg" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibtnDelete" runat="server" CommandName="Delete" ImageUrl="~/Image/delete.jpg" />
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
