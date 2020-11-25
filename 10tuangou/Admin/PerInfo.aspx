<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PerInfo.aspx.cs" Inherits="Admin_PerInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;<table cellpadding="0" cellspacing="0" style="background-color: #ffffff" width="400">
                        <tr>
                            <td style="width: 8px; height: 8px">
                                <asp:Image ID="Image6" runat="server" ImageUrl="~/Image/box2_01.gif" /></td>
                            <td style="background-image: url(../../Image/box2_02.gif); width: 680px; height: 8px">
                            </td>
                            <td style="height: 8px">
                                <asp:Image ID="Image8" runat="server" ImageUrl="~/Image/box2_03.gif" /></td>
                        </tr>
                        <tr>
                            <td style="background-image: url(../../Image/box2_04.gif); height: 179px">
                            </td>
                            <td style="vertical-align: top; width: 680px; height: 179px; text-align: left">
                                <table cellpadding="0" cellspacing="0" style="border-right: darkgray 1px solid; border-top: darkgray 1px solid;
                                    border-left: darkgray 1px solid; border-bottom: darkgray 1px solid" width="100%">
                                    <tr>
                                        <td style="width: 82px; height: 29px">
                                        </td>
                                        <td style="font-weight: bold; font-size: 14px; width: 103px; color: black; height: 29px">
                                            客户详细信息</td>
                                        <td style="height: 29px">
                                        </td>
                                        <td style="height: 29px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 82px">
                                        </td>
                                        <td style="width: 103px">
                                            <asp:Label ID="Label1" runat="server" Text="联系人:"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="lixiren" runat="server"></asp:TextBox></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 82px">
                                        </td>
                                        <td style="width: 103px">
                                            <asp:Label ID="Label2" runat="server" Text="联系地址："></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="address" runat="server"></asp:TextBox></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 82px; height: 24px">
                                        </td>
                                        <td style="width: 103px; height: 24px">
                                            <asp:Label ID="Label3" runat="server" Text="性别："></asp:Label></td>
                                        <td style="height: 24px">
                                            <asp:TextBox ID="sex" runat="server"></asp:TextBox></td>
                                        <td style="height: 24px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 82px">
                                        </td>
                                        <td style="width: 103px">
                                            <asp:Label ID="Label4" runat="server" Text="固定电话："></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="phone" runat="server"></asp:TextBox></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 82px">
                                        </td>
                                        <td style="width: 103px">
                                            <asp:Label ID="Label5" runat="server" Text="手机："></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="mphone" runat="server"></asp:TextBox></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 82px">
                                        </td>
                                        <td style="width: 103px">
                                        </td>
                                        <td>
                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="关 闭" /></td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="background-image: url(../../Image/box2_05.gif); height: 179px">
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 8px">
                                <asp:Image ID="Image10" runat="server" ImageUrl="~/Image/box2_06.gif" /></td>
                            <td style="background-image: url(../../Image/box2_07.gif); width: 680px; height: 8px">
                            </td>
                            <td style="height: 8px">
                                <asp:Image ID="Image11" runat="server" ImageUrl="~/Image/box2_08.gif" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
