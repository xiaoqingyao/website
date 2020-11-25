<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderOk.aspx.cs" Inherits="OrderOk" %>

<%@ Register Src="UserContral/top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="UserContral/Bootom.ascx" TagName="Bootom" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>团购定购成功</title>
    <link href="style/default.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top:0; text-align:left; vertical-align: top; border-right: darkgray 1px solid; border-top: darkgray 1px solid; border-left: darkgray 1px solid; width: 100%; border-bottom: darkgray 1px solid; text-align:center;">
    <form id="form1" runat="server">
    <center>
    &nbsp;
        <br />
        <br />
        <table width="788" style="background-color: Olive ;" cellpadding="0" cellspacing="0" >
        <tr>
            <td style="width: 788px; height: 730px;" >
            <table width="780px" style="background-color: #ffffff;">
            <tr>
            <td style="width: 788px">
                <uc1:top ID="Top2" runat="server" />
            </td>
            </tr>
            <tr>
            <td style="width: 788px; height: 181px;">
            <table>
            <tr>
            <td style="width: 788px; height: 63px;">
                <span style="font-size: 25pt; color: #f60e35">恭喜您，订购成功!</span></td>
            </tr>
            <tr><td style="width: 788px; height: 64px; font-size: 15pt;">
                您的定单号:<asp:Label ID="Label1" runat="server" Text="Label" Width="266px" Font-Bold="True" Font-Size="Larger" ForeColor="Red" Height="29px"></asp:Label>请牢记</td></tr>
            </table>
       </td>
            </tr>
            <tr>
            <td style="width: 788px; height: 238px;"></td>
            </tr>
            <tr>
            <td style="width: 788px; height: 124px;">
                <uc2:Bootom ID="Bootom1" runat="server" />
            </td>
            </tr>
            </table>
        </td>
        </tr>
        </table>
        </center>
    </form>
</body>
</html>