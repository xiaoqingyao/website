<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AmountTj.aspx.cs" Inherits="UserManger_AmountTj" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>家庭理财管理系统</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
    <link rel="stylesheet" type="text/css" href="skin/css/main.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom: 8px; margin-top: 8px;">
                <tr>
                    <td class='title'><span>资金账户统计分析</span></td>
                </tr>
                <tr bgcolor="#FFFFFF">
                    <td align="left">
                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                            <tr>
                                <td colspan="1" style="height: 6px; width: 1188px;">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClick="LinkButton1_Click">资金账户变更</asp:LinkButton></td>
                            </tr>
                            <tr>
                                <td rowspan="3" valign="top" style="width: 1188px" align="center">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="text-align: left;" valign="top" align="left">
                                                <asp:GridView ID="GvInfo" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                                    BackColor="White" CellPadding="5" 
                                               Width="100%">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="资金账户名称">
                                                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="l1" runat="server" Text='<%# Bind("accountname") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="资金账户金额">
                                                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="l1" runat="server" Text='<%# Bind("je") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        
                                                    </Columns>
                                                    <PagerStyle BackColor="#F6F6F6" HorizontalAlign="Left" />
                                                    <HeaderStyle BackColor="#F6F6F6" />
                                                </asp:GridView>
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
