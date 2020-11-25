<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UserContral/Bootom.ascx" TagName="Bootom" TagPrefix="uc1" %>
<%@ Register Src="UserContral/top.ascx" TagName="top" TagPrefix="uc2" %>
<%@ Register Src="UserContral/left.ascx" TagName="left" TagPrefix="uc3" %>
<%@ Register Src="UserContral/NewsTop.ascx" TagName="NewsTop" TagPrefix="uc4" %>
<%@ Register Src="NewDisplayControl2.ascx" TagName="NewDisplayControl"
    TagPrefix="uc5" %>
<%@ Register Src="UserContral/Type.ascx" TagName="Type" TagPrefix="uc6" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>欢迎来到团购中心</title>
    <link href="style/default.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top: 0; text-align: center">
    <form id="form1" runat="server">
    <center>
        <table cellpadding="0" cellspacing="0" width="770">
            <tr>
                <td>
                    <uc2:top ID="Top1" runat="server" />
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
                            <td style="width: 133px; vertical-align: top;">
                                <uc3:left ID="Left1" runat="server"></uc3:left>
                            </td>
                            <td style="vertical-align: top; text-align: left">
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 9px; height: 8px">
                                            <asp:Image ID="Image12" runat="server" ImageUrl="Image/box2_01.gif" />
                                        </td>
                                        <td style="width: 764px; height: 8px">
                                            <uc4:NewsTop ID="NewsTop1" runat="server" />
                                        </td>
                                        <td style="height: 8px; width: 8px;">
                                            <asp:Image ID="Image13" runat="server" ImageUrl="Image/box2_03.gif" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-image: url(Image/box2_04.gif); height: 198px; width: 9px;">
                                        </td>
                                        <td style="height: 198px; vertical-align: top; text-align: left;">
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="font-weight: bold; font-size: 11px; color: dimgray; height: 20px;">
                                                        <asp:Image ID="Image14" runat="server" ImageUrl="Image/ct8.jpg" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="height: 94px">
                                                        &nbsp;
                                                        <uc5:NewDisplayControl ID="NewDisplayControl1" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 17px; height: 12px;">
                                                    </td>
                                                    <td style="width: 151px; height: 12px;">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="background-image: url(Image/box2_05.gif); height: 198px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 7px; width: 9px;">
                                            <asp:Image ID="Image15" runat="server" ImageUrl="Image/box2_06.gif" />
                                        </td>
                                        <td style="background-image: url(Image/box2_07.gif); height: 7px;">
                                        </td>
                                        <td style="height: 7px">
                                            <asp:Image ID="Image16" runat="server" ImageUrl="Image/box2_08.gif" />
                                        </td>
                                    </tr>
                                </table>
                                <table width="100%" style="border-top-width: 1px; border-left-width: 1px; border-left-color: darkgray;
                                    border-bottom-width: 1px; border-bottom-color: darkgray; border-top-color: darkgray;
                                    border-right-width: 1px; border-right-color: darkgray;">
                                    <tr>
                                        <td colspan="3">
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="width: 12px; height: 33px; background-image: url(Image/2t.jpg);">
                                                    </td>
                                                    <td style="background-image: url(Image/5t.jpg); width: 753px; font-weight: bold;
                                                        color: #ffffff; text-align: left;">
                                                        团购导航&lt;&lt;
                                                    </td>
                                                    <td style="background-image: url(Image/3t.jpg); width: 15px; height: 33px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="background-image: url(Image/1t.jpg); height: 114px; width: 12px;">
                                                    </td>
                                                    <td style="height: 114px">
                                                        &nbsp;<table width="100%" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td style="width: 8px; height: 8px">
                                                                    <asp:Image ID="Image6" runat="server" ImageUrl="Image/box2_01.gif" />
                                                                </td>
                                                                <td style="background-image: url(Image/box2_02.gif); width: 764px; height: 8px">
                                                                </td>
                                                                <td style="height: 8px;">
                                                                    <asp:Image ID="Image8" runat="server" ImageUrl="Image/box2_03.gif" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="background-image: url(Image/box2_04.gif); height: 179px">
                                                                </td>
                                                                <td style="height: 179px; vertical-align: top; text-align: left;">
                                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td style="height: 21px; font-weight: bold; font-size: 11px; color: dimgray;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="height: 94px;">
                                                                                &nbsp;
                                                                                <uc6:Type ID="Type1" runat="server"></uc6:Type>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="background-image: url(Image/box2_05.gif); height: 179px">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 8px">
                                                                    <asp:Image ID="Image10" runat="server" ImageUrl="Image/box2_06.gif" />
                                                                </td>
                                                                <td style="background-image: url(Image/box2_07.gif); height: 8px;">
                                                                </td>
                                                                <td style="height: 8px">
                                                                    <asp:Image ID="Image11" runat="server" ImageUrl="Image/box2_08.gif" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="background-image: url(Image/4t.jpg); height: 114px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 12px; height: 14px; background-image: url(Image/6t.jpg);">
                                                    </td>
                                                    <td style="background-image: url(Image/7t.jpg); height: 14px;">
                                                    </td>
                                                    <td style="background-image: url(Image/8t.jpg); height: 14px;">
                                                    </td>
                                                </tr>
                                            </table>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="height: 23px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="height: 21px">
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
                    <uc1:Bootom ID="Bootom1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
        </table>
    </center>
    </form>
</body>
</html>
