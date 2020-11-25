<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addGatherType.aspx.cs" Inherits="Admin_addGatherType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
     <base target="_self">
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;&nbsp;<br />
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" style="background-color: #ffffff" width="400">
                        <tr>
                            <td style="width: 8px; height: 8px">
                                <asp:Image ID="Image6" runat="server" ImageUrl="~/Image/box2_01.gif" /></td>
                            <td style="background-image: url(Image/box2_02.gif); width: 684px; height: 8px">
                            </td>
                            <td style="width: 29px; height: 8px">
                                <asp:Image ID="Image8" runat="server" ImageUrl="~/Image/box2_03.gif" /></td>
                        </tr>
                        <tr>
                            <td style="background-image: url(Image/box2_04.gif); height: 179px">
                            </td>
                            <td style="vertical-align: top; width: 684px; height: 179px; text-align: left">
                                <table cellpadding="0" cellspacing="0" style="border-right: darkgray 1px solid; border-top: darkgray 1px solid;
                                    border-left: darkgray 1px solid; border-bottom: darkgray 1px solid" width="100%">
                                    <tr>
                                        <td style="font-weight: bold; font-size: 11px; color: dimgray; height: 21px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 149px">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td style="width: 27px; height: 29px">
                                                    </td>
                                                    <td style="font-weight: bold; font-size: 15px; color: black; height: 29px">
                                                        &nbsp;添加类别</td>
                                                    <td style="width: 203px; height: 29px">
                                                    </td>
                                                    <td style="height: 29px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 11px; background-color: whitesmoke">
                                                    </td>
                                                    <td style="height: 11px; background-color: whitesmoke">
                                                    </td>
                                                    <td style="height: 11px; background-color: whitesmoke">
                                                    </td>
                                                    <td style="height: 11px; background-color: whitesmoke">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 27px; height: 55px">
                                                    </td>
                                                    <td style="font-weight: bold; color: black; height: 55px">
                                                        <asp:Label ID="Label2" runat="server" Text="请输入产品类型："></asp:Label></td>
                                                    <td style="width: 203px; height: 55px">
                                                        <asp:TextBox ID="txtTypeName" runat="server"></asp:TextBox></td>
                                                    <td style="height: 55px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 27px; height: 34px">
                                                    </td>
                                                    <td style="height: 34px">
                                                    </td>
                                                    <td style="height: 34px">
                                                    </td>
                                                    <td style="height: 34px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 27px; height: 26px">
                                                    </td>
                                                    <td style="font-size: 12px; color: darkgray; height: 26px; text-align: center">
                                                        <asp:ImageButton ID="ibtnok" runat="server" ImageUrl="~/Image/ok.jpg" OnClick="ibtnok_Click" /></td>
                                                    <td style="width: 203px; height: 26px">
                                                        <asp:ImageButton ID="ibtncancel" runat="server" ImageUrl="~/Image/cancel.jpg" OnClick="ibtncancel_Click" /></td>
                                                    <td style="height: 26px">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="background-image: url(../../Image/box2_05.gif); width: 29px; height: 179px">
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 8px">
                                <asp:Image ID="Image10" runat="server" ImageUrl="~/Image/box2_06.gif" /></td>
                            <td style="background-image: url(Image/box2_07.gif); width: 684px; height: 8px">
                            </td>
                            <td style="width: 29px; height: 8px">
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
