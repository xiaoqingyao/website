<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GatherIndex.aspx.cs" Inherits="GatherIndex" %>

<%@ Register Src="UserContral/Bootom.ascx" TagName="Bootom" TagPrefix="uc4" %>
<%@ Register Src="UserContral/Type.ascx" TagName="Type" TagPrefix="uc5" %>
<%@ Register Src="UserContral/top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="UserContral/login.ascx" TagName="login" TagPrefix="uc2" %>
<%@ Register Src="UserContral/GatherTypeIndex.ascx" TagName="GatherTypeIndex" TagPrefix="uc3" %>
<%@ Register Src="UserContral/left.ascx" TagName="left" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>我要团购</title>
    <link href="style/default.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0; text-align: center">
    <form id="form1" runat="server">
    <center>
        <table cellpadding="0" cellspacing="0" width="770">
            <tr>
                <td>
                    <uc1:top ID="Top2" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="width: 133px">
                                <table style="width: 200px" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <uc3:left ID="Left1" runat="server"></uc3:left>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 19px">
                                            <table cellpadding="0" cellspacing="0" style="width: 100%; height: 146px; vertical-align: middle;
                                                text-align: center;">
                                                <tr>
                                                    <td style="vertical-align: bottom; height: 8px; text-align: center; background-color: #daf1f7;">
                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/9.gif" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 29px; text-align: center; background-color: #daf1f7;">
                                                        <uc3:GatherTypeIndex ID="GatherTypeIndex2" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 35px; height: 50px;">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table cellpadding="0" cellspacing="0" style="width: 100%; height: 146px; vertical-align: middle;
                                                text-align: center;">
                                                <tr>
                                                    <td style="vertical-align: bottom; height: 8px; text-align: center;">
                                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Image/9.gif" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 35px; height: 29px;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 35px; height: 50px;">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Image/webtel02.jpg" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="vertical-align: top; text-align: left">
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 12px; height: 33px; background-image: url(~/Image/2t.jpg);">
                                        </td>
                                        <td style="background-image: url(~/Image/5t.jpg); width: 753px; font-weight: bold;
                                            color: #ffffff; text-align: left;">
                                            团购导航&lt;&lt;
                                        </td>
                                        <td style="background-image: url(~/Image/3t.jpg); width: 15px; height: 33px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-image: url(../Image/1t.jpg); height: 114px; width: 12px;">
                                        </td>
                                        <td style="height: 114px">
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="width: 8px; height: 8px">
                                                        <asp:Image ID="Image6" runat="server" ImageUrl="~/Image/box2_01.gif" />
                                                    </td>
                                                    <td style="background-image: url(~/Image/box2_02.gif); width: 764px; height: 8px">
                                                    </td>
                                                    <td style="height: 8px;">
                                                        <asp:Image ID="Image8" runat="server" ImageUrl="~/Image/box2_03.gif" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="background-image: url(~/Image/box2_04.gif); height: 179px">
                                                    </td>
                                                    <td style="height: 179px; vertical-align: top; text-align: left;">
                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                           
                                                            <tr>
                                                                <td style="height: 94px;">
                                                                    &nbsp;<uc5:Type ID="Type2" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="background-image: url(~/Image/box2_05.gif); height: 179px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 8px">
                                                        <asp:Image ID="Image10" runat="server" ImageUrl="~/Image/box2_06.gif" />
                                                    </td>
                                                    <td style="background-image: url(~/Image/box2_07.gif); height: 8px;">
                                                    </td>
                                                    <td style="height: 8px">
                                                        <asp:Image ID="Image11" runat="server" ImageUrl="~/Image/box2_08.gif" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="background-image: url(~/Image/4t.jpg); height: 114px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 12px; height: 14px; background-image: url(~/Image/6t.jpg);">
                                        </td>
                                        <td style="background-image: url(~/Image/7t.jpg); height: 14px;">
                                        </td>
                                        <td style="background-image: url(~/Image/8t.jpg); height: 14px;">
                                        </td>
                                    </tr>
                                </table>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 133px">
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <uc4:Bootom ID="Bootom1" runat="server" />
                </td>
            </tr>
        </table>
    </center>
    </form>
</body>
</html>
